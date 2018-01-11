

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: CustomTextField!
    
    @IBOutlet weak var passwordTextField: CustomTextField!
    
    @IBOutlet weak var scrollVier: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //// image 이터럴을 사용해서 아가 assets 에서 받은 이미지를 바로 넣어주었다.
        usernameTextField.leftView = UIImageView(image: #imageLiteral(resourceName: "profile"))
        usernameTextField.leftViewMode = .always
        
        // 아래 처럼 바로 attribute를 정의 해주어도 되지만, 그렇게 하지 않고, 그냥 class 에서 나누어서 만들어 주었다.
        
        //    let attributedString = NSMutableAttributedString(string: "아이디를 입력해주세요.")
        //    attributedString.addAttribute(
        //      NSAttributedStringKey.foregroundColor,
        //      value: UIColor.red.withAlphaComponent(0.5),
        //      range: NSRange(location: 0, length: 3)
        //    )
        //    usernameTextField.attributedPlaceholder = attributedString
        
        
        // 아래의 매소드를 불러와서, placeholder 를 지정해서 만듬.
        usernameTextField.configureAttributedString(
            string: "아이디를 입력해주세요.",
            range: NSRange(location:0, length: 3),
            stringColor: UIColor.red.withAlphaComponent(0.5)
        )
        
        // password 텍스트 필드에 이모티콘을 넣을 넣을것임.
        

        passwordTextField.leftView = UIImageView(image: #imageLiteral(resourceName: "key"))
        passwordTextField.leftViewMode = .always
        
        passwordTextField.configureAttributedString(string: "비밀번호를 입력해주세요", range: NSRange(location:0, length: 1), stringColor: UIColor.red.withAlphaComponent(0.5))

        
        
        // IOS 프레임 워크에서 디폴트 값으로 노티피 케이션을 받아오는데, 로그인 뷰컨트롤러 인스턴스가 받게되는데,
        
        // 키보드가 올라올때, 어떤 알람을 보내는데, 그것을 관찰하기 위한 옵져버를 정의함, ViewController 가 보고, 관찰할 것은 키보드가 올라올때임.
        // 키보드가 올라갈때 샐럭터
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        // 키보드를 다시 내리기 위한 뒤의 변수들을 주의해서 작성 해주어야한다.
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillSHide(notification:)), name: NSNotification.Name.UIKeyboardDidHide, object: nil)
        
        
        
    }
    
    // 노티피케이션을 사용할때 중요한것은 파라미터를 받아 주어야 한다, Notification에서 keyboard에 관한것들은 같이 던져준다는 의미이다..
    @objc func keyboardWillShow(notification: Notification) {
        
                                //userInfo는 여러가지 정보를 담고 있는데, apple에서 미리 정해 놓은것임..
        guard let userInfo = notification.userInfo else { return }
                                        // 에플에서 정해준 key값을 가지고 온다.
                                        // 키보드의 프레임 값이라는 의미
        guard let keyboardFrame = userInfo[UIKeyboardFrameBeginUserInfoKey] as? CGRect else { return }
        
        // 이 값을 적정하게 사이즈를 조절해주면된다...
        
        //우리가 건드려야하는 부분은 bottom 이다. 그래서 다른부분은 상관이 없음
        scrollVier.contentInset = UIEdgeInsetsMake(0, 0, (keyboardFrame.size.height)+50, 0)
        
        
    }
    
    // 키보드 올린것을 다시 내리는 함수
    //CGRect 값을 반환해서 다른 녀석으로 넘겨주는것임.
    @objc func keyboardWillSHide(notification: Notification) {
        
        scrollVier.contentInset = UIEdgeInsets.zero
        
        
        
    }
    
    //로그인 버튼을 눌렀을때 싱글톤 패턴으로 사용되어 진 녀석안의 값을 확인해서 로그인 처리를 해줌.
    @IBAction func didTapSignInButton(_ sender: RoundButton) {
        print("로그인 누름")
        
        guard let username = usernameTextField.text, !username.isEmpty else {return}
        guard let password = passwordTextField.text, !password.isEmpty else {return}
        
        
    
        
        // 아래의 함수를 통해서 어떤 true, false 가 떨어지면
        if UserService.sharedInstance.validateUserInfo(username: username, password: password) {
            // 로그인 성공
            print("로그인 성공")
            
        }else {
            print(username, password)
            
            print("로그인 실패")
        }
        
        

        }
    
}

