
import UIKit

class CustomTextField: UITextField {
  
    
  func configureAttributedString(
    string: String,
    range: NSRange,
    stringColor: UIColor
  ) {
    
    // attribute 스트링을 만드는 부분.
    let attributedString = NSMutableAttributedString(string: string)
    attributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: stringColor, range: range
    )
    
    // attribute 만들어서 placeholder 에 넣어줌.
    self.attributedPlaceholder = attributedString
  }
  
  
  override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
    
    return CGRect(x: 5, y: 5, width: 10, height: 10)
  }
  
  
  
}
