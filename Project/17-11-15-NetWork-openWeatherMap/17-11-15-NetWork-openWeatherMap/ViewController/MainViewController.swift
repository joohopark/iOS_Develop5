

import UIKit

class MainViewController: UIViewController {

    
    var imageData: Data?
    var imageURLString: String?
    
    var locationName: String?
    var locationTemp: Float?
    
    let weatherInstance = WeatherData.Main
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let url: URL! = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=Seoul&APPID=646f4d9bc930541a09dcfc5e6eb91c23")
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let session = URLSession.shared
        
        session.dataTask(with: request) { (data, response, error) in
            
            
            // 데이터 가져오기
            if let data = data {
                do {
                    let Arr = try JSONSerialization.jsonObject(with: data, options: []) as! [String:Any]
                    
                    // locationName
                    self.locationName = Arr["name"] as! String
                    
                    // locationTemp
                    let tempKeyValue = Arr["main"] as! [String:Any]
                    self.locationTemp = (tempKeyValue["temp"] as! Float) - 273
                    
//                    //locationImage
                    let weatherKeyValue = Arr["weather"] as! [[String: Any]]
                    let iconURLValue: String = (weatherKeyValue[0]["icon"] as? String)!
//
                    self.imageData = try Data(contentsOf: URL(string: "https://openweathermap.org/img/w/\(iconURLValue).png")!)
                    
                    
                } catch let error {
                    print("\(error.localizedDescription)")
                }
            }
            }.resume()
    }
    
    // MARK: ResetBtn
    @IBAction func resetActionBtn(_ sender: UIButton) {
        tableView.reloadData()
        print("tableView reloadData")
    }
    
    // MARK: Add Btn
    @IBAction func addActionBtn(_ sender: UIButton) {
        print("addActino")
        
//        let popVC: AddViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AddVC") as! AddViewController
//        
//        // View의 background의 투명하게 처리된부분이 아래의 옵션을 통해서 올라와 있는 View 가 보여지게 됨..
//        popVC.modalPresentationStyle = .overCurrentContext
//        self.present(popVC, animated: false, completion: nil)
    }
    
    
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return WeatherData.Main.weatherList?.count ?? 2
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! UITableViewCell
        
        cell.frame.insetBy(dx: 50, dy: 50)
        
        if let allData = WeatherData.Main.weatherList {
            
            cell.textLabel?.text = "\((allData[indexPath.row]["name"]) as! String)  "
            cell.detailTextLabel?.text = "\((allData[indexPath.row]["temp"]) as! Float)°"
            
            cell.imageView?.image = UIImage(data: allData[indexPath.row]["icon"] as! Data)
            
            
        }
        return cell
    }
    
}
