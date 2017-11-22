
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
  
   // fill. fillEqually -> 이거 두가지 사용해서, 둘의 속성을 몰라서 생기는 문제 같음.
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
    stackView5.spacing = 30
    stackView5.alignment = .fill
    stackView5.distribution = .fillEqually
    
    stackView1.frame = CGRect(x: 100, y: 100, width: 100, height: 150)
    stackView2.frame = CGRect(x: 100, y: 250, width: 100, height: 150)
    stackView3.frame = CGRect(x: 100, y: 400, width: 100, height: 150)
    stackView4.frame = CGRect(x: 100, y: 100, width: 200, height: 200)
    stackView5.frame = CGRect(x: 100, y: 50, width: 265, height: 100)
    
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




