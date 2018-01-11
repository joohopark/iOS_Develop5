

import UIKit

class MainNavi: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UserDefaults.standard.set(false, forKey: "isLogined")
        
        
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        if !UserDefaults.standard.bool(forKey: "isLogined") {
            //showLoginPage()
            
            performSegue(withIdentifier: "LoginSegue", sender: nil)

            
        }
//
////            //아래의 녀석이 네비게이션 컨트롤러
////            if let presentVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginNavi") {
////                self.present(presentVC, animated: false, completion: nil)
////
////            }
//        }
    }
    
    
    func showLoginPage() {
        
//        if let presentVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginNavi")  {
//            self.present(presentVC, animated: false, completion: nil)
//
//        }
        
        // navi에서 segue로, storyboard reference로 가려면, segue 자체에, idenetifier를 넣어서 설정해서 옮겨주어야 한다.
           }

        
        
    
    
    
    
}

