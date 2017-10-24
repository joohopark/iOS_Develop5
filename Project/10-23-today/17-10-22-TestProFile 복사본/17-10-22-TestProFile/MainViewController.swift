

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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // sender 는 클릭된 녀석
        //'segue.destination' 는 segue 로 넘어간 뷰컨트롤러를 가리킴
        guard let cell = sender as? CustomCell else { return }
        
        
        guard let nextVC = segue.destination as? NextViewController else { return }
        
        print(nextVC)
        nextVC.data = cell.data
        
    }

   


}

