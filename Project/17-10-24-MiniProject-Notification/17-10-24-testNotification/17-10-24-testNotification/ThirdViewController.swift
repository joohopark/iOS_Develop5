

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var thirdTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // 여기서 noti 를 post
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func thirdBtnAction(_ sender: UIButton) {
        NotificationCenter.default.post(name: Notification.Name.init("TestNoti"), object: thirdTF.text, userInfo: ["noti":"info"])
    }
    

}
