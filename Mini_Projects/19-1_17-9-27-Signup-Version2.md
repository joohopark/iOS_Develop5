# 19-1 17.9.27

---

## 회원가입 페이지 만들기 ver.1

#### [프로젝트의 위치는 이곳입니다](/Mini_Projects/Projexts_Xcode/17-9-27-makeLoginPage-Version2)


---

##  회원가입 페이지 만들기 위한 Log

> 회원가입 페이지 만들기 ver.0 보다 조금더 간결하게 만들었습니다.

1. Login 부와, CreatAccount 부 두개로 나누었습니다. 사실 이런 모델구조는 좋은 구조는 아니지만, 지금까지 배운것을 복습한다는 것에 의미를 두고 만들었습니다. 사실 제일 좋은 구조는. login 부에서, userData 부에 접근해서 데이터를 확인하고, 있으면 login 시켜주고, CreatAccount 부에서는, 계정 정보를 생성하면, userData에 쌓아주는 형식으로 모델링 하는게 제일 좋지만.. 그렇게 하지않고, 간결하게 하기위해서 login 부와 CreatAccount 부로 나누었습니다.

2. 직관적으로 CreatAccount 부는 데이터를 저장하고, login 부에서는 데이터에 접근해서, input값을 대조하며, acces 할지 말지를 결정하게 만들었습다


<p align="center">

![screen](/study/image/Login.jpg) ![screen](/study/image/Login-1.jpg)
 
</p>


```swift
******login 부******
import UIKit
class ViewController: UIViewController {
    //TextField 
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passWordTextField: UITextField!
    // userData
    var userData: [[String:String]] = [
        ["name": "minjun", "password": "4321"],
    ]
    override func viewDidLoad() {
        super.viewDidLoad()   
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func loginActionButton(_ sender: UIButton) {
        print("로그인 버튼")    
        guard let userName = userNameTextField.text else {return}
        guard let passWord = passWordTextField.text else {return}
        // 로그인 체크 -> checkData 에, userDefualts 로 가지고 있는 옵셔널 값을 [[String:String]] 로 바꾸어주었음..!
        //이부분이 제일 까다로웠던 부분, 디폴트값을 타입변환 해주어야 하는데, 고려해야될 사항들이 조금있다. 
        guard let checkData:[[String:String]] = UserDefaults.standard.object(forKey: "userList") as? [[String:String]] else {
            return
        }
        // UserDefaults 가 여기에서는 이미 [[String:String]] 타입으로 변해있다. 그래서 바로 for 문에서 사용이 가능하다.
        for i in checkData {   
            if i["ID"] == userName {
                if i["PW"] == passWord {
                    print("로그인 성공")
                }else {
                    print("비밀번호가 틀립니다.")
                }
            }else {
                print("아이디가 없습니다. 아이디를 생성하세요")
            }
        }
    }
    
    // creatAccount 버튼
    @IBAction func CreatAccountActionButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}

****** CreatAccount 부 ******
import UIKit
class CreatAccountPage: UIViewController {
    // userData -> 그냥 인스턴스를 만들고, 자료값을 추가하면, 회원가입페이지에 넘어갔을때는, 자료값이 사라졌음..
    //textfield 모음
    @IBOutlet weak var accountUserNameTextField: UITextField!
    @IBOutlet weak var accountPassWordTextField: UITextField!
    @IBOutlet weak var accountCheckPassWordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //exit 버튼
    @IBAction func didTapExitActionButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

    //cerat Account 버튼
    @IBAction func creatNewAccountActionButton(_ sender: UIButton) {        
        guard let userName = accountUserNameTextField.text else { return }
        guard let passWord = accountPassWordTextField.text else { return }
        guard let checkPassWord = accountCheckPassWordTextField.text else { return }
        if passWord != checkPassWord {
            print("비밀번호가 같지 않습니다")  
            accountPassWordTextField.text = ""
            accountCheckPassWordTextField.text = ""
            return 
        }else {
            // 데이터를 유저 디폴트 값으로 저장함, 최종적으로 [[String: String]] 로 만들고 싶은데, 좀더 직관적으로 하기위해서, 하위 데이터를 나누었다.
            let userData:[String:String] = ["ID":userName, "PW":passWord]
            let list:[[String:String]] = [userData]
            // 최종적으로 UserDefaults 안에, userList -> [[String: String]] 값에, [String: String] 값이 들어갔다.
            UserDefaults.standard.set(list, forKey: "userList")
            print(userData,list, UserDefaults.standard.object(forKey: "userList"))
            /*guard var userList = UserDefaults.standard.array(forKey: "data") as? [[String: String]] else { return }
            for dictionary in userList {
                if dictionary["name"] == userName && dictionary["password"] == passWord {
                    let resultList = userList.append(["name": userName, "password": passWord])
                    UserDefaults.standard.set(resultList, forKey: "data")
                }
            }*/
            //데이터 추가후 화면전환
            dismiss(animated: true, completion: nil)
        }
    }
}
```

---

> ver.0 보다 훨씬 간결하게 구현했다.. 하지만 이 회원가입 페이지의 가장 맹점은 한명밖에 로그인을 하지못한다는것.....UserDefaults를 구조화 시켜서 데이터를 쌓을수 있는 방법을 한번 고민해보자.



 