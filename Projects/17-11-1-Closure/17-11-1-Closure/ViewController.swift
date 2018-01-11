import UIKit

class ViewController: UIViewController, CustomViewDelegate {
    
    
    
    func changeTextLB(_ x: CustomView) -> String {
        
        var changString: String = "abc"
        return changString
    }
    
    
    
    @IBOutlet weak var otherView: CustomView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        otherView.delegate = self
        
        
        // weak 는 무조건 옵셔널 변수 밖에 안됨...
        //
        otherView.closure = {[weak self] (string) -> Void in
            
            
            self?.otherView.customViewLB?.text = string
        }
    }
    
    
    
}
