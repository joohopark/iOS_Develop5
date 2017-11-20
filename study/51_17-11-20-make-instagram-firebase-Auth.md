# 17_11-20

---

## Instagram 만들기

#### - Start 17.11.20 <br>
| 로그인 | 회원가입 |
| :---: | :---: |
| ![screen](/study/image/instagram.png) |![screen](/study/image/instagram-1.png) |

stroy 보드를 사용하지 않고, 코드로 Instagram을 만들어봅니다.. autoLayout을 사용해서 instagram 을 만들어 봅니다..!

---


## Firebase Auth 

| Authentication | * |
| :---: | :---: |
| ![screen](/study/image/firebaseAuth.png) |![screen](/study/image/firebaseAuth-1.png) |

회원가입 아이디와, 로그인을 firebase로 간단하게 처리 할수 있습니다.

```swift

** AppDelegate 

import Firebase

func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    FirebaseApp.configure()
    
    let startViewController: StartViewController = StartViewController()
    window?.rootViewController = startViewController
    return true
  }
  
** ViewController 회원가입 부분 

@objc func CreateAccountBtnAction(_ sender: UIButton) {
    
    guard let id = accounId.text else {return}
    guard let pw = accountPw.text else {return}
    guard let checkPw = accountCheckPw.text else {return}
    
    if pw != checkPw {
      print("print 비밀번호가 일치하지 않습니다")
    }else {
      Auth.auth().createUser(withEmail: id, password: pw, completion: { (user, error) in
        if error == nil && user != nil {
          print("회원가입 완료!")
          print(user)
          
        }else {
          // firebase 에서 제공하는 에러 string
          print(error?.localizedDescription)
        }
      })
    }
    dismiss(animated: true, completion: nil)
  }


  
user, error 에 firebase 에서 보내주는 requeset 값이 들어있습니다. 회원가입후
`Authentication` 탭에서 회원가입 여부를 확인할수 있습니다. 


** ViewController 로그인 부분
  @objc func loginBtnAction(_ sender: UIButton) {
    print("loginBtn")
    
    guard let id = idTF.text else {return}
    guard let pw = pwTF.text else {return}
    
    
    Auth.auth().signIn(withEmail: id, password: pw) { (user, error) in
      if error == nil && user != nil {
        print(user)
        print("로그인완료")
        
      }else {
        print(error?.localizedDescription)
      }
    }
  }
```

---

## Code 로 AutoLayout 잡기


#### - 사용될 인스턴스 만들기

```swift

**계층 구조 

|--View
|----ScrollView
|------ContentView
|--------contentBackground
|----------idTF
|----------pwTF
|----------btn


** appDeleagate 부분 

func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    FirebaseApp.configure()
    
    let startViewController: StartViewController = StartViewController()
    window?.rootViewController = startViewController
    return true
  }
ViewController의 name 을 변경하니까, 시작 지점을 주기 위해서 window의 rootView를 변경 하였습니다.

** StartViewController 부분

class StartViewController: UIViewController {
  
  // 각 객체들은, closure로 만들어주었습니다.
  
  var loginScrollView: UIScrollView = {
    let sv = UIScrollView()
    sv.translatesAutoresizingMaskIntoConstraints = false
    sv.backgroundColor = .lightGray
    sv.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
    return sv
  }()
  var contentView: UIView = {
    let view = UIView()
    view.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  var contentBackground: UIImageView = {
    let image = UIImageView()
    image.translatesAutoresizingMaskIntoConstraints = false
    image.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
    image.image = UIImage(named: "Login Screen")
    image.isUserInteractionEnabled = true
    return image
  }()
  

  
  var idTF: UITextField = {
    let tf = UITextField()
    tf.backgroundColor = .clear
    tf.layer.borderColor = UIColor.white.cgColor
    tf.layer.cornerRadius = 10
    tf.layer.borderWidth = 1
    tf.attributedPlaceholder = NSAttributedString(string: "User ID",
                                                  attributes: [NSAttributedStringKey.foregroundColor : UIColor.white])
    tf.textColor = .white
    tf.textAlignment = .center
    tf.translatesAutoresizingMaskIntoConstraints = false
    return tf
  }()
  
  var pwTF: UITextField = {
    let tf = UITextField()
    tf.backgroundColor = .clear
    tf.layer.borderColor = UIColor.white.cgColor
    tf.layer.cornerRadius = 10
    tf.layer.borderWidth = 1
    tf.attributedPlaceholder = NSAttributedString(string: "PassWord",
                                                  attributes: [NSAttributedStringKey.foregroundColor : UIColor.white])
    tf.textColor = .white
    tf.textAlignment = .center
    tf.translatesAutoresizingMaskIntoConstraints = false
    return tf
  }()
  
  var loginBtn: UIButton = {
    let btn = UIButton()
    btn.frame = CGRect(x: 50, y: 270, width: 100, height: 100)
    btn.backgroundColor = .clear
    btn.setTitle("Sign In", for: .normal)
    btn.setTitleColor(.white, for: .normal)
    btn.translatesAutoresizingMaskIntoConstraints = false
    return btn
  }()
  
  var accountBtn: UIButton = {
    let btn = UIButton()
    btn.frame = CGRect(x: 50, y: 380, width: 100, height: 100)
    btn.backgroundColor = .clear
    btn.setTitle("Sign Up", for: .normal)
    btn.setTitleColor(.white, for: .normal)
    btn.translatesAutoresizingMaskIntoConstraints = false
    return btn
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(loginScrollView)
    loginScrollView.addSubview(contentView)
    
    contentView.addSubview(contentBackground)
    contentBackground.addSubview(idTF)
    contentBackground.addSubview(pwTF)
    contentBackground.addSubview(loginBtn)
    contentBackground.addSubview(accountBtn)
    loginScrollView.contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height)
    

    autoScrollView()
    autoContentView()
  }
```

#### - 사이즈 AutoLayout 잡기

```swift

// extension을 사용했습니다.
extension StartViewController {
  
  func setLayoutMultiplier(target: AnyObject,
                           centerXMultiplier: CGFloat,
                           centerYMultiplier: CGFloat,
                           widthMultiplier: CGFloat,
                           heightMultiplier: CGFloat) {
    let targetTFCenterX = NSLayoutConstraint(item: target,
                                             attribute: NSLayoutAttribute.centerX,
                                             relatedBy: NSLayoutRelation.equal,
                                             toItem: self.loginScrollView,
                                             attribute: NSLayoutAttribute.centerX,
                                             multiplier: centerXMultiplier,
                                             constant: 0)
    
    let targetTFCenterY = NSLayoutConstraint(item: target,
                                             attribute: NSLayoutAttribute.centerY,
                                             relatedBy: NSLayoutRelation.equal,
                                             toItem: self.loginScrollView,
                                             attribute: NSLayoutAttribute.centerY,
                                             multiplier: centerYMultiplier,
                                             constant: 0)
    
    let targetTFWidth = NSLayoutConstraint(item: target,
                                           attribute: NSLayoutAttribute.width,
                                           relatedBy: NSLayoutRelation.equal,
                                           toItem: self.loginScrollView,
                                           attribute: NSLayoutAttribute.width,
                                           multiplier: widthMultiplier,
                                           constant: 0)
    
    let targetTFHeight = NSLayoutConstraint(item: target,
                                            attribute: NSLayoutAttribute.height,
                                            relatedBy: NSLayoutRelation.equal,
                                            toItem: self.loginScrollView,
                                            attribute: NSLayoutAttribute.height,
                                            multiplier: heightMultiplier,
                                            constant: 0)
    
    self.view.addConstraint(targetTFCenterX)
    self.view.addConstraint(targetTFCenterY)
    self.view.addConstraint(targetTFWidth)
    self.view.addConstraint(targetTFHeight)
  }
}


** ViewDidLoad 부분

override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(loginScrollView)
    loginScrollView.addSubview(contentView)
    
    contentView.addSubview(contentBackground)
    contentBackground.addSubview(idTF)
    contentBackground.addSubview(pwTF)
    contentBackground.addSubview(loginBtn)
    contentBackground.addSubview(accountBtn)
    loginScrollView.contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height)
    
    self.setLayoutMultiplier(target: idTF,
                             centerXMultiplier: 1.0,
                             centerYMultiplier: 0.9,
                             widthMultiplier: 0.7,
                             heightMultiplier: 0.06)
    
    self.setLayoutMultiplier(target: pwTF,
                             centerXMultiplier: 1.0,
                             centerYMultiplier: 1.1,
                             widthMultiplier: 0.7,
                             heightMultiplier: 0.06)
    
    self.setLayoutMultiplier(target: loginBtn,
                             centerXMultiplier: 1.0,
                             centerYMultiplier: 1.3,
                             widthMultiplier: 0.7,
                             heightMultiplier: 0.06)
    
    self.setLayoutMultiplier(target: accountBtn,
                             centerXMultiplier: 1.0,
                             centerYMultiplier: 1.8,
                             widthMultiplier: 0.7,
                             heightMultiplier: 0.06)
    autoScrollView()
    autoContentView()

  }  
  func autoScrollView() {
    loginScrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    loginScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    loginScrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    loginScrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
  }
  
  func autoContentView() {
    self.contentView.centerXAnchor.constraint(equalTo: self.loginScrollView.centerXAnchor).isActive = true
    self.contentView.centerYAnchor.constraint(equalTo: self.loginScrollView.centerYAnchor).isActive = true
    self.contentView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
    self.contentView.heightAnchor.constraint(equalTo: self.view.heightAnchor).isActive = true
    
    self.contentBackground.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
    self.contentBackground.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
    self.contentBackground.leftAnchor.constraint(equalTo: self.contentView.leftAnchor).isActive = true
    self.contentBackground.rightAnchor.constraint(equalTo: self.contentView.rightAnchor).isActive = true
  
  }
```

#### - Keyboard 가 Textfield 를 가릴때 처리

```swift

** ViewDidLoad 부분

NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardDidShow(noti:)),
                                           name: .UIKeyboardWillShow,
                                           object: nil)
    
NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(noti:)),
                                           name: .UIKeyboardWillHide,
                                           object: nil)
                                           
@objc func keyboardWillHide(noti: Notification) {
    loginScrollView.contentInset = UIEdgeInsets.zero
  }
  
@objc func keyboardDidShow(noti: Notification) {
    guard let userInfo = noti.userInfo else { return }
    guard let keyFrame = userInfo[UIKeyboardFrameEndUserInfoKey] as? CGRect else {return}
    loginScrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyFrame.height, right: 0)
    
  }
```

스크롤뷰의 `EdgeInsets`을 이용해서 만들었습니다. 

---

계속 추가해가면서 만들어갈 생각입니다.










