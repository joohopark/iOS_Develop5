
import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func popupBtn(_ sender: UIButton) {
        
        let popVC: PopupViewController = UIStoryboard(name: "popup", bundle: nil).instantiateViewController(withIdentifier: "popupVC") as! PopupViewController
        
        // View의 background의 투명하게 처리된부분이 아래의 옵션을 통해서 올라와 있는 View 가 보여지게 됨..
        popVC.modalPresentationStyle = .overCurrentContext
        self.present(popVC, animated: false, completion: nil)
    }
    


}
