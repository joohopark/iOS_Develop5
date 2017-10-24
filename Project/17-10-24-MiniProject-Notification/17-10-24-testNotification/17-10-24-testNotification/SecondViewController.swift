
import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var secondLB: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let queue = OperationQueue()
        
        

        NotificationCenter.default.addObserver(forName: Notification.Name.init("TestNoti"), object: nil, queue: nil) { (noti) in
            
            if let text = noti.object as? String {
                self.secondLB.text = text
            }
            // notification에 대한 실행
            
            print(noti.object)
            print(noti.userInfo)
            
            
        }
    }
        

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // 노티피케이션에 옵져빙 등록
        
        
        
    }
    

    
    

}
