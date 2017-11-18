
import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var idTF: UITextField!
  @IBOutlet weak var pwTF: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func signupBtn(_ sender: UIButton) {
    
    if checkData() {
      let userID = idTF.text
      let userPW = pwTF.text
      
      print(userID, userPW)
      NetworkManager.shared.requestSignup(userid: userID!, pw: userPW!, completion: { (isSuccess, resultData, error) in
        
        print(isSuccess, resultData, error)
        if isSuccess {
          print("goMain")
        }
      })
      
      
    }
  }
  
  
  @IBAction func loginBtn(_ sender: UIButton) {
//     print(NetworkManager.shared.loadToKen())

    
    
  }
  
  func checkData() -> Bool {
    
    //아이디, 비밀번호 검사
    
    
    return true
  }
  
}

