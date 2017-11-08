
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mjcalendear: MJCalendar!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mjcalendear.date = Date()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

