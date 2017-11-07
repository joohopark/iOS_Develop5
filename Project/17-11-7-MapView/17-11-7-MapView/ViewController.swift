

import UIKit
import MapKit
//import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var textView: UITextView!
    var textList: [CLLocationCoordinate2D]?
    
    var currentBtn: UIButton?
    let manager = CLLocationManager()
    
    var stringList: [String] = []
    var textViewOnText = ""
    
    
    
    var longTouch: UILongPressGestureRecognizer?
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.isZoomEnabled = true
        mapView.delegate = self
        mapView.showsUserLocation = true
        
        

        //location manager
        manager.delegate = self
        //위치정보를 사용하기위한 요청/ 아래의 두개중 하나만 골라서 인증함
        manager.requestWhenInUseAuthorization()
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.startUpdatingLocation()
        
        //locationManager 사용하기 위한 준비>?
        longTouch = UILongPressGestureRecognizer(target: self,action: #selector(self.longTouchAction(_:)))
        
        let coordinate = CLLocationCoordinate2DMake(37.497948, 127.027563)
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        
        currentBtn = UIButton()
        currentBtn = UIButton(frame: CGRect(origin: CGPoint.init(x: mapView.bounds.size.width*0.8,
                                                                 y: mapView.bounds.size.height*0.8),
                                            size: CGSize(width: 40, height: 40)))
        currentBtn?.layer.cornerRadius = 20
        currentBtn?.backgroundColor = UIColor.gray
        currentBtn?.alpha = 0.5
        currentBtn?.addTarget(self, action: #selector(currentBtnAction(_:)), for: .touchUpInside)

        mapView.addGestureRecognizer(longTouch!)
        mapView.addSubview(currentBtn!)
        mapView.setRegion(region, animated: true)
        
        
    }
    @objc func longTouchAction(_ sender: UILongPressGestureRecognizer) {
        //let customPin = CustomAnnotation(title: "테스트위치", coordinate: self.mapView.)
        print(manager.location?.coordinate, manager.location?.course)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        print("이놈은 언제 불리나?, \(mapView), \(annotation)")
        
        
        if let annotation = annotation as? CustomAnnotation {
            let identity = "pin"
            var pinView: MKPinAnnotationView
            
            if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identity) as? MKPinAnnotationView {
                dequeuedView.annotation = annotation
                pinView = dequeuedView
            } else {
                pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identity)
                pinView.canShowCallout = true
                pinView.calloutOffset = CGPoint(x: -5, y: 5)
                pinView.rightCalloutAccessoryView = UIButton(type: .infoDark) as UIView
            }
            return pinView
        }
        return nil
        
    }
    func convert(_ point: CGPoint, toCoordinateFrom view: UIView?) -> CLLocationCoordinate2D {
        
        
        return CLLocationCoordinate2D(latitude: 37.33233141, longitude: -122.03121860)
    }
    
    
    
    @objc func currentBtnAction(_ sender: UIButton) {
        // 클릭시 버튼 색상 변경
        UIView.animate(withDuration: 1) {
            self.currentBtn?.backgroundColor = .red
            UIView.animate(withDuration: 2) {
                self.currentBtn?.backgroundColor = .gray
            }
        }
        
        
        
        let customPin = CustomAnnotation(title: "Sample", coordinate: mapView.centerCoordinate)
        self.mapView.addAnnotation(customPin)
    }
    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if let nowLocation = locations.last {
            var currentCoordinate = "latitude: \(nowLocation.coordinate.latitude) \n longitude: \(nowLocation.coordinate.longitude)"
            stringList.append(currentCoordinate)
            for i in stringList {
                textViewOnText += i + "\n \n"
                print(i)
            }
            textView.text = textViewOnText
            print(textList, textViewOnText)
            if stringList.count == 10 {
                manager.stopUpdatingLocation()
        
            }
        }
    }
}






class CustomAnnotation:NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(title: String,  coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
    }
}

