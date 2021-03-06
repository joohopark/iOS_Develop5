import Foundation


class WeatherData {
  
  var weatherList: [[String:Any]]?
  var SearchWeatherList: [[String:Any]]?
  var SearchCityNameList: [String]!
  
  static var Main: WeatherData = WeatherData()
  let baseURL:String = "https://api.openweathermap.org/data/2.5/weather?q="
  let appid:String = "&APPID=646f4d9bc930541a09dcfc5e6eb91c23"
  
  private init() {
    setData()
    setSearchData()
//    setAllSearchdata()
  }
  
  func setData() {
    weatherList = []
    var imageData: Data?
    var imageURLString: String?
    
    var locationName: String?
    var locationTemp: Float?
    
    let cityName = "Seoul"
    
    let url: URL! = URL(string: "\(baseURL)\(cityName)\(appid)")
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    let session = URLSession.shared
    
    session.dataTask(with: request) { (data, response, error) in
      print(data, response, error)
      
      // 데이터 가져오기
      if let data = data {
        do {
          let Arr = try JSONSerialization.jsonObject(with: data, options: []) as! [String:Any]
          
          // locationName
          
          locationName = Arr["name"] as! String
          // locationTemp
          let tempKeyValue = Arr["main"] as! [String:Any]
          let tempValue = ((tempKeyValue["temp"] as! Float) - 273).rounded()
          locationTemp = tempValue
          
          //locationImage
          let weatherKeyValue = Arr["weather"] as! [[String: Any]]
          let iconURLValue: String = (weatherKeyValue[0]["icon"] as? String)!
          
          imageData = try Data(contentsOf: URL(string: "https://openweathermap.org/img/w/\(iconURLValue).png")!)
          
          let tempDic = ["name": locationName,
                         "temp": locationTemp,
                         "icon": imageData] as [String : Any]
          
          
          self.weatherList?.append(tempDic)
          
        } catch let error {
          print("\(error.localizedDescription)")
        }
      }
      }.resume()
    
  }
  
  
  func setSearchData() {
    self.SearchWeatherList = []
    self.SearchCityNameList = []
    var imageData: Data?
    var imageURLString: String?
    
    var locationName: String?
    var locationTemp: Float?
    let cityNameList:[String] = ["Japan",
                                 "Barcelona",
                                 "Incheon",
                                 "Daejeon",
                                 "Anseong",
                                 "Kaesong",
                                 "Thika",
                                 "Shuya",
                                 "Novomoskovsk",
                                 "Chino",
                                 "Germann",
                                 "Cottonwood",
                                 "Darazo",
                                 "Damaturu",
                                 "Chinandega",
                                 "Boaco",
                                 "Zundert"]
    
    
    for item in cityNameList {
      let url: URL! = URL(string: "\(baseURL)\(item)\(appid)")
      var request = URLRequest(url: url)
      request.httpMethod = "GET"
      let session = URLSession.shared
      
      session.dataTask(with: request) { (data, response, error) in
        //            print(data, response, error)
        
        // 데이터 가져오기
        if let data = data {
          do {
            let Arr = try JSONSerialization.jsonObject(with: data, options: []) as! [String:Any]
            
            // locationName
            
            locationName = Arr["name"] as! String
            // locationTemp
            let tempKeyValue = Arr["main"] as! [String:Any]
            let tempValue = ((tempKeyValue["temp"] as! Float) - 273).rounded()
            locationTemp = tempValue
            
            //locationImage
            let weatherKeyValue = Arr["weather"] as! [[String: Any]]
            let iconURLValue: String = (weatherKeyValue[0]["icon"] as? String)!
            
            imageData = try Data(contentsOf: URL(string: "https://openweathermap.org/img/w/\(iconURLValue).png")!)
            
            let tempDic = ["name": locationName,
                           "temp": locationTemp,
                           "icon": imageData] as [String : Any]
            
            self.SearchCityNameList?.append(locationName!)
            self.SearchWeatherList?.append(tempDic)
            
            
          } catch let error {
            print("\(error.localizedDescription)")
          }
        }
        }.resume()
    }
    
  }
  
//  func setAllSearchdata() {
//    
//    // bundle 데이터 가져오기
//    
//    DispatchQueue.global().async {
//      if let path = Bundle.main.path(forResource: "CityList", ofType: "json"),
//        let contents = try? String(contentsOfFile: path),
//        let data = contents.data(using: .utf8) {
//        let cityDic = try! JSONSerialization.jsonObject(with: data, options: []) as! [[String: Any]]
//        
//        for i in cityDic {
//          let nameItem = i["name"] as! String
//          self.SearchCityNameList.append(nameItem)
//        }
//        DispatchQueue.main.async {
//          //            self.loadingIndicator.stopAnimating()
//          //            print(self.cityNameArray)
//          //            print(self.cityList.count)
//          //            self.setupSearchBar()
//          //            self.cityTableView.reloadData()
//        }
//      }
//    }
//  }
  
  
}
