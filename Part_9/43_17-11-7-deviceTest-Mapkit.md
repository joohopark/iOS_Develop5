# 43-17-11-7

---

## 기기 테스트(app 개발자 등록), MapKit

---

## 기기 테스트

- #### Reference 

[app 개발자 등록하는방법](http://tech.whatap.io/2016/04/27/apple-개발자-계정-등록하기/)<br> 
[App Distribution Guide](https://developer.apple.com/library/content/documentation/IDEs/Conceptual/AppDistributionGuide/Introduction/Introduction.html)<br> 
[IOS 인증서 만들기](http://comxp.tistory.com/298) 

- #### Developer Center <br>
	- cetification <br>
	- AppID-bundleID <br>
	- Device ID - UUID <br>

- app store 에 올리는 방법은 2가지 <br>
	- 하나는 xCode를 통해서 <br>
	- 하나는 app load를 통해서 올려야함 <br>

> Xcode Project를 올릴때는 압축파일로 올려야합니다.

---


## MapKit

#### - Framework import 

```swift
import UIKit 
import MapKit
class ViewController: UIViewController {
}
```

#### - 용어

* Region : 지역 (MKCoordinateRegion사용)<br>
* Span : 펼쳐진 영역(zoom level) - (MKCoordinateSpan사용)<br>
	- one degree of latitude is always approximately 111 kilometers
* Location Coordinate : 좌표 <br>
* latitude : 위도 (wgs84 좌표계 사용) <br>
* longitude : 경도 (wgs84 좌표계 사용) <br>

#### - 초기 좌표 설정

```swift
** case 1
let regionRadius: CLLocationDistance = 1000
let location = CLLocation(latitude: 37.515675, longitude: 127.021378)
let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
regionRadius * 2.0, regionRadius * 2.0)
mapView.setRegion(coordinateRegion, animated: true)

** case 2
let location = CLLocation(latitude: 37.515675, longitude: 127.021378)
let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
let coordinateRegion = MKCoordinateRegionMake(location.coordinate, span)
mapView.setRegion(coordinateRegion, animated: true)
```

---

## Pin 추가(Add Annotation)

여기서 조금 짚고 넘어가야 하는것은 Anonotation 은 `MKAnnotation Protocol` 이다. 쉽게 latitude, longitude 를 갖기 위한 프로토콜이고, 핀을 찍어주는 모습은 View로 구현이 되어있는것입니다. AnnotationView랑, Annotation이랑은 서로 type가 다르다는 것을 인지하고 넘어가야 합니다.

```swift
public protocol MKAnnotation : NSObjectProtocol {
          // Center latitude and longitude of the annotation view.
          // The implementation of this property must be KVO compliant.
          public var coordinate: CLLocationCoordinate2D { get }
          // Title and subtitle for use by selection UI.
          optional public var title: String? { get }
          optional public var subtitle: String? { get }
}
```

---

## CustomAnnotation Example

```swift
class CustomAnnotation:NSObject, MKAnnotation {
         var coordinate: CLLocationCoordinate2D
         var title: String?
         var subtitle: String? 
         init(title: String,  coordinate: CLLocationCoordinate2D) {
             self.title = title
             self.coordinate = coordinate
             } 
       }       
** 사용되어 질곳에서
let customPin = CustomAnnotation(title: "Sample", coordinate: location.coordinate)
mapview.addAnnotation(customPin)
customPin을 mapView에 꼿아 줍니다..!
```

> CustomAnnotation 을 만들때, NSObject, MKAnnotation 두개를 상속받아야 합니다, 이유는 MKAnnotation 이 NSObjectProtocol 을 체텍 했기때문에, NSObject의 어느부분을 사용해야하는지 정확히 모르기 때문입니다.
> 

---

## MKMapViewDelegate 

```swift
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
```

> Pin을 꼽을때 불려지는 Delegate 입니다. annotation 을 재사용하면서, pin을 계속해서 추가해줍니다. 이때 pin 속에, MKPinAnnotationView를 만들어서, 그 View에 AccessoryView를 넣어서 만들어 줄수 있습니다.
> 

---

## 사용자 위치 설정 

* 사용자 허용
	1. info.plist 항목 추가 (택1) - ios 10 이상 <br>
		- Privacy - Location When In Use Usage Description  : YES <br>
		- Privacy - Location Always Usage Description : YES <br>
 
* Location Manager 객체 생성 (CLLocationManager) <br>
	- let manager = CLLocationManager() <br>

	2. 현 위치 요청 인증 <br>
		- manager.requestAlwaysAuthorization() <br>
		- manager.requestWhenInUseAuthorization() <br>
		- 위의 함수중 하나만 사용해서, 사용자의 위치를 app이 켜졌을때만, 혹은 계속 위치 정보를 가져올수 있습니다.<br>
		
	3. 업데이트 <br>
		- manager.startUpdatingLocation() <br>
		- manager.stopUpdatingLocation() <br>
		- location 정보를 계속 업데이트 하고, 끄고 할수 있습니다. 


---

## 사용자 위치 설정 예제

```swift
 let manager = CLLocationManager()
 manager.delegate = self
 // 아래의 코드 둘중 한개만 사용해야 합니다..! 위치정보를 받는 권한 요청
 manager.requestAlwaysAuthorization()
 manager.requestWhenInUseAuthorization()
 manager.desiredAccuracy = kCLLocationAccuracyBest
 manager.startUpdatingLocation()
```

---

## CLLocationManagerDelegate 

```swift
func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
	if let nowLocation = locations.last {
	//nowLocation 가지고 위치정보 가져오기 
	}
}
```

---

## 응용 

1. long touch 를 하게되면, 그 위치에 Pin 지정
2. 버튼을 누르면, 실시간으로 위치정보를 받아서, 지도 프레임 업데이트<br>


![screen](/study/video-gif/mapKit.gif)


```swift
** 1. 버튼 누르면, 그위치에 Pin 생성
class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var textView: UITextView!   
    var currentBtn: UIButton?
    var longTouch: UILongPressGestureRecognizer?
    var isTrackingLocation: Bool = false
    var trackingLocationLog: [CLLocationCoordinate2D] = []
    
	override func viewDidLoad() {
        super.viewDidLoad()
        longTouch = UILongPressGestureRecognizer(target: self,action: #selector(self.longTouchAction(_:)))
        mapView.addGestureRecognizer(longTouch!)
		}

        
        
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
** 버튼 누르면, 실시간으로 위치 데이터 업데이트 + 프레임 이동 
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
        let regionRadius: CLLocationDistance = 1000
        let location = CLLocation(latitude: 37.30903518, longitude: 126.87091151)
        if let currentLocation = self.trackingLocationLog.last {
            let coordinateRegion = MKCoordinateRegionMakeWithDistance(currentLocation, regionRadius*2, regionRadius*2)
            mapView.setRegion(coordinateRegion, animated: true)
        }
    }
```

---

## Reference 

[app 개발자 등록하는방법](http://tech.whatap.io/2016/04/27/apple-개발자-계정-등록하기/)<br> 
[App Distribution Guide](https://developer.apple.com/library/content/documentation/IDEs/Conceptual/AppDistributionGuide/Introduction/Introduction.html)<br> 
[IOS 인증서 만들기](http://comxp.tistory.com/298) 















