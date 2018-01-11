

import UIKit

class AccountViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func goToMainActionBtn(_ sender: UIButton) {
        
        
        UserDefaults.standard.set(true, forKey: "isLogined")
        
        dismiss(animated: true, completion: nil)
        
        
    }

    
}
