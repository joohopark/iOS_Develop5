# 32_17-10-20

---

## TableView

---

## Cell Reusable 

IOS 의 TableView의 강력한 장점중의 하나인 `재사용` 조금 을 이해하기가 조금 까다롭다. 아래의 예제를 통해서 cell 재사용에 대해서 생각해보자.

| * | * | 
| :------------ | -----------: | 
| ![screen](/study/image/TablewViewReusable.jpg) | ![screen](/study/image/TablewViewReusable-1.jpg)          | 



```swift

하나의 cell을 만들고, 그 셀에 switch를 넣고, cell이 어떻게 재사용되는지 살펴 보았다.

문제점 1. 아무 설정도 해놓지 않고 사용하면, 0번 row에서 switcher를 false만들면, 다음 화면으로 스크롤 될때, 0번의 switcher의 false 가 그대로 따라가게 된다. 

 -> 사실 엄밀하게는, 각각 row의 switcher 값을 지정 시켜놓고, switcher의 isOn 값이 변할때 마다, 지정해놓은 부분을 변경 하는 식인데, cell의 재사용을 이해하지 못하면 절대 해결할수 없는 문제가 생기게 된다.
 
 
 - ViewController 부분
    -> 테이블뷰의 형태는 스토리보드로 그려주고 연결만 시켜서 사용하였따.



 import UIKit

class ViewController: UIViewController, UITableViewDataSource, SwitchTableViewCellDelegate {
    
    
    var tv: UITableView?
    
    
    
    //switcher가 각 row마다 참조할 값
    var cellCount = [true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tv = UITableView()
       
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellCount.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CustomCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        
        cell.textLabel?.text = "\(indexPath.row)"
        cell.delegate = self


        cell.sw.isOn = cellCount[indexPath.row]
        
        //cell에서 indexPath의 값을 가져와서, switcher가 변했을때의 row값을 알기 위해서 정의 해준다.
        cell.idx = indexPath
        
       
       
        return cell
    }
    
    func switchTableViewCell(cell: CustomCell, didChangedSwitch value: Bool) {
    
    		// 사실 delegate를 사용하지 않아도, CustomCell Class에서 switcher가 변화할때 변화하는 switcher.isOn값을 가져오려고 했는데, 값이 생각처럼 넘어오지 않았다. 그래서 Delegate를 사용해서 switcher.isOn 값만 넘겨주고, 그 넘겨준 값을 row값에 넣고, cell 을 계속해서 반환시켜 주면서 사용을 하였다.
    		
        cellCount[cell.idx![1]] = value
        
    }
    
    
    
 
 - CustomCell 부분
import UIKit

class CustomCell: UITableViewCell, SwitchTableViewCellDelegate  {
    
    
    func switchTableViewCell(cell: CustomCell, didChangedSwitch value: Bool) {
        
    }
    
    // delegate 변수 정의 
    var delegate: SwitchTableViewCellDelegate?
    
    
    //switcher가 변화했을때 값을 추적하기 위해서 생성.
    @IBAction func swAction(_ sender: UISwitch) {
        switchData = sender.isOn
        
        delegate?.switchTableViewCell(cell: self, didChangedSwitch: sender.isOn)

     //   print(switchData)
    }
    
    @IBOutlet weak var sw: UISwitch!
    
    
    var idx: IndexPath?
    
    // switcher가 변화한값을 옵져빙변수로 넘겨주었음..!
    var switchData: Bool = true{
        willSet {
            self.sw.isOn = newValue
            
        }
        
    }
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}


// Delegate 생성하기 위해서 protocol 생성 
protocol SwitchTableViewCellDelegate {
    func switchTableViewCell(cell: CustomCell, didChangedSwitch value:Bool)
}



}






```

---

## TableView 

**show**, : navi -> show -> push 
				  viewController -> 강제로 모달리 시키는것임.
				  
				  **show, modal**의 차이를 알아놓고 정리하자.
				  
				  
**modalry**, 를 하는 이유가 show 는 쌓이는것이고, modalry 는 현재 stack밖으로 벗어난다고 생각하자..

---


---

## TableView 응용 하기 



| * | * | 
| :------------ | -----------: | 
| ![screen](/study/image/ReTableViewController.jpg) | ![screen](/study/image/ReTableViewController-1.jpg) | 



- 사용 한것
	1. 데이터 모델링 <br>


![screen](/study/image/PlistData.jpg) <br>

> Plist 구조 


2. 뷰 컨트롤러 전환할때, 이전 뷰컨트롤러의 데이터 사용 <br>

3. AutoLayout<br>




```swift

- 데이터 모델링

import Foundation

// 데이터 모델

struct ProfileModel {
    
    var nickname: String
    var statusDesc: String
    var profileImageName: String
    
    
    var email: String
    var phoneNumber: String
    var myprofileDesc: String
    var bgImageName: String
    
    
    init?(data: [String:String]) {
        
        // 데이터 모델링 합시다.
        
        guard let nickname = data["Nickname"] else { return nil}
        self.nickname = nickname
        
        guard let statusDesc = data["StatusDescription"] else { return nil}
        self.statusDesc = statusDesc
        
        guard let profileImageName = data["ProfileImage"] else { return nil}
        self.profileImageName = profileImageName
        
        guard let email = data["Email"] else { return nil}
        self.email = email
        
        guard let phoneNumber = data["PhoneNumber"] else { return nil}
        self.phoneNumber = phoneNumber
        
        guard let myprofileDesc = data["MyProfileDescription"] else { return nil}
        self.myprofileDesc = myprofileDesc
        
        guard let bgImageName = data["BackgroundImage"] else { return nil}
        self.bgImageName = bgImageName
        
        
    }
    
    
}


- 데이터 모델링후 -> 사용할 데이터를 Array에 담아둔다.


import Foundation

class ProFileDataManager {
    
    var documentsPath: String?
    
    
    //실제 데이터를 가지고 있는 녀석, 사용도중 초기화 되면 망하기 떄문에..
    private var profiles: [ProfileModel] = []
    
    // 연산 프로퍼티를 사용해서, 값이 초기화되는것을 허용하지 않으려고 읽어 오는것만을 허용해주었다..
    var profilesData: [ProfileModel] {
        return profiles
    }
    
    // 데이터를 load 하는 녀석
    
    init() {
        loadData()
    }
    
    func loadData() {
        
        
        // 번들의 주소 가져오기
        if let filePath = Bundle.main.path(forResource: "FreindInfo", ofType: "plist"), let dataList = NSArray(contentsOfFile: filePath) as? [Any]{
            
            
            for data in dataList {
                
                if let realData = data as? [String: String],
                    
                    
                    let dataModel = ProfileModel(data: realData) {
                    profiles.append(dataModel)
                    print(profiles)
                    
                    
                    
                }
            }
        }
        
    }

    
}


- MainViewcontroller, NextViewcontroller 나누기.




import UIKit

class MainViewController: UIViewController, UITableViewDataSource {
    
    
    @IBOutlet weak var tv: UITableView!
    
    
    // 데이터 로드
    var dataManager: ProFileDataManager?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tv.dataSource = self
        dataManager = ProFileDataManager()
        
        print(dataManager?.profilesData)
        
        
    }
    
    
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataManager?.profilesData.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: CustomCell = (tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomCell)!
        
        cell.textLabel?.text = dataManager?.profilesData[indexPath.row].nickname
        
        cell.imageView?.image = UIImage(named: (dataManager?.profilesData[indexPath.row].bgImageName)!)
        
        
        cell.imageView?.clipsToBounds = true
        
        // 디테일 값을 detaileData 에 저장을 한다..!
        let detaileData: ProfileModel = (dataManager?.profilesData[indexPath.row])!
        
        
        cell.data = detaileData

        
        
        
        return cell
    }
    
    
    // prepare 는 뷰컨트롤러간 전환할때 호출되는데, 
    // Push 하는 방식으로 사용되는것 같다. 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // sender 는 클릭된 녀석
        //'segue.destination' 는 segue 로 넘어간 뷰컨트롤러를 가리킴
        guard let cell = sender as? CustomCell else { return }
        
        
        // Viewcontroller 가 전환될때, cell의 디테일 정보를 다음 뷰컨트롤러로 넘겨려고 할때, 
        // nextVC 가 다음 뷰 컨트롤러를 가르키면서, 그 뷰컨트롤러가 가지고 있는 프로퍼티를 뷰컨트롤러가 전환하기 전에, 값을 넘겨 주어서
        // 화면이 전환된 이후에도 사용을 하는 방식으로 사용한다.
        guard let nextVC = segue.destination as? NextViewController else { return }
        
        print(nextVC)
        nextVC.data = cell.data
        
    }

   


}

- NextVC

import UIKit

class NextViewController: UIViewController {

    
    @IBOutlet weak var titleImageView: UIImageView!
    @IBOutlet weak var detailProfileImageView: UIImageView!
    @IBOutlet weak var detaliName: UILabel!
    @IBOutlet weak var detaileTextView: UITextView!
    @IBOutlet weak var phoneNumber: UILabel!
    @IBOutlet weak var email: UILabel!
    
    // 디테이블 뷰에서는 cell에서 누른 값만 필요하기 때문에 ProfileModel 을 사용함..
    var data: ProfileModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailProfileImageView.clipsToBounds = true
        detailProfileImageView.layer.cornerRadius = 50
        
        
        // data를 안전하게 바인딩해서 사용한다. 사실 바인딩 하지 않아도된다... 그 앞에서 값이 잘 넘어오면, 넘어온 데이터가 화면에 뿌려질것이고, 데이터가 잘 넘어오지 않았다면 어차피 화면에 보이지 않기 때문이다. 하지만 혹시 모를 오류에 대비하기 위해서 if-let 바인딩을 사용한다.
        if let real = data {
            //data에 값이 넘어온다는것.
            titleImageView.image = UIImage(named: (data?.bgImageName)!)
            detaliName.text = data?.nickname
            detaileTextView.text = data?.myprofileDesc
            phoneNumber.text = data?.phoneNumber
            email.text = data?.email
            
            detailProfileImageView.image = UIImage(named: (data?.profileImageName)!)
        }
            
            
            

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}



``` 

---

## Reference 

[scale guide](https://developer.apple.com/library/content/documentation/WindowsViews/Conceptual/ViewPG_iPhoneOS/WindowsandViews/WindowsandViews.html)