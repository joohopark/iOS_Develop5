
import UIKit

class SettingViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tv: UITableView!
    
    
    
    var switcher: UISwitch!
    var versionLB: UILabel!
    
    /*==========
     Subscript 연습
     ==========*/
    class test {
        subscript(section: Int, row: Int) -> Int {
            if section == 0 {
                if row == 0 {
                    return 0
                }else if row == 1 {
                    return 1
                }else if row == 2 {
                    return 2
                }
                
            }
            return 0
        }
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        //print(RawData.singletonRawData.rawData![1])
        
//        print(RawData.singletonRawData.rawData![0].accountData[0]["Content"]!)
        switcher = UISwitch()
        versionLB = UILabel()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    /*==========
  색션별로 row 개수 설정
     ==========*/
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
    
    /*==========
     각 cell 조건 설정
     ==========*/
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //if indexPath
        
        let cell: CustomCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        
        
        var x = test()
        /*===============
             0번 색션
         ================*/
        if indexPath[0] == x[0,0] {
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
    
    /*==========
     색션의 개수 설정
     ==========*/
    func numberOfSections(in tableView: UITableView) -> Int {
        return (RawData.singletonRawData.rawData?.count)!
    }
    
    
    /*==========
     각 색션당 low의 action 설정
     ==========*/
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        if indexPath[0] == 0 {
            if indexPath.row == 0 {
                
                if let presentVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailSetting") {
                    
                    self.present(presentVC, animated: true, completion: nil)
                    
                }
            }
            
            
            else if indexPath.row == 2 {
                let alertVC = UIAlertController(title: "Logout", message: "로그아웃 하시겠습니다?", preferredStyle: .alert)
                
                let okAction = UIAlertAction(title: "OK", style: .default, handler: { (X) in
                    
                    // present -> dismiss // pop -> push
                    UserDefaults.standard.set(false, forKey: "isLogined")
//                    self.navigationController.view
                    //self.navigationController?.popToRootViewController(animated: true)
                    
                    NotificationCenter.default.post(name: Notification.Name.init("logoutNoti"), object: nil, userInfo: ["noti":"info"])

                    
                   
                    
                    
                    //self.performSegue(withIdentifier: "LoginSegue", sender: nil)
                    
                })
                
                let cancleAction = UIAlertAction(title: "Cancle", style: .default, handler: { (X) in
                    
                    print("cancle Logout")
                    
                })
                
                alertVC.addAction(okAction)
                alertVC.addAction(cancleAction)
                
                self.present(alertVC, animated: true, completion: nil)
                
                
            }
            
        }
    
            
        
        
        
        
    }
        
    
    /*==========
     색션 타이틀 설정
     ==========*/
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

    //enum 옮기는 작업
    /*
    enum type {
        
        case firstSection
        case secondSection
        case thirdSection
        
        func thorwCell() {
            
            let cell: CustomCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
            
            
            switch self {
                
            case .firstSection:
                if IndexPath.row == 0 || IndexPath.row == 1 {
                    cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
                }else if IndexPath.row == 2 || IndexPath.row == 3 {

                    // 클릭시, 클릭 효과 없애는것
                    cell.selectionStyle = .none
                    cell.textLabel?.textColor = .red
                    
                }

                
            case .secondSection:
                print("secondSection")
            case .thirdSection:
                print("thirdSEction")
            }
        }
    }
     */
    
    
    
    

}

