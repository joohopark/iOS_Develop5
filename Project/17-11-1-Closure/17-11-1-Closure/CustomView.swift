

import UIKit

class CustomView: UIView {

    

    
    
    //
    @IBOutlet var customViewLB: UILabel?
    
    var delegate: CustomViewDelegate?
    var closure: ((String) -> Void)?
    
    @IBAction func CustomViewBtnAction(_ sender: UIButton)
    {
        
        customViewLB?.text = delegate?.changeTextLB(self)
        closure?("asdf")
        print("CustomView 버튼")
    }
    
    
    
}


protocol CustomViewDelegate {
    func changeTextLB(_ x: CustomView) -> String
}
