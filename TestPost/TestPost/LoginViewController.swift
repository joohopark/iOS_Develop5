
import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var idtextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var nextbutton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func nextButtonAction(_ sender: UIBarButtonItem) {
        print("호출")
    }
    
}
