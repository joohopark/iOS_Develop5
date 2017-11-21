# 17_11-20

---

## Instagram 만들기

#### - Start 17.11.20 <br>
| 로그인 | 회원가입 |
| :---: | :---: |
| ![screen](/study/image/instagram.png) |![screen](/study/image/instagram-1.png) |

stroy 보드를 사용하지 않고, 코드로 Instagram을 만들어봅니다.. autoLayout을 사용해서 instagram 을 만들어 봅니다..!

#### - Start 17.11.21 <br>


| Main | profile image 설정 |
| :---: | :---: |
| ![screen](/study/image/instagram-Main.png) |![screen](/study/image/instagram-Main-1.png) |

firebase 를 이용해서, profile image 를 설정 -> 저장, 저장후, 다시 로그인을 하게되면, 다시 불러오는 모습까지 실행합니다.


---


## Firebase Auth(17.11.20)

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



-------------------------

## navigationView 설정(17.11.21)

#### - navigationView를 rootView로 하려고 한다면, 아래와 같은 방식으로 할수 있다.<br>

```swift

let tabbar = UItabbarController()
tabbar.viewControllers = [ViewController(), ViewControllerTwo(),.... 이런식으로]

window = UIWindow(frame: UIScreen.mai.bounds)
window.rootViewcontrooler = UITabBarController()
window.makeyAndvisible

UITabBarController class 에서 이렇게 넣어줌
self.viewControllers = [navi1]
 
```

#### - navigation 정의

```swift

** 로그인 버튼 부분 

let goTabBar = MainTabbarController()
        
        let homeVC = HomeViewController()
        let searchVC = SearchViewController()
        let addPostVC = AddPostViewController()
        let likeVC = LikeViewController()
        let browsingVC = BrowsingViewController()
        
        goTabBar.viewControllers = [homeVC, searchVC, addPostVC, likeVC, browsingVC]
        
        //let image = UIImage(named: "home.png")


        
        homeVC.tabBarItem.image = #imageLiteral(resourceName: "home_unselected")
        searchVC.tabBarItem.image = #imageLiteral(resourceName: "search_unselected")
        addPostVC.tabBarItem.image = #imageLiteral(resourceName: "plus_unselected")
        likeVC.tabBarItem.image = #imageLiteral(resourceName: "like_unselected")
        browsingVC.tabBarItem.image = #imageLiteral(resourceName: "profile_unselected")
        
> 로그인 버튼을 눌렀을때, 로그인이 설정한다면, 그자리에서, tabBar Controller 를 만들어서 생성 해주었습니다.
> 
> tabbar를 만들기 위해서는, ViewController와, UITabBarController Class 를 미리 만들어 놓아야 합니다. 
```


#### - FireBase Storage, DataBase 사용하기

```swift


import UIKit
import Firebase
import CoreData



class HomeViewController: UIViewController {
  
  // Database, Storage 의 Reference
  var ref: DatabaseReference!
  let storageRef = Storage.storage().reference()
  
  // 접속자의 UID 를 가져올수 있습니다. 
  let uid = Auth.auth().currentUser?.uid
  
  
  var profileBtn: UIButton = {
    var btn = UIButton()
    btn.frame = CGRect(x: 50, y: 50, width: 100, height: 100)
    btn.layer.cornerRadius = 37
    btn.clipsToBounds = true
    btn.contentMode = .scaleAspectFill
    btn.setTitle("+ \n add", for: .normal)
    btn.setTitleColor(.black, for: .normal)
    btn.translatesAutoresizingMaskIntoConstraints = false
    
    return btn
  }()
}

** Storage 에 이미지를 저장하고, Database 에 이미지가 저장된 Path 를 value값으로 저장합니다.

func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    
    print(info)
    if let img = info[UIImagePickerControllerOriginalImage] as? UIImage {
      print("이미지선택")
      // 이미지 선택후, 서버에 넣는 방법을 여기서 해주어야 할것 같음.
      profileBtn.setImage(img, for: .normal)
      
      // 1. 업로드할 이미지를 변환후.
      let uploadimage = UIImageJPEGRepresentation(img, 0.3)
      
      // 2. 이미지의 이름은 uuid 로 정의합니다. 
      let filename = NSUUID().uuidString
      
      // 3. Storage에 저장합니다
      Storage.storage().reference().child(uid!).child(filename).putData(uploadimage!, metadata: nil, completion: { (metadata, error) in
        print(error,metadata)
        
        // storage의 image firePath
        guard let profileImageUrl = metadata?.downloadURL()?.absoluteString else { return }
        let dic = ["image": profileImageUrl]
        
        // storage 에 저장하면서, Database에 같이 저장합니다.
        Database.database().reference().child(self.uid!).updateChildValues(dic, withCompletionBlock: { (err, ref) in
          print(err,ref)
          //완료후 행동
        })
      })
      picker.dismiss(animated: true, completion: nil)
      
    }
  }

 -> firebase의 storage 와, Database 에 저장하고, 로그인했을경우, 저장해놓은 이미지는 그대로 유지하기위해서, firebase에서 다시 load 해줍니다.
 
 ** ViewController 의 ViewdidLoad 부분 
 
     
    ref.child(uid!).observeSingleEvent(of: .value) { (dataSnapshot, string) in
      print(dataSnapshot, dataSnapshot.value)
      if let loadData = dataSnapshot.value as? NSDictionary {
        DispatchQueue.main.async {
          let imagePath = loadData["image"] as! String
          let data = try? Data(contentsOf: URL(string: imagePath)!)
          
          self.profileBtn.setImage(UIImage(data: data!), for: .normal)
        }
      }
    }
    
-> 가져온 값을 모델링을 통해서 원하는곳에 집어넣어줍니다..! 

```

#### - UI 정의 


```swift


import UIKit
import Firebase
import CoreData



class HomeViewController: UIViewController {
  
  var ref: DatabaseReference!
  let storageRef = Storage.storage().reference()
  let uid = Auth.auth().currentUser?.uid
  
  var profileBtn: UIButton = {
    var btn = UIButton()
    btn.frame = CGRect(x: 50, y: 50, width: 100, height: 100)
    btn.layer.cornerRadius = 37
    btn.clipsToBounds = true
    btn.contentMode = .scaleAspectFill
    btn.setTitle("+ \n add", for: .normal)
    btn.setTitleColor(.black, for: .normal)
    btn.translatesAutoresizingMaskIntoConstraints = false
    
    return btn
  }()
  
  /*var postNumberLB: UILabel = {
    var lb = UILabel(frame: CGRect(x: 30, y: 30, width: 50, height: 50))
    lb.layer.borderColor = UIColor.black.cgColor
    lb.layer.borderWidth = 2.0
    lb.textAlignment = .center
    lb.text = "123"
    lb.font.withSize(20)
    lb.translatesAutoresizingMaskIntoConstraints = false
    return lb
  }()

  var postLB: UILabel = {
    var lb = UILabel(frame: CGRect(x: 30, y: 30, width: 50, height: 50))
    lb.layer.borderColor = UIColor.black.cgColor
    lb.layer.borderWidth = 2.0
    lb.text = "post"
    lb.textAlignment = .center
    lb.translatesAutoresizingMaskIntoConstraints = false
    return lb
  }()
  
  var followerNumberLB: UILabel = {
    var lb = UILabel()
    lb.translatesAutoresizingMaskIntoConstraints = false
    lb.layer.borderColor = UIColor.black.cgColor
    lb.layer.borderWidth = 2.0
    lb.textAlignment = .center
    lb.text = "456"
    return lb
  }()
  
  var : UILabel = {
    var lb = UILabel()
    
    lb.translatesAutoresizingMaskIntoConstraints = false
    lb.layer.borderColor = UIColor.black.cgColor
    lb.layer.borderWidth = 2.0
    lb.textAlignment = .center
    lb.text = "follower"
    return lb
  }()
  
  var followingNumberLB: UILabel = {
    var lb = UILabel()
    lb.translatesAutoresizingMaskIntoConstraints = false
    lb.layer.borderWidth = 2.0
    lb.layer.borderColor = UIColor.black.cgColor
    lb.textAlignment = .center
    lb.text = "789"
    return lb
  }()
  
  var followingLB: UILabel = {
    var lb = UILabel()
    lb.translatesAutoresizingMaskIntoConstraints = false
    lb.layer.borderWidth = 2.0
    lb.layer.borderColor = UIColor.black.cgColor
    lb.textAlignment = .center
    lb.text = "following"
    return lb
  }()
  
  var stackView1: UIStackView = {
    let stack = UIStackView()
    
    stack.axis = UILayoutConstraintAxis.vertical
    stack.spacing = 4
    stack.alignment = .fill
    stack.distribution = .fillEqually
    stack.translatesAutoresizingMaskIntoConstraints = false
    return stack
    
  }()
  
  var stackView2: UIStackView = {
    let stack = UIStackView()
    
    stack.axis = UILayoutConstraintAxis.vertical
    stack.spacing = 4
    stack.alignment = .fill
    stack.distribution = .fillEqually
    stack.translatesAutoresizingMaskIntoConstraints = false
    
    return stack
    
  }()
   
  var stackView3: UIStackView = {
    let stack = UIStackView()
    
    stack.axis = UILayoutConstraintAxis.vertical
    stack.spacing = 4
    stack.alignment = .fill
    stack.distribution = .fillEqually
    stack.translatesAutoresizingMaskIntoConstraints = false
    
    return stack
    
  }()
  
  var stackView4: UIStackView = {
    let stack = UIStackView()
    
    stack.axis = UILayoutConstraintAxis.horizontal
    stack.spacing = 4
    stack.alignment = .fill
    stack.distribution = .fillEqually
    stack.translatesAutoresizingMaskIntoConstraints = false
    
    return stack
    
  }()
  */
  
  
  var postNumberLB: UILabel!
  var postLB: UILabel!
  var followerNumberLB: UILabel!
  var followerLB: UILabel!
  var followingNumberLB: UILabel!
  var followingLB: UILabel!
  
  var stackView1: UIStackView!
  var stackView2: UIStackView!
  var stackView3: UIStackView!
  var stackView4: UIStackView!
  var stackView5: UIStackView!
  
  var editProfileBtn: UIButton!
  
  private func setupLayout() {
    postNumberLB = UILabel(frame: CGRect(x: 10, y: 10, width: 10, height: 10))
    postLB = UILabel(frame: CGRect(x: 10, y: 10, width: 10, height: 10))
    followerNumberLB = UILabel(frame: CGRect(x: 10, y: 10, width: 10, height: 10))
    followerLB = UILabel(frame: CGRect(x: 10, y: 10, width: 10, height: 10))
    followingNumberLB = UILabel(frame: CGRect(x: 10, y: 10, width: 10, height: 10))
    followingLB = UILabel(frame: CGRect(x: 10, y: 10, width: 10, height: 10))
    editProfileBtn = UIButton(frame: CGRect(x: 10,y: 10, width: 10, height: 10))
    
    editProfileBtn.addTarget(self, action: #selector(self.editBtnAction(_:)), for: .touchUpInside)

    postNumberLB.text = "123"
    postLB.text = "post"
    followerNumberLB.text = "456"
    followerLB.text = "follower"
    followingNumberLB.text = "789"
    followingLB.text = "follwing"
    
    editProfileBtn.setTitle("프로필 수정", for: .normal)
    editProfileBtn.setTitleColor(.black, for: .normal)
    
    postNumberLB.textAlignment = .center
    postLB.textAlignment = .center
    followerNumberLB.textAlignment = .center
    followerLB.textAlignment = .center
    followingNumberLB.textAlignment = .center
    followingLB.textAlignment = .center
    
    stackView1 = UIStackView(arrangedSubviews: [postNumberLB,postLB])
    stackView2 = UIStackView(arrangedSubviews: [followerNumberLB,followerLB])
    stackView3 = UIStackView(arrangedSubviews: [followingNumberLB,followingLB])
    stackView4 = UIStackView(arrangedSubviews: [stackView1,stackView2,stackView3])
    stackView5 = UIStackView(arrangedSubviews: [stackView4,editProfileBtn])
    
    stackView1.axis = UILayoutConstraintAxis.vertical
    stackView1.alignment = .fill
    stackView1.distribution = .fillEqually
    
    stackView2.axis = UILayoutConstraintAxis.vertical
    stackView2.alignment = .fill
    stackView2.distribution = .fillEqually
    
    stackView3.axis = UILayoutConstraintAxis.vertical
    stackView3.alignment = .fill
    stackView3.distribution = .fillEqually
    
    stackView4.axis = UILayoutConstraintAxis.horizontal
    stackView4.alignment = .fill
    stackView4.distribution = .fillEqually
    
    stackView5.axis = UILayoutConstraintAxis.vertical
    stackView5.alignment = .fill
    stackView5.distribution = .fillEqually
    
    stackView1.frame = CGRect(x: 100, y: 100, width: 100, height: 150)
    stackView2.frame = CGRect(x: 100, y: 250, width: 100, height: 150)
    stackView3.frame = CGRect(x: 100, y: 400, width: 100, height: 150)
    stackView4.frame = CGRect(x: 100, y: 100, width: 200, height: 200)
    stackView5.frame = CGRect(x: 100, y: 50, width: 200, height: 100)
    
    self.view.addSubview(stackView5)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    ref = Database.database().reference()
    view.backgroundColor = .white
    view.addSubview(profileBtn)
    
    profileBtn.addTarget(self, action: #selector(self.profileBtnAction(_:) ), for: .touchUpInside)
    self.setLayoutMultiplier(target: profileBtn,
                             centerXMultiplier: 0.3,
                             centerYMultiplier: 0.3,
                             widthMultiplier: 0.2,
                             heightMultiplier: 0.112)
    
    setupLayout()
    
    
    ref.child(uid!).observeSingleEvent(of: .value) { (dataSnapshot, string) in
      print(dataSnapshot, dataSnapshot.value)
      if let loadData = dataSnapshot.value as? NSDictionary {
        DispatchQueue.main.async {
          let imagePath = loadData["image"] as! String
          let data = try? Data(contentsOf: URL(string: imagePath)!)
          
          self.profileBtn.setImage(UIImage(data: data!), for: .normal)
        }
      }
    }
  }
  
  
  @objc func editBtnAction(_ sender: UIButton) {
    print("edit 버튼 실행")
  }
  
  
@objc func profileBtnAction(_ sender: UIButton) {
  print("profileBtnAction button")
  let cameraController = UIImagePickerController()
  cameraController.delegate = self
  cameraController.sourceType = .photoLibrary
  present(cameraController, animated: true, completion: nil)
}


}
extension HomeViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
  // 사진을 선택 후 불리는 델리게이트 메소드
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    
    print(info)
    if let img = info[UIImagePickerControllerOriginalImage] as? UIImage {
      print("이미지선택")
      // 이미지 선택후, 서버에 넣는 방법을 여기서 해주어야 할것 같음.
      profileBtn.setImage(img, for: .normal)
      
      let uploadimage = UIImageJPEGRepresentation(img, 0.3)
      let filename = NSUUID().uuidString
      // 폴더이름      // 이미지 이름
      Storage.storage().reference().child(uid!).child(filename).putData(uploadimage!, metadata: nil, completion: { (metadata, error) in
        print(error,metadata)
        // storega의 firePath
        guard let profileImageUrl = metadata?.downloadURL()?.absoluteString else { return }
        let dic = ["image": profileImageUrl]
        
        
        Database.database().reference().child(self.uid!).updateChildValues(dic, withCompletionBlock: { (err, ref) in
          print(err,ref)
          //완료후 행동
        })
      })
      picker.dismiss(animated: true, completion: nil)
      
    }
  }
  //취소했을때 불리는 델리게이트 메소드
  func imagePickerControllerDidCancel(_ picker:
    UIImagePickerController) {
    picker.dismiss(animated: true, completion: nil)
  }
}



extension HomeViewController {
  
  func setLayoutMultiplier(target: AnyObject,
                           centerXMultiplier: CGFloat,
                           centerYMultiplier: CGFloat,
                           widthMultiplier: CGFloat,
                           heightMultiplier: CGFloat) {
    let targetTFCenterX = NSLayoutConstraint(item: target,
                                             attribute: NSLayoutAttribute.centerX,
                                             relatedBy: NSLayoutRelation.equal,
                                             toItem: self.view,
                                             attribute: NSLayoutAttribute.centerX,
                                             multiplier: centerXMultiplier,
                                             constant: 0)
    
    let targetTFCenterY = NSLayoutConstraint(item: target,
                                             attribute: NSLayoutAttribute.centerY,
                                             relatedBy: NSLayoutRelation.equal,
                                             toItem: self.view,
                                             attribute: NSLayoutAttribute.centerY,
                                             multiplier: centerYMultiplier,
                                             constant: 0)
    
    let targetTFWidth = NSLayoutConstraint(item: target,
                                           attribute: NSLayoutAttribute.width,
                                           relatedBy: NSLayoutRelation.equal,
                                           toItem: self.view,
                                           attribute: NSLayoutAttribute.width,
                                           multiplier: widthMultiplier,
                                           constant: 0)
    
    let targetTFHeight = NSLayoutConstraint(item: target,
                                            attribute: NSLayoutAttribute.height,
                                            relatedBy: NSLayoutRelation.equal,
                                            toItem: self.view,
                                            attribute: NSLayoutAttribute.height,
                                            multiplier: heightMultiplier,
                                            constant: 0)
    self.view.addConstraint(targetTFCenterX)
    self.view.addConstraint(targetTFCenterY)
    self.view.addConstraint(targetTFWidth)
    self.view.addConstraint(targetTFHeight)
  }
}

```

> stackView를 사용하였는데, label, button 같은 오브젝트들을 closure 로 묵어놓으니까, stackView에 담길때, 해당 오브젝트들의 frame 값이 모호하다는 애러가 계속 발생했습니다. 해당 인스턴스들이 생성되는 시점과, 스텍뷰에 넣어서 사용되어지는 시점을 명확하게 알고 다시 한번 접근 해야할것 같습니다.
> 

