
import UIKit

class AddViewController: UIViewController {
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var indicator: UIActivityIndicatorView!
  
  var weatherData = WeatherData.Main
  var searchController: UISearchController?
  
  var dataSourceOrigin = WeatherData.Main.SearchCityNameList
  var dataSource: [String]? = []
  
  @IBOutlet weak var tableViewInAddViewController: UITableView!
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.indicator.startAnimating()
    self.tableView.isUserInteractionEnabled = false
    
    
    DispatchQueue.global().async {
      if let path = Bundle.main.path(forResource: "CityList", ofType: "json"),
        let contents = try? String(contentsOfFile: path),
        let data = contents.data(using: .utf8) {
        let cityDic = try! JSONSerialization.jsonObject(with: data, options: []) as! [[String: Any]]
        for city in cityDic {
          let appendCityName = city["name"] as! String
          WeatherData.Main.SearchCityNameList.append(appendCityName)
        }
        DispatchQueue.main.async {
          //          self.var searchController: UISearchController?.stopAnimating()
          self.indicator.stopAnimating()
          self.indicator.isHidden = true
          self.tableView.reloadData()
          
          self.tableView.isUserInteractionEnabled = true
        }
      }
    }
    
    //searchViewController
    searchController = UISearchController(searchResultsController: nil)
    self.navigationItem.searchController = searchController
    
    searchController?.searchResultsUpdater = self
    
    // 즉시 상호작용?
    searchController?.obscuresBackgroundDuringPresentation = false
    searchController?.searchBar.placeholder = "Search City"
    navigationItem.searchController = searchController
    definesPresentationContext = true
  }
  override func viewDidAppear(_ animated: Bool) {
    tableView.reloadData()
  }
  
  
  
}

extension AddViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    if searchController?.isActive == false {
      return weatherData.SearchWeatherList?.count ?? 0
    }else{
      return dataSource!.count-1 ?? 0
    }
    
    
    
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    
    if searchController?.isActive == false {
      print("비활성")
      //            cell.textLabel?.text = "\(indexPath.row)"
      return cell
    }else {
      if let allData = self.dataSource {
        
        do {
          let celltext: String = try dataSource![indexPath.row]
          
          cell.textLabel?.text = "\(celltext)"
          return cell
        }catch let error {
          print("error")
        }
        
      }
    }
    return cell
    
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let cell = tableView.cellForRow(at: indexPath)
    var imageData: Data?
    var imageURLString: String?
    
    var locationName: String?
    var locationTemp: Float?
    
    print(cell?.textLabel?.text)
    
    let selectedIndex = dataSourceOrigin?.index(of: (cell?.textLabel?.text)!)
    let cityName = dataSourceOrigin![selectedIndex!]
    
    let url: URL! = URL(string: "\(WeatherData.Main.baseURL)\(cityName)\(WeatherData.Main.appid)")
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    let session = URLSession.shared
    
    session.dataTask(with: request) { (data, response, error) in
      
      
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
          
          WeatherData.Main.weatherList?.append(tempDic)
          
          DispatchQueue.main.async{
            self.navigationController?.popViewController(animated: true)
            
          }
        } catch let error {
          print("\(error.localizedDescription)")
        }
      }
      }.resume()
  }
}

extension AddViewController: UISearchResultsUpdating {
  // MARK: - UISearchResultsUpdating Delegate
  func updateSearchResults(for searchController: UISearchController) {
    // TODO
    let searchBar = searchController.searchBar
    
    if searchBar.text != nil && searchBar.text!.count > 0 {
      ///////////////////
      
      var list:[String] = []
      let item = DispatchWorkItem {[unowned self] in
        
        
        
        //        print(self.dataSource, self.dataSourceOrigin)
        
        DispatchQueue.main.async {
          self.dataSource = (self.dataSourceOrigin?.filter({
            $0.contains(searchBar.text!)
          }))!
          
          self.tableView.reloadData()
          //          self.cityNameArray = list
          //          self.cityTableView.reloadData()
        }
      }
      
      DispatchQueue.global().async(execute: item)
      
      
      //////////////////
      
    } else {
      dataSource?.removeAll()
      dataSource! += dataSourceOrigin!
      
    }
    //
    tableView.reloadData()
    
  }
}




