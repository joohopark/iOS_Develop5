
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var graph1Height: NSLayoutConstraint!
    @IBOutlet weak var graph2Height: NSLayoutConstraint!
    @IBOutlet weak var graph3Height: NSLayoutConstraint!
    @IBOutlet weak var graph4Height: NSLayoutConstraint!
    @IBOutlet weak var graph5Height: NSLayoutConstraint!
    @IBOutlet weak var graph6Height: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
        
    @IBAction func btn1Action(_ sender: UIButton) {
        UIView.animate(withDuration: 3, animations: {
            self.graph1Height = self.graph1Height.changeMultiplier(changeMultiplier: 0.1)
            self.graph2Height = self.graph2Height.changeMultiplier(changeMultiplier: 0.2)
            self.graph3Height = self.graph3Height.changeMultiplier(changeMultiplier: 0.3)
            self.graph4Height = self.graph4Height.changeMultiplier(changeMultiplier: 0.4)
            self.graph5Height = self.graph5Height.changeMultiplier(changeMultiplier: 0.5)
            self.graph6Height = self.graph6Height.changeMultiplier(changeMultiplier: 0.6)
            
            self.view.layoutIfNeeded()
        })
    }
    
    
    @IBAction func btn2Action(_ sender: UIButton) {
        self.graph1Height = self.graph1Height.changeMultiplier(changeMultiplier: 0.6)
        self.graph2Height = self.graph2Height.changeMultiplier(changeMultiplier: 0.5)
        self.graph3Height = self.graph3Height.changeMultiplier(changeMultiplier: 0.4)
        self.graph4Height = self.graph4Height.changeMultiplier(changeMultiplier: 0.3)
        self.graph5Height = self.graph5Height.changeMultiplier(changeMultiplier: 0.2)
        self.graph6Height = self.graph6Height.changeMultiplier(changeMultiplier: 0.1)
        
        UIView.animate(withDuration: 3, animations: {
            self.view.layoutIfNeeded()
        })
    }
    
    
    
    
    
}

extension NSLayoutConstraint {
    func changeMultiplier(changeMultiplier: CGFloat) -> NSLayoutConstraint {
        
        // 원래 자신의 Constraint 값을 deactivate 하고,
        // 새롭게 Newconstraint 값을 적용한것을, activate 함..
        NSLayoutConstraint.deactivate([self])
        let newConstraint = NSLayoutConstraint(item: self.firstItem,
                                              attribute: firstAttribute,
                                              relatedBy: self.relation,
                                              toItem: self.secondItem,
                                              attribute: self.secondAttribute,
                                              multiplier: changeMultiplier,
                                              constant: self.constant)
        
        // View가 가지고 있는 기본 셋팅값을 사용하겠다는 코드
        newConstraint.priority = self.priority
        newConstraint.shouldBeArchived = self.shouldBeArchived
        newConstraint.identifier = self.identifier
        
        NSLayoutConstraint.activate([newConstraint])
        
        return newConstraint
    }
    
    //NSLayout을 사용하는데, 내가 기본셋팅을 바꾸어서, 원하는 값만 사용하려고함
    
}

