

import UIKit

class ResultViewController: UIViewController {
  
  @IBOutlet weak var resultView: UIView!
  @IBOutlet weak var resultText: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    resultView.layer.borderWidth = 1
    resultView.layer.borderColor = #colorLiteral(red: 0.8623481393, green: 0.8572215438, blue: 0.8662891984, alpha: 1)
    resultView.backgroundColor = #colorLiteral(red: 0.9654366374, green: 0.9596964717, blue: 0.9698489308, alpha: 1)
    resultView.layer.cornerRadius = 15
    resultText.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  
}

