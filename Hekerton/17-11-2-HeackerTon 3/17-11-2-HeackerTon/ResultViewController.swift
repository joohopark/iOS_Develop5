

import UIKit

class ResultViewController: UIViewController {
  

//  @IBOutlet weak var resultText: UILabel!
  @IBOutlet weak var resultTextField: UITextView!
    
    var resultText = ""
    var typeText = ""
    var inputName = ""
  
  override func viewDidLoad() {
    super.viewDidLoad()
    resultTextField.text = "\(inputName) 님의 타입은 \(typeText) 입니다" + "\n" + resultText
    

  }
  
  
  
  
  
}

