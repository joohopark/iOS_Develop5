

import UIKit

class ViewController: UIViewController {
    
    var otherView: CustomView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        otherView?.CustomViewLB?.text = "바껴라 otherview"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

