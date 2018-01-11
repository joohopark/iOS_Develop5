
import UIKit

class SignViewController: UIViewController {
    
    
    @IBOutlet weak var CreatUserIDTextField: CustomTextField!
    @IBOutlet weak var CreatPassWordTextField: CustomTextField!
    @IBOutlet weak var CreatCheckPassWordTextField: CustomTextField!
    @IBOutlet weak var CreatEmailTextField: CustomTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
        // 엔터키를 누르면 키보드 내려가게 하는거 만들기
        // 회원가입 페이지에서 데이터를 작성하고, 엔터키를 누르면, 키보드가 내려감.
        CreatUserIDTextField.addTarget(self, action: #selector(didEndOnExit(_:)), for: UIControlEvents.editingDidEndOnExit)
        
        CreatPassWordTextField.addTarget(self, action: #selector(didEndOnExit(_:)), for: UIControlEvents.editingDidEndOnExit)
        
        CreatCheckPassWordTextField.addTarget(self, action: #selector(didEndOnExit(_:)), for: UIControlEvents.editingDidEndOnExit)
 */
        
        
    }
    
    @IBAction func CreatAccount(_ sender: RoundButton) {
        print("버튼 누름")
    }
    
    
    
    /*@objc func didEndOnExit(_ sender: CustomTextField) {
        
        
        // 각각 한줄 한줄 input 값을 입력하고, 엔터키를 누르면, 바로 아래의 textfield로 넘어감.
        if sender === CreatUserIDTextField {
            CreatPassWordTextField.becomeFirstResponder()
            
        }else if sender === CreatPassWordTextField {
            CreatCheckPassWordTextField.becomeFirstResponder()
        }
        
        // 리턴을 누르면, accountcheckPassword 필드로 커서가 이동을 한다.
        //accountCheckPassWord.becomeFirstResponder()
        print("exit")
    }*/
    
    
    
    
}

