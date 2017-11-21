
import UIKit
import Firebase


//Asdasd
//fc@fc.com
class StartViewController: UIViewController {
  
  
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
  
  
  var ref: DatabaseReference!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    ref = Database.database().reference()
    ref.observe(.childAdded) { (dataSnapshot) in
      print("childAdded value: \(dataSnapshot)")
    }
    
    ref.observe(.childChanged) { (dataSnapshot) in
      print("childchanged value: \(dataSnapshot)")
    }
    ref.observe(.childRemoved) { (dataSnapshot) in
      print("childRemoved value: \(dataSnapshot)")
    }
    
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
    NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardDidShow(noti:)),
                                           name: .UIKeyboardWillShow,
                                           object: nil)
    
    NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(noti:)),
                                           name: .UIKeyboardWillHide,
                                           object: nil)
    
    
    loginBtn.addTarget(self, action: #selector(self.loginBtnAction(_:)) , for: .touchUpInside)
    accountBtn.addTarget(self, action: #selector(self.accountBtnAction(_:)), for: .touchUpInside)
  }
  
  @objc func keyboardWillHide(noti: Notification) {
    loginScrollView.contentInset = UIEdgeInsets.zero
  }
  
  @objc func keyboardDidShow(noti: Notification) {
    guard let userInfo = noti.userInfo else { return }
    guard let keyFrame = userInfo[UIKeyboardFrameEndUserInfoKey] as? CGRect else {return}
    loginScrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyFrame.height, right: 0)
    
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
  
  @objc func loginBtnAction(_ sender: UIButton) {
    print("loginBtn")
    
    guard let id = idTF.text else {return}
    guard let pw = pwTF.text else {return}
    
    
    Auth.auth().signIn(withEmail: id, password: pw) { (user, error) in
      if error == nil && user != nil {
        print(user)
        print("로그인완료")
        
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
        
        self.present(goTabBar, animated: true, completion: nil)
      }else {
        print("오류는 \(error?.localizedDescription)")
      }
    }
  }
  
  @objc func accountBtnAction(_ sender: UIButton) {
    
    print("accountBtn")
    
    let nextVC = AccountViewController()
    present(nextVC, animated: true, completion: nil)
    
  }
  
}

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



