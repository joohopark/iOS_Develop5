

import UIKit

class MyMyCell: UITableViewCell {
  @IBOutlet weak var contentsLB: UILabel!
  
}

class DynadicTableView: UIViewController,UITableViewDelegate, UITableViewDataSource {

  @IBOutlet weak var tableView: UITableView!
  var data = ["title",
              "title datatitle datatitle datatitle datatitle datatitle datatitle datatitle data",
              "title datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle data",
              "title datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle datatitle data"]
  override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = UITableViewAutomaticDimension
    }
  
  public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 20
  }
  
  func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
    
    return UITableViewAutomaticDimension
  }
  
  public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MyMyCell
    
    
    cell.contentsLB.text = data[indexPath.row % data.count]
    return cell
    
  }

//  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//    return 100
//  }



}
