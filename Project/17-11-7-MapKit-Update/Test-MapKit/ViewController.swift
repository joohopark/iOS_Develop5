

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var textView: UITextView!
    
    var currentBtn: UIButton?
    var longTouch: UILongPressGestureRecognizer?
    
    let manager = CLLocationManager()
    var isTrackingLocation: Bool = false
    var trackingLocationLog: [CLLocationCoordinate2D] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.startUpdatingLocation()
        
        let regionRadius: CLLocationDistance = 1000
        let location = CLLocation(latitude: 37.515675, longitude: 127.021378)
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius*2, regionRadius*2)
        mapView.setRegion(coordinateRegion, animated: true)
        
        mapView.isZoomEnabled = true
        mapView.delegate = self
        
        
        
        currentBtn = UIButton()
        currentBtn = UIButton(frame: CGRect(origin: CGPoint.init(x: mapView.bounds.size.width*0.8,
                                                                 y: mapView.bounds.size.height*0.8),
                                            size: CGSize(width: 40, height: 40)))
        currentBtn?.layer.cornerRadius = 20
        currentBtn?.backgroundColor = UIColor.gray
        currentBtn?.alpha = 0.5
        currentBtn?.addTarget(self, action: #selector(currentBtnAction(_:)), for: .touchUpInside)

        longTouch = UILongPressGestureRecognizer(target: self,action: #selector(self.longTouchAction(_:)))
        mapView.addGestureRecognizer(longTouch!)
        
        
        mapView.addSubview(currentBtn!)
        
    
        
    }
    
    // 핀을 꼽는데, 핀을 꼽을때 정보를 넣어주는것 같음.
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        print("\(annotation), \(annotation.coordinate), \(annotation.coordinate.latitude)")
        
        
        if let annotation = annotation as? CustomAnnotation {
            let identity = "pin"
            var pinView: MKPinAnnotationView
            
            if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identity) as? MKPinAnnotationView{
                dequeuedView.annotation = annotation
                pinView = dequeuedView
            }else {
                pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identity)
                pinView.canShowCallout = true
                pinView.calloutOffset = CGPoint(x: -5, y: 5)
                pinView.pinTintColor = UIColor.blue
                pinView.animatesDrop = true
                
                pinView.tintColor = .blue
                pinView.rightCalloutAccessoryView = UIButton(type: .infoDark) as UIView
            }
            return pinView
        }
        
        return nil
    }
    
    //롱터치
    @objc func longTouchAction(_ sender: UILongPressGestureRecognizer) {
        
        if sender.state != UIGestureRecognizerState.began { return }
        if let locationView = self.mapView{
            // mapView의 frame location 을 받아서, 터치시, mapView의 location 으로 변환.
            let touchLocation = sender.location(in: locationView)
            let locationCoordinate = locationView.convert(touchLocation, toCoordinateFrom: locationView)
            
            let customPin = CustomAnnotation(title: "Sample", coordinate: locationCoordinate)
            self.mapView.addAnnotation(customPin)
        }
    }
    
    @objc func currentBtnAction(_ sender: UIButton) {
        // 클릭시 버튼 색상 변경
        UIView.animate(withDuration: 1) {
            if self.isTrackingLocation == false {
                self.isTrackingLocation = true
                self.currentBtn?.backgroundColor = .red
            }else {
                self.isTrackingLocation = false
                self.currentBtn?.backgroundColor = .gray
            }
        }
        print(self.isTrackingLocation)
        
        // 누르면 실시간으로 이동하는곳으로 프레임 이동
        let regionRadius: CLLocationDistance = 1000
        let location = CLLocation(latitude: 37.30903518, longitude: 126.87091151)
        if let currentLocation = self.trackingLocationLog.last {
            let coordinateRegion = MKCoordinateRegionMakeWithDistance(currentLocation, regionRadius*2, regionRadius*2)
            mapView.setRegion(coordinateRegion, animated: true)
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // location 값을 업데이트 시킬때마다 불리는 녀석이다,
        if let nowLocation = locations.last {
            self.trackingLocationLog.append(nowLocation.coordinate)
            
            if self.isTrackingLocation == true {
                let regionRadius: CLLocationDistance = 1000
                if let currentLocation = self.trackingLocationLog.last {
                    let coordinateRegion = MKCoordinateRegionMakeWithDistance(currentLocation, regionRadius*2, regionRadius*2)
                    mapView.setRegion(coordinateRegion, animated: true)
                }
            }else {
                
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


