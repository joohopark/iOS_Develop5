

import UIKit

class MainNavi: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        UserDefaults.standard.set(false, forKey: "isLogined")

        // notification 을 추가해서, Logout 을 하게되면, 불러오게 하려고 하는것 같음
        
        NotificationCenter.default.addObserver(forName: Notification.Name.init("logoutNoti"), object: nil, queue: nil) { (noti) in
            print("login 페이지 띄우기")
             (UIApplication.shared.delegate as? AppDelegate)?.window?.rootViewController = self.storyboard?.instantiateInitialViewController()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear")
        
        if !UserDefaults.standard.bool(forKey: "isLogined") {
            //showLoginPage()
            
            performSegue(withIdentifier: "LoginSegue", sender: nil)
            
            
        }
        
        
    }

    deinit {
        // 인스턴스가 사라질때, 내가 가지고 있는 모든 옵져버의 add 된것을 없애라.
        NotificationCenter.default.removeObserver(self)
    }
    

}
