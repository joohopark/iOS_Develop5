
import UIKit

class otherViewController: UIViewController {

    @IBOutlet weak var LB: UILabel!
    @IBOutlet weak var LB2: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    @IBAction func btnAction(_ sender: UIButton) {
        var total = 0
        let t = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (t) in
            for i in 0...10000000{
                total += 1
                print(total)
            }
        }
        
        let t1 = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (t) in
            total += 1
            self.LB2.text = String(total)
            
        }

            self.LB.text = "변해라"
            
            if self.LB.text == "변해라" {
                t.invalidate()
            }
//        for i in 0...100000{
//            value += 1
//            print(value)
//        }
//        LB.text = "변해라"
        
    }
    }

