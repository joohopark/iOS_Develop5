import UIKit

class ServerDataTable: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  var numberOfRow: [DataModel] = []
  
  override func viewDidAppear(_ animated: Bool) {
    tableView.reloadData()
    print("DidAppear")
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationController?.isNavigationBarHidden = false
    self.navigationItem.hidesBackButton = true
    
    NetworkFileManager.shread.requestGetPosts { (ok, data, error) in
      
      //      print(data)
    }
    
    NetworkFileManager.shread.requestGetPosts { (issuccess, resultData, error) in
      //      self.numberOfRow = resultData as! [DataModel]
      //      print(resultData)
      
      self.numberOfRow = resultData as! [DataModel]
      print(self.numberOfRow)
      
      DispatchQueue.main.async {
        self.tableView.reloadData()
      }
    }
  }
}


extension ServerDataTable: UITableViewDelegate, UITableViewDataSource {
  
  public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return numberOfRow.count
  }
  
  public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MyCustomCell
    cell.cellLabel.text = "\(numberOfRow[indexPath.row].title)"
    cell.clipsToBounds = true
    cell.contentMode = .scaleAspectFit
    if let data = try? Data(contentsOf: URL(string: "\((numberOfRow[indexPath.row].imgCoverUrl)!)")!) {
//      cell.cellImageView.image = UIImage(data: data)
      cell.imageView?.image = UIImage(data: data)
    }
    
    return cell
    
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 100
  }
}






