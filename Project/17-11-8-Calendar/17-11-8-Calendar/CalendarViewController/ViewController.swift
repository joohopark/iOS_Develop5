
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mjcalendear: MJCalendar!
    @IBOutlet weak var monthLB: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        mjcalendear.date = Date()
        if let monthText = mjcalendear.month {
            monthLB.text = "\(monthText) 월"
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func previousAction(_ sender: UIButton) {
        mjcalendear.updatePrevious()
        if let monthText = mjcalendear.month {
            monthLB.text = "\(monthText) 월"
        }
    }
    
    @IBAction func nextAction(_ sender: UIButton) {
        mjcalendear.updateNextMonth()
        if let monthText = mjcalendear.month {
            monthLB.text = "\(monthText) 월"
        }
        
        
    }
    
}

