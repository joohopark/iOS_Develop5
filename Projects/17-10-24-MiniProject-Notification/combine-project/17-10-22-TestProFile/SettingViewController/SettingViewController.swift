
import UIKit

class SettingViewController: UIViewController,UITableViewDataSource {
    
    
    @IBOutlet weak var tv: UITableView!
    
    var switcher: UISwitch!
    var versionLB: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //print(RawData.singletonRawData.rawData![1])
        
        print(RawData.singletonRawData.rawData![0].accountData[0]["Content"]!)
        switcher = UISwitch()
        versionLB = UILabel()

        
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
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //if indexPath
        
        let cell: CustomCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        
        /*===============
             0번 색션
         ================*/
        if indexPath[0] == 0 {
            cell.textLabel?.text = RawData.singletonRawData.rawData![0].accountData[indexPath.row]["Content"]!
            
            
            if indexPath.row == 0 || indexPath.row == 1 {
                cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
            }else if indexPath.row == 2 || indexPath.row == 3 {
                
                // 클릭시, 클릭 효과 없애는것
                cell.selectionStyle = .none
                cell.textLabel?.textColor = .red
    
            }
            
            /*===============
                 1번 색션
             ================*/
        }else if indexPath[0] == 1 {
            cell.textLabel?.text = RawData.singletonRawData.rawData![1].informatinData[indexPath.row]["Content"]
            cell.selectionStyle = .none
            
            // app의 version을 가져오는 코드..!
            if let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String {
                versionLB = UILabel(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
                versionLB.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
                versionLB.text = "\(version)"
                cell.accessoryView = versionLB
             
            }
           
            /*===============
                 2번 색션
             ================*/
        }else if indexPath[0] == 2 {
            cell.textLabel?.text = RawData.singletonRawData.rawData![2].serviceData[indexPath.row]["Content"]
            cell.accessoryView = switcher
            cell.selectionStyle = .none
            
            
            
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

