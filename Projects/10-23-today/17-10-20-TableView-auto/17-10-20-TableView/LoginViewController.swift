
import UIKit

class LoginViewController: UIViewController {
  
  @IBOutlet weak var usernameTextField: CustomTextField!
  @IBOutlet weak var passwordTextField: CustomTextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    
    usernameTextField.leftView = UIImageView(image: #imageLiteral(resourceName: "Icon"))
    usernameTextField.leftViewMode = .always
    
//    let attributedString = NSMutableAttributedString(string: "아이디를 입력해주세요.")
//    attributedString.addAttribute(
//      NSAttributedStringKey.foregroundColor,
//      value: UIColor.red.withAlphaComponent(0.5),
//      range: NSRange(location: 0, length: 3)
//    )
//    usernameTextField.attributedPlaceholder = attributedString
    
    usernameTextField.configureAttributedString(
      string: "아이디를 입력해주세요.",
      range: NSRange(location:0, length: 3),
      stringColor: UIColor.red.withAlphaComponent(0.5)
    )
    
  }
  
  
  
}
