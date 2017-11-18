
import UIKit

class TableViewController: UIViewController {
  @IBOutlet weak var tableView: UITableView!
  
  var imageList = NetworkManager.shared.imageList
  var numberOfrow = 0
  var textOfCell: [String] = []
  
  
  override func viewDidLoad() {
        super.viewDidLoad()
    NetworkManager.shared.requestGetPosts { (isSuccess, resultData, error) in
      if isSuccess {
        let numberOfRowValue = resultData as? [PostModel]
        self.numberOfrow = (numberOfRowValue?.count)!
      }
    }
    tableView.reloadData()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    tableView.reloadData()
  }
}


extension TableViewController: UITableViewDelegate, UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
      return self.numberOfrow
    //return returnValue
    
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    
    cell.textLabel?.text = "\(indexPath.row)"
    if let image = UserDefaults.standard.value(forKey: "ImgData") as? Data {
      cell.imageView?.image = UIImage(data: image)
      return cell
    }
    
    
    return cell
  }
}
