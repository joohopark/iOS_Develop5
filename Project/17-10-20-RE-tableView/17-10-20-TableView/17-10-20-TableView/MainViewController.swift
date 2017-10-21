

//var imagView: UIImageView = UIImageView(#imageLiteral(resourceName: "BackImage11")) 이런식으로 리터럴로 


import UIKit

class MainViewController: UIViewController, UITableViewDataSource {
    
    
    var dataManager: ProFileDataManager?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print(DataModel.singleton.data)
        dataManager = ProFileDataManager()
        
        
        
        
    

        
        
    }

    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataManager?.profilesData.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // cell 을 등록을하고, UI 각각의 값을 넣어주려고 하는데,
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! profileTableViewCell
        
        
        let profileModel: ProfileModel = dataManager!.profilesData[indexPath.row]
        
        // 커스텀셀에 데이터를 넘겨주었슴.
        cell.data = profileModel
        
//        cell.textLabel?.text = profileModel.nickname
//        cell.detailTextLabel?.text = profileModel.statusDesc
//        cell.imageView?.frame = CGRect(origin: .zero, size: .zero)
//        cell.imageView?.image = UIImage(named: profileModel.bgImageName)
//        
        cell.profileImageView.image = UIImage(named: profileModel.bgImageName)
        cell.nameTextLabel.text = profileModel.nickname
        return cell
    }
    
    // ViewCotnroller 간 화면 전환을 할때, 데이터의 이동을 위해서 prepare를 사용함.
    // prepare 는 뷰컨트롤러에서 -> 다른 뷰컨트롤러로 넘어갈때 불리는 녀석이다.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // sender 는 클릭된 녀석
        //'segue.destination' 는 segue 로 넘어간 뷰컨트롤러를 가리킴
        guard let cell = sender as? profileTableViewCell else { return }
        
        
        guard let nextVC = segue.destination as? DetailViewController else { return }
        nextVC.data = cell.data
        
    }

}
