

import UIKit

class StartViewController: UIViewController, UITextFieldDelegate {
  
  @IBOutlet weak var titleImg: UIImageView!
  @IBOutlet weak var inputNicknameTF: UITextField!
  @IBOutlet weak var startBtn: UIButton!
  @IBOutlet weak var imScrollView: UIScrollView!
  
  override func viewDidLoad() {
 
    titleImg.layer.cornerRadius = titleImg.bounds.size.width / 2
    startBtn.layer.cornerRadius = 25
  
    
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: .UIKeyboardWillShow, object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: .UIKeyboardWillHide, object: nil)
  }

  @objc func keyboardWillShow(notification: Notification){
    guard let userInfo = notification.userInfo else {return}
    guard let keyboardFrame = userInfo[UIKeyboardFrameEndUserInfoKey] as? CGRect else{return}
    imScrollView.contentInset = UIEdgeInsetsMake(0, 0, keyboardFrame.size.height + 100, 0)
  }
  @objc func keyboardWillHide(notification: Notification){
    imScrollView.contentInset = UIEdgeInsets.zero
  }

  @IBAction func didTabTestStart(_ sender: UIButton) {
    if (inputNicknameTF.text?.isEmpty)! {
      
    }else {
        performSegue(withIdentifier: "nextTableView", sender: nil)
    }
    
  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
    
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.view.endEditing(true)
  }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var nextVC = segue.destination as? TableViewController
        
        // 다음 ViewController 넘어갈때 값을 넘겨주자
        nextVC?.inputName = inputNicknameTF.text!
        
        
        print("nextVC")
        
        
    }

 
}



