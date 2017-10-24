

import UIKit

class MainNavi: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // login 이 되지 않았으면,
        if !UserDefaults.standard.bool(forKey: "isLogined") {
            
            //아래의 녀석이 네비게이션 컨트롤러
            if let presentVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginNavi") {
                self.present(presentVC, animated: true, completion: nil)
                
            }
            
            
            
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}
