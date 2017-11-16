
import UIKit

class AddViewController: UIViewController {

    var searchController: UISearchController?
    @IBOutlet weak var tableView: UITableView!
    
    var weatherData = WeatherData.Main
    
    var dataSourceOrigin = WeatherData.Main.SearchCityNameList
    var dataSource: [String] = []
    
    @IBOutlet weak var tableViewInAddViewController: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
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
            return dataSource.count ?? 0
        }
        
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        if searchController?.isActive == false {
            print("비활성")
//            cell.textLabel?.text = "\(indexPath.row)"
        }else {
            
            if let allData = WeatherData.Main.SearchWeatherList {
                
                cell.textLabel?.text = "\((allData[indexPath.row]["name"]) as! String)  "
                return cell
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
        
        let cityName = dataSourceOrigin![indexPath.row]
        
        let url: URL! = URL(string: "\(WeatherData.Main.baseURL)\(cityName)\(WeatherData.Main.appid)")
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
                    
                    WeatherData.Main.weatherList?.append(tempDic)
                   
                    print(WeatherData.Main.weatherList)
                } catch let error {
                    print("\(error.localizedDescription)")
                }
            }
            }.resume()
        
        print("셀선택")
        self.navigationController?.popViewController(animated: true)
    }
    
    
}


extension AddViewController: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        // TODO
        let searchBar = searchController.searchBar
        print(dataSourceOrigin)
        if searchBar.text != nil && searchBar.text!.count > 0 {
            dataSource = (dataSourceOrigin?.filter({
                $0.contains(searchBar.text!)
            }))!
            
        } else {
            print(dataSource)
            dataSource.removeAll()
            dataSource = dataSourceOrigin!
            print(dataSource)
        }
//
        tableView.reloadData()
        
    }
}




