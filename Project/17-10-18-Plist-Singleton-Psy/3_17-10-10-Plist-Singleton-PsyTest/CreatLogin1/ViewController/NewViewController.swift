
import UIKit

class NewViewController: UIViewController {
    

    // 텍스트 필드 연결 -> CustomTextField 상속 받음.
    @IBOutlet weak var userNameTextField: CustomTextField!
    @IBOutlet weak var passwordTextField: CustomTextField!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // image 이터럴을 사용해서 아가 assets 에서 받은 이미지를 바로 넣어주었다.
        // TExtField의 왼쪽 부분에 이미지를 넣고, 그 이미지를 항상 띄워 놓겠다는 의미이다
        userNameTextField.leftView = UIImageView(image: #imageLiteral(resourceName: "profile"))
        userNameTextField.leftViewMode = .always
        
        // 아래의 매소드를 불러와서, placeholder 를 지정해서 만듬.
        // placeholder 을 Atrributed 텍스트로 만들어주었다. 이때 설정 해주는 값은
        // String, Atrributed 가 설정될 텍스트 범위, Color 값이 적용 되었다.
        userNameTextField.configureAttributedString(
            string: "아이디를 입력해주세요.",
            range: NSRange(location:0, length: 3),
            stringColor: UIColor.red.withAlphaComponent(0.5)
        )
        
        passwordTextField.leftView = UIImageView(image: #imageLiteral(resourceName: "Icon"))
        passwordTextField.leftViewMode = .always
        
        // 아래의 매소드를 불러와서, placeholder 를 지정해서 만듬.
        // placeholder 을 Atrributed 텍스트로 만들어주었다. 이때 설정 해주는 값은
        // String, Atrributed 가 설정될 텍스트 범위, Color 값이 적용 되었다.
        passwordTextField.configureAttributedString(
            string: "비밀번호를 입력해주세요.",
            range: NSRange(location:0, length: 3),
            stringColor: UIColor.red.withAlphaComponent(0.5)
        )
        
        
    }

    

    
    
    
    @IBAction func CreatAccountActionBtn(_ sender: RoundButton) {
        print("CreatAccountActionBtn 버튼눌림")
        
    }
    
    @IBAction func LoginActionBtn(_ sender: RoundButton) {
        print("LoginActionBtn버튼눌림")
        
        guard let username = userNameTextField.text, !username.isEmpty else {return}
        guard let password = passwordTextField.text, !password.isEmpty else {return}
        
        if getPlistData.sharedInstance.validateUserInfo(username: username, password: password) {
            // 로그인 성공
            print("로그인 성공")
            
        }else {
            
            print("로그인 실패")
            
            
            
        }
        
    }
        
        


        
    

    
    // backbutton을 segue 로 정의 한다. 이때 돌아오려고하는 곳에서 segue 버튼을 만들어 주어야 한다.
    // 돌아오는 버튼은 AccountPage에, segue 정의는 NewViewContorller에서 한다
    @IBAction func unwindToFirstViewController(segue: UIStoryboardSegue) {
        
        print("unwindToFirstViewController")
        
        
    }
    
        
        
        
}

        

    
    
    


