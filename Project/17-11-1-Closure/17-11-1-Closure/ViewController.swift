

import UIKit

class ViewController: UIViewController, CustomViewDelegate {
    
    
    
    func changeTextLB(_ x: CustomView) -> String {
        
        var changString: String = "abc"
        return changString
    }
    
    

    @IBOutlet weak var otherView: CustomView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        otherView.delegate = self
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}



