

import UIKit

class CustomView: UIView {

    

    
    
    //
    @IBOutlet var customViewLB: UILabel?
    
    var delegate: CustomViewDelegate?
    
    
    @IBAction func CustomViewBtnAction(_ sender: UIButton)
    {
        
        customViewLB?.text = delegate?.changeTextLB(self)
        
        
        
        print("CustomView 버튼")
    }
    
}


protocol CustomViewDelegate {
    func changeTextLB(_ x: CustomView) -> String
}
