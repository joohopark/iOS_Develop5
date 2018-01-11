//api.openweathermap.org/data/2.5/weather?lat=35&lon=139

import UIKit
import CoreLocation

class MainViewController: UIViewController {
  
  @IBOutlet weak var cityLB: UILabel!
  @IBOutlet weak var temperatureLB: UILabel!
  @IBOutlet weak var weatherImage: UIImageView!
  @IBOutlet weak var indicate: UIActivityIndicatorView!
  var locationManager: CLLocationManager = CLLocationManager()
  var startLocation: CLLocation!
  
  let baseURL: String = "https://api.openweathermap.org/data/2.5/weather?"
  let imaURL: String = "https://openweathermap.org/img/w/"
  let lati = "" //lat=35&
  let longi = "" //lon=139"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let gradient = CAGradientLayer()
    gradient.frame = view.bounds
    gradient.colors = [UIColor(red:0.61, green:0.57, blue:0.77, alpha:0.9).cgColor,
                       UIColor(red:0.45, green:0.44, blue:0.63, alpha:0.92).cgColor,
                       UIColor(red:0.34, green:0.35, blue:0.55, alpha:0.93).cgColor,
                       UIColor(red:0.24, green:0.28, blue:0.47, alpha:1.00).cgColor]
    view.layer.insertSublayer(gradient, at: 0)
    
    indicate.startAnimating()
    locationManager.desiredAccuracy = kCLLocationAccuracyBest
    locationManager.requestWhenInUseAuthorization()
    locationManager.delegate = self
    locationManager.startUpdatingLocation()
  }
}

extension MainViewController: CLLocationManagerDelegate {
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    guard let locationCoordinate = locations.last?.coordinate else { return }
    locationManager.stopUpdatingLocation()
    
    let lati = Float(CGFloat(locationCoordinate.latitude))
    let longi = Float(CGFloat(locationCoordinate.longitude))
    
    WeatherDataManager.shread.setCurrentWeather(lati: lati, longi: longi) { (ok, data, error) in
      DispatchQueue.main.async {
        let currentData = data as! [String:Any]
        let imageData = try! Data(contentsOf: URL(string: "\(self.imaURL)\(currentData["icon"] as! String).png")!)
        
        self.cityLB.text = currentData["name"] as! String
        self.temperatureLB.text = String((currentData["temp"] as! Float).rounded()) + "°"
        self.weatherImage.image = UIImage(data: imageData)
        
        self.indicate.stopAnimating()
        self.indicate.isHidden = true
      }
    }
  }
}
