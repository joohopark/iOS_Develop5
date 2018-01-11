
import UIKit
import Firebase
import CoreData

class NextPostViewController: UIViewController {
  var ref: DatabaseReference!
  let storageRef = Storage.storage().reference()
  let uid = Auth.auth().currentUser?.uid
  var dic: [String : [String : [String : String]]]?
  
  
  let headerImageView: UIImageView = {
    let iv = UIImageView()
    iv.contentMode = .scaleAspectFill
    iv.clipsToBounds = true
    iv.backgroundColor = .lightGray
    return iv
  }()
  
  
  let postTextView: UITextView = {
    let tf = UITextView()
    tf.isEditable = true
    tf.layer.borderColor = UIColor.black.cgColor
    tf.layer.borderWidth = 4
    return tf
  }()
  
  var indicate: UIActivityIndicatorView! = {
    let idc = UIActivityIndicatorView()
    idc.backgroundColor = .black
    
    return idc
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .white
    ref = Database.database().reference()
    self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                             target: self,
                                                             action: #selector(self.networkPost(_:)) )
    
    view.addSubview(headerImageView)
    view.addSubview(postTextView)
    
    
    
    headerImageView.frame = CGRect(x: 0, y: (self.navigationController?.navigationBar.bounds.size.height)!,
                                   width: self.view.frame.size.width/5, height: self.view.frame.size.height/6)
    
    postTextView.frame = CGRect(x: self.view.frame.size.width/5,
                                y: (self.navigationController?.navigationBar.bounds.size.height)!,
                                width: self.view.frame.size.width*5,
                                height: self.view.frame.size.height*0.4)
    
    
    
    // Do any additional setup after loading the view.
  }
  
  @objc func networkPost(_ sender: UIBarButtonItem) {
    
    let indicateCGRect = CGRect(x: self.view.center.x, y: self.view.center.y, width: 100, height: 100)
    indicate = UIActivityIndicatorView(frame: indicateCGRect)
    view.addSubview(indicate)
    indicate.startAnimating()
    indicate.hidesWhenStopped = true
    guard let image = self.headerImageView.image else { return }
    
    let uploadimage = UIImageJPEGRepresentation(image, 0.3)
    let filename = NSUUID().uuidString
    
    
    Storage.storage().reference().child(uid!).child(filename).putData(uploadimage!, metadata: nil) { (metadata, error) in
      //storage 의 Path
      guard let profileImageUrl = metadata?.downloadURL()?.absoluteString else { return }
      guard let postText = self.postTextView.text else { return }
      // ref의 index 값을 불러온후. 저장해주려고함.
      
      
      self.ref.child(self.uid!).observeSingleEvent(of: .value, andPreviousSiblingKeyWith: { (dataSnapshot, string) in
        
        
        if let loadData = dataSnapshot.value as? NSDictionary {
          
          guard let postIndex = loadData["post"] as? NSArray, postIndex != nil else {
            self.dic = ["post": ["1": ["image": profileImageUrl, "contents": postText]]]
            
            Database.database().reference().child(self.uid!).updateChildValues(self.dic!, withCompletionBlock: { (error, data) in
              
              
              
              
            })
            
            
            return
            
          }
          
          
          
          self.dic = ["\(postIndex.count+1)": ["1": ["image": profileImageUrl, "contents": postText]]]
          
          let updateDic = ["\(postIndex.count)": ["image": profileImageUrl, "contents": postText]]
          //          self.dic = ["\(postIndex.count+1)": ["image": profileImageUrl, "contents": postText]]
          Database.database().reference().child(self.uid!).child("post").updateChildValues(updateDic, withCompletionBlock: { (error, data) in
            
            DispatchQueue.main.async {
              
              //self.navigationController?.popToViewController(MainTabbarController(), animated: true)
              //self.navigationController?.popToRootViewController(animated: true)
              self.dismiss(animated: true, completion: nil)
              
              self.indicate.stopAnimating() 
            }
          })
        }
      })
    } 
  }
}
