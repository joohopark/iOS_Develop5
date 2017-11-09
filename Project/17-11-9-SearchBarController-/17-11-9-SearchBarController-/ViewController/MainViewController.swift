

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    @IBOutlet weak var tableView: UITableView!
    let identifier = "Cell"
    
    var imageList: [Data] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        // 스토리 보드로 사용할떄와, 코드로 사용할떄 register 다름
        // Cell 을 스토리보드에 올린것만으로도 cell에 등록.
//        tableView.register(CustomCellTableViewCell.self, forCellReuseIdentifier: identifier)
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return 4 //imageList.count
    }

    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? CustomCellTableViewCell
        
        cell?.titleLB.text = "\(indexPath)"
//        cell?.backGroundImage.image = UIImage(named: "test.jpg")
//        cell?.tailImageView.image = #imageLiteral(resourceName: "StarIcon_Off")
        
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //let cell = tableView.cellForRow(at: indexPath) as? CustomCellTableViewCell
//        performSegue(withIdentifier: "DetailViewciontroller", sender: nil)
        
//        present(DetailViewciontroller.self, animated: true, completion: nil)

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    @IBAction func starBtnAction(_ sender: UIButton) {
        print("버튼눌림")
    }
    


}

