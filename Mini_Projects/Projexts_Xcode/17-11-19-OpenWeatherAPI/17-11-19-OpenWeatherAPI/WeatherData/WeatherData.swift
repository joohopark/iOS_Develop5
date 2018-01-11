//"name": "Gorkhā",
//"country": "NP",
//"coord": {
//  "lon": 84.633331,
//  "lat": 28

//https://api.openweathermap.org/data/2.5/weather?lat=44.16679&lon=-80.8164215&APPID=646f4d9bc930541a09dcfc5e6eb91c23


import Foundation
class WeatherDataManager {
  static var shread: WeatherDataManager = WeatherDataManager()
  let baseURL: String = "https://api.openweathermap.org/data/2.5/weather?"
  let appid: String = "&APPID=646f4d9bc930541a09dcfc5e6eb91c23"
  let session = URLSession.shared
  var returnDic:[String:Any]?
  var searchJsonData: [WeatherInfo]?
  
  var choiceWeatherData: [[String:Any]] = []
  

  
  typealias Completion = (_ isSuccess: Bool,_ returnValue: Any?,_ error:Error?) -> Void
  
  private init() {
    loadJsonData()
  }
  
  func setChoiceWeather(lati: Float, longi: Float, completion: @escaping Completion)  {
    let strLati = "lat=\(lati)&"
    let strLongi = "lon=\(longi)"
    
    
    let url: URL = URL(string: baseURL+strLati+strLongi+self.appid)!
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    
    session.dataTask(with: request) { (data, response, error) in
      let code = (response as! HTTPURLResponse).statusCode
      
      
      if let data = data {
        let Arr = try! JSONSerialization.jsonObject(with: data, options: []) as! [String:Any]
        
        let name = Arr["name"]
        let temp = ((Arr["main"] as! [String:Any])["temp"] as! Float)-273
        let icon = (Arr["weather"] as! [[String: Any]])[0]["icon"]
        let appendData = ["name":name, "temp":temp, "icon":icon]
        
        self.choiceWeatherData.append(appendData)
        
        completion(true, self.choiceWeatherData, error)
      }
      
      
      
      }.resume()
  }
  
  func setCurrentWeather(lati: Float, longi: Float, completion: @escaping Completion)  {
    let strLati = "lat=\(lati)&"
    let strLongi = "lon=\(longi)"
    
    
    let url: URL = URL(string: baseURL+strLati+strLongi+self.appid)!
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    
    session.dataTask(with: request) { (data, response, error) in
      let code = (response as! HTTPURLResponse).statusCode
      
      
      if let data = data {
          let Arr = try! JSONSerialization.jsonObject(with: data, options: []) as! [String:Any]

        let name = Arr["name"]
        let temp = ((Arr["main"] as! [String:Any])["temp"] as! Float)-273
        let icon = (Arr["weather"] as! [[String: Any]])[0]["icon"]
        self.returnDic = ["name":name, "temp":temp, "icon":icon]
        
        completion(true, self.returnDic, error)
      }
      
      
        
    }.resume()
  }
  
  
  func loadJsonData() {
    if let path = Bundle.main.path(forResource: "CityList", ofType: "json"), let contents = try? String(contentsOfFile: path), let data = contents.data(using: .utf8) {
      
      let cityDic = try! JSONSerialization.jsonObject(with: data, options: []) as! [[String: Any]]
      self.searchJsonData = []
      
      for city in cityDic {
        self.searchJsonData?.append(WeatherInfo(dumiData: city)!)
      }
    }
  }
  
  
}


struct WeatherInfo {
  var name: String!
  var coord: [String:Float]?
  
  init?(dumiData: [String:Any]) {
    self.name = dumiData["name"] as! String
    self.coord = dumiData["coord"] as! [String:Float]
  }
  
  
}
