
import UIKit
import Firebase
import CoreData

class MainViewController: UIViewController {
  
  var successLable: UILabel = {
    let lb = UILabel()
    lb.text = "로그인이 정상적으로 완료되었습니다."
    return lb
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print(Auth.auth().currentUser?.uid)
    view.backgroundColor = .white
    
    
    
    
    view.addSubview(successLable)
  }
  
}
