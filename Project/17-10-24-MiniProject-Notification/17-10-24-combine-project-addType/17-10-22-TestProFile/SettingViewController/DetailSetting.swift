

import UIKit

class DetailSetting: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var mainSc: UIScrollView!
    @IBOutlet weak var titleImageView: UIImageView!
    @IBOutlet weak var detailImageView: UIImageView!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nickNameTextField: UITextField!
    @IBOutlet weak var statusTextField: UITextField!
    @IBOutlet weak var birthdayTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 키보드가 올라오기 직전에 노티피케이션을 사용해서 컨트롤하려고 함.
        NotificationCenter.default.addObserver(forName: Notification.Name.UIKeyboardWillShow, object: nil, queue: nil) { (noti) in
            //print(noti.userInfo)
            
            // noti.userInfo 를 프린트한후, 추측해서 키보드 위치를 내려주려고 함..
            // EndUserInforKey로 바꾸어 주어야 제대로 작동이 됨..!
            if let keyboardFrame = noti.userInfo?[UIKeyboardFrameEndUserInfoKey] as? CGRect {
                // 스크롤뷰를, 키보드가가 올라온 크기 만큼 스크롤을 올릴것임
                self.mainSc.contentOffset = CGPoint(x: 0, y: keyboardFrame.height)
        }
            
        }
        
        NotificationCenter.default.addObserver(forName: Notification.Name.UIKeyboardDidHide, object: nil, queue: nil) { (noti) in
            
            if let keyboardFrame = noti.userInfo?[UIKeyboardFrameEndUserInfoKey] as? CGRect {
                // 스크롤뷰를, 키보드가가 올라온 크기 만큼 스크롤을 올릴것임
                self.mainSc.contentOffset = CGPoint(x: 0, y: keyboardFrame.height/keyboardFrame.height)
            
        }
    }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        // textFieldShouldReturn 은 return 키를 누르게되면, 키보드가 내려가게 되는것인데, 그 명령어중 하나가,
        // resignFirstResponder 매소드가 첫번째로 이녀석이 받음.
        // 위의 녀석들을 사용하기 위해서는 델리게이트를 연결해주어서 사용해야 한다.
        textField.resignFirstResponder()
        
        return true
    }
    
    func setUI () {
        
    }
    
    
    @IBAction func changeBtnAction(_ sender: UIButton) {
    }
    

   

}
