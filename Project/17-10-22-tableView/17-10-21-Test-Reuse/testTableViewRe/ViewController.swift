import UIKit

class ViewController: UIViewController, UITableViewDataSource, SwitchTableViewCellDelegate {
    
    
    var tv: UITableView?
    
    
    
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
        
        
        //cellCount[cell.idx![1]] = cell.sw.isOn
       
        cell.delegate = self

        cell.sw.isOn = cellCount[indexPath.row]
        
        cell.idx = indexPath
        
        
        
        
        
        print(cell.sw.isOn)
       
        return cell
    }
    
    func switchTableViewCell(cell: CustomCell, didChangedSwitch value: Bool) {
        cellCount[cell.idx![1]] = value
        
    }
    
    
    
    
    
    
    
    




}

