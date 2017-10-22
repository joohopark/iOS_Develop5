
import UIKit

class ViewController: UIViewController,UITableViewDataSource {
    
    
    @IBOutlet weak var tv: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //print(RawData.singletonRawData.rawData![1])
        
        print(RawData.singletonRawData.rawData![0].accountData[0]["Content"]!)

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return RawData.singletonRawData.rawData![0].accountData.count
        }else if section == 1 {
            return RawData.singletonRawData.rawData![1].informatinData.count
        }else if section == 2 {
            return RawData.singletonRawData.rawData![2].serviceData.count
        }
        
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //if indexPath
        
        let cell: CustomCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        
        if indexPath[0] == 0 {
                cell.textLabel?.text = RawData.singletonRawData.rawData![0].accountData[indexPath.row]["Content"]!
        }else if indexPath[0] == 1 {
            cell.textLabel?.text = RawData.singletonRawData.rawData![1].informatinData[indexPath.row]["Content"]
        }else if indexPath[0] == 2 {
            cell.textLabel?.text = RawData.singletonRawData.rawData![2].serviceData[indexPath.row]["Content"]
            
        }
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return (RawData.singletonRawData.rawData?.count)!
    }
    
    
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 0 {
            return "\(RawData.singletonRawData.rawData![0].sectionTitle)"
        }else if section == 1 {
            return "\(RawData.singletonRawData.rawData![1].sectionTitle)"
        }else if section == 2 {
            return "\(RawData.singletonRawData.rawData![2].sectionTitle)"
        }
        
        
        return "데이터가 없는 타이틀"
    }

    

}

