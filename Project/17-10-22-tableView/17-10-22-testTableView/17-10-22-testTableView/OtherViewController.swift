

import UIKit

class OtherViewController: UIViewController {
    
    var y: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func check(_ sender: Any) {
        print(self.y)
    }
    
}
