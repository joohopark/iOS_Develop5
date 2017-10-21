

import UIKit

class InputViewViewController: UIViewController {
    
    @IBOutlet var tf: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func saveBtnHandler(_ sender: UIButton) {
        print("버튼눌림")
        
        let name = tf.text ?? ""
        DataCenter.mainCenter.addName(name)
        
        // 이전 ViewController로 돌아가는것
        self.navigationController?.popViewController(animated: true)
    }
   
}
