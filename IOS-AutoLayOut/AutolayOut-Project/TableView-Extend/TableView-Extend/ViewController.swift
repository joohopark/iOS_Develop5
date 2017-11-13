
import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let heightArray: NSMutableArray = []
    let textDataArray: NSArray = ["short Text",
                                  "Long Long Long Long Long Long Long Text",
                                  "Very Long Long Long Long Long Long Long Long Long Long Text Very Long text ",
                                  "Very Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Text Very Long text "]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // text의 크기만큼 높이값이 자동으로 계산되어짐.
        tableView.rowHeight = UITableViewAutomaticDimension
        
        for _ in 0...14 {
            heightArray.add(false)
        }
        
        
        
        
    }
    
    // label의 text 줄수만큼, 높이가 가변적으로 변하게됨.
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "expandCell", for: indexPath) as! MyCell
        
        if heightArray[indexPath.row] as! Bool == false {
            cell.myLabel.numberOfLines = 1
        }else {
            cell.myLabel.numberOfLines = 0
        }
        
        cell.myLabel.text = textDataArray[indexPath.row%3] as! String
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.heightArray[indexPath.row] as? Bool == false {
            heightArray.replaceObject(at: indexPath.row, with: true)
        }else {
            heightArray.replaceObject(at: indexPath.row, with: false)
        }
        
        tableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
        //        tableView.reloadData()
    }
    
    
    
    
    
}


class MyCell: UITableViewCell {
    @IBOutlet weak var myLabel: UILabel!
}

