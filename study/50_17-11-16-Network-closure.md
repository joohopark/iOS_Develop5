# 50_17-11-16

---

## IOS NetWork 

Network를 사용하기 위해서 Thread 를 분리해서 사용해야합니다. Network 데이터를 처리하는 부분은 비동기 처리를 하게 되는데, netWork에서 받아온 데이터를 필요한 시점에서 사용하기위해서 Data에 따라서 UI가 변하는 `시점`을 고려해주어야 하는데, 이 부분을 해결하기 위한 여러가지 방법중 Closure 를 사용해서 해결하는 방법을 알아보겠습니다. 

```swift
import Foundation


** DataModel 부분.
class WeatherDataModel {
  
  static var Main: WeatherDataModel = WeatherDataModel()
  open let baseURL:String = "https://api.openweathermap.org/data/2.5/weather?"
  open let appid:String = "&APPID=646f4d9bc930541a09dcfc5e6eb91c23"
  
  typealias networkDataList = (_ Data: Data?,_ response: URLResponse?,_ error: Error?) -> Void
  
  private init() {
//            setData()
  }
  
  func setData(completion: @escaping networkDataList) -> String {
    
    let locationCoordinate = setCoordinates()
    let url: URL! = URL(string: "\(baseURL)\(locationCoordinate)\(appid)")
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    let session = URLSession.shared
    
    
    session.dataTask(with: url) { (data, response, error) in
      // error 처리는 여기에서
      if let error = error {
        
        completion(nil, nil, error)
        print("어떤 에러 발생")
      }
      let getStatusCode = (response as! HTTPURLResponse).statusCode
      
      completion(getStatusCode as? Data, nil, nil)
      // url로 넣을 데이터가 잘 들어가서 성공한경우
      if getStatusCode / 100 == 2 {
        // json 데이터 핸들링 하자
        
      }else {
        
      }
      }.resume()
    
    return "함수 끝낫다. 값한번 확인해봐라~" ;print("함수 끝낫다. 값한번 확인해봐라~")
  }
  
  fileprivate func setCoordinates(longi: String = "35", lati: String = "139") -> String {
    let returnCoordinates = "lat=\(longi)&lon=\(lati)"
    return returnCoordinates
  }
}

** Main ViewController 부분



class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ** 아래의 부분에서 `WeatherDataModel.Main.setData` 에는, SetData의 return 값이 담겨 있고, 
        
        각각 Data, Response, error 에는 , 값을 캡쳐하기 위해서 심어놓은 Closure 가 실행 된후, 캡쳐된 값들이 Data, Response, Error 에 각각 담겨서 넘어와있습니다.        
        그래서 원하는 시점에 사용이 가능합니다.
        print(WeatherDataModel.Main.setData { (data, response, error) in
          print(data, response, error)
          
    })
  }

}


```

> 목적은 SetData 에서, 데이터 Set을 하게되는데, 이때 dataTask 에서 URL 요청에 대한 값을 비동기로 처리합니다. 저 함수가 실행 되고, return 값까지 날리는 시점에 원하는 데이터의 비동기 처리가 끝나지 않았을수도 있습니다. 그 시점을 마추어 주기 위해서, Closure 를 사용합니다
> 
> 




---

## Reference 

[closure](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Closures.html#//apple_ref/doc/uid/TP40014097-CH11-ID103) <br>
[URL Session Documents](https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/URLLoadingSystem/URLLoadingSystem.html)<br>
[closure 까질코더님 블로그](http://kka7.tistory.com/9)