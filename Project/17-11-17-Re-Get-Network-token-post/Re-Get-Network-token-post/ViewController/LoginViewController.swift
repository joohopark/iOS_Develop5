

import UIKit

class LoginViewController: UIViewController {
  @IBOutlet weak var userIDTextFiled: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationController?.isNavigationBarHidden = true
    let istoken = UserDefaults.standard.value(forKey: "MyToken") as! String
    if istoken == UserDefaults.standard.value(forKey: "MyToken") as! String{
      print("영역확인")
      performSegue(withIdentifier: "GoServerData", sender: nil)
    }
  }
  
  
  @IBAction func loginBtnAction(_ sender: UIButton) {
    let checktoken = UserDefaults.standard.value(forKey: "MyToken")
  }
  
  @IBAction func creatAccountBtnAction(_ sender: UIButton) {
    let userID: String! = userIDTextFiled.text
    let userPassword: String! = passwordTextField.text
    NetworkFileManager.shread.requestSignup(userid: userID, pw: userPassword) { (isSuccess, resultData, error) in
    }
  }
  
  
  
}

