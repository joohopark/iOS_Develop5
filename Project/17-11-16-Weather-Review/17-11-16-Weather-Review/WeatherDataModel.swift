import Foundation


class WeatherDataModel {
    
    static var Main: WeatherDataModel = WeatherDataModel()
    open let baseURL:String = "https://api.openweathermap.org/data/2.5/weather?"
    open let appid:String = "&APPID=646f4d9bc930541a09dcfc5e6eb91c23"
    
    typealias networkDataList = (_ Data: Data?,_ response: URLResponse?,_ error: Error?) -> Void
    
    private init() {
//        setData()
    }
    
    func setData(completion: @escaping networkDataList) {
        
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
        }

    fileprivate func setCoordinates(longi: String = "35", lati: String = "139") -> String {
        let returnCoordinates = "lat=\(longi)&lon=\(lati)"
        return returnCoordinates
    }
}
