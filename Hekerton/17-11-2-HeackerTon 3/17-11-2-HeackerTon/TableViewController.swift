
import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tv: UITableView!
    
//    var tv: UITableView?
    var btnNumber:Int = 0
    
    var dValue = 0
    var iValue = 0
    var sValue = 0
    var cValue = 0
    
    var inputName: String = ""
    var resultValue: String = ""
    var resultType: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
//        tv = UITableView(frame: view.bounds
//                         ,style: .grouped)
//
        tv?.dataSource = self
        tv?.delegate = self
        tv?.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        view.addSubview(tv!)
        
        
        
    }
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.textAlignment = .center
        
        // 첫화면 정의
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = DataModel.singleton.randomExampleArray[0]["d"]
        case 1:
            cell.textLabel?.text = DataModel.singleton.randomExampleArray[0]["i"]
        case 2:
            cell.textLabel?.text = DataModel.singleton.randomExampleArray[0]["s"]
        case 3:
            cell.textLabel?.text = DataModel.singleton.randomExampleArray[0]["c"]
        default:
            print("Default")
        }
        
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellSize:CGFloat = (view.bounds.size.height/4) * 0.8
        
        return cellSize
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //IndexPath 값을 던져서 DISC 값의 위치를 랜덤으로 던져주자.
        
        
        var indexPathArray = [IndexPath(row: 0, section: 0),IndexPath(row: 1, section: 0), IndexPath(row: 2, section: 0),IndexPath(row: 3, section: 0)]
        
        var tempX: [IndexPath] = []
        
        // tempX 를 통해서, cell의 disc의 순서 변경
        while tempX.count != 4 {
            var RandomX = Int(arc4random_uniform(UInt32(indexPathArray.count)))
            tempX.append(indexPathArray[RandomX])
            indexPathArray.remove(at: RandomX)
        }
        
        // 선택된값 disc에 저장
        var choiceCell = tableView.cellForRow(at: indexPath)
        
        if choiceCell?.textLabel?.text == DataModel.singleton.randomExampleArray[btnNumber]["d"]! && (btnNumber >= 0 && btnNumber <= 22) {
            
            self.dValue += 1
            
            
        }else if choiceCell?.textLabel?.text == DataModel.singleton.randomExampleArray[btnNumber]["i"]! && (btnNumber >= 0 && btnNumber <= 22) {
            
            self.iValue += 1
            
            
        }else if choiceCell?.textLabel?.text == DataModel.singleton.randomExampleArray[btnNumber]["s"]! && (btnNumber >= 0 && btnNumber <= 22){
            
            self.sValue += 1
            
            
        }else if choiceCell?.textLabel?.text == DataModel.singleton.randomExampleArray[btnNumber]["c"]! && (btnNumber >= 0 && btnNumber <= 22) {
            
            self.cValue += 1
            
            
        }
        
        // cell 선택시, plist의 값들 반환
        if btnNumber >= 0 && btnNumber <= 22 {
            btnNumber += 1
            
            // 변경될 cell indexPath정의
            var a = tableView.cellForRow(at: tempX[0])
            var b = tableView.cellForRow(at: tempX[1])
            var c = tableView.cellForRow(at: tempX[2])
            var d = tableView.cellForRow(at: tempX[3])
            
            
            a?.textLabel?.text = "\((DataModel.singleton.randomExampleArray[btnNumber]["d"])!)"
            b?.textLabel?.text = "\((DataModel.singleton.randomExampleArray[btnNumber]["i"])!)"
            c?.textLabel?.text = "\((DataModel.singleton.randomExampleArray[btnNumber]["s"])!)"
            d?.textLabel?.text = "\((DataModel.singleton.randomExampleArray[btnNumber]["c"])!)"
        }else {
            var x = max(self.dValue, self.iValue, self.sValue, self.cValue)
            
            switch x {
            case self.dValue :
                self.resultValue = DataModel.singleton.resultArray[0]["msg"]!
                self.resultType = DataModel.singleton.resultArray[0]["title"]!
                
            case self.iValue :
                self.resultValue = DataModel.singleton.resultArray[1]["msg"]!
                self.resultType = DataModel.singleton.resultArray[1]["title"]!
                
            case self.sValue :
                self.resultValue = DataModel.singleton.resultArray[2]["msg"]!
                self.resultType = DataModel.singleton.resultArray[2]["title"]!
                
            case self.cValue :
                self.resultValue = DataModel.singleton.resultArray[3]["msg"]!
                self.resultType = DataModel.singleton.resultArray[3]["title"]!
            default:
                print("여기에 올수가 없어요 ")
            }
            
            
            //화면 전환
            performSegue(withIdentifier: "Coffee", sender: nil)

        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var nextVC = segue.destination as? CoffeeViewController
        
        // 다음 ViewController 넘어갈때 값을 넘겨주자 
        nextVC?.resultText = self.resultValue
//        resultTextView.text = self.resultValue
        nextVC?.typeText = self.resultType
        nextVC?.inputName = self.inputName

    }
}

