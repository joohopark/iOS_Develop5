
import UIKit

class MainNavi: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        UserDefaults.standard.set(false, forKey: "isLogined")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        performSegue(withIdentifier: "otherStoryboard", sender: nil)
            
        
        
        
        
//        if !UserDefaults.standard.bool(forKey: "isLogined") {
//            if let presentVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginNavi") {
//
//                self.present(presentVC, animated: true, completion: nil)
//
//            }
//
//        }
        
    }

    

}
