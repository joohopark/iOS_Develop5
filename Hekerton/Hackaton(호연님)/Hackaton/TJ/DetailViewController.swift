
import UIKit

class DetailViewController: UIViewController {

    var dCount: CGFloat = 0
    var iCount: CGFloat = 0
    var sCount: CGFloat = 0
    var cCount: CGFloat = 0
    
    @IBOutlet weak var dNumber: UILabel!
    @IBOutlet weak var iNumber: UILabel!
    @IBOutlet weak var sNumber: UILabel!
    @IBOutlet weak var cNumber: UILabel!
    
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var mainButton: UIButton!
    
    @IBOutlet weak var dHeight: NSLayoutConstraint!
    @IBOutlet weak var iHeight: NSLayoutConstraint!
    @IBOutlet weak var sHeight: NSLayoutConstraint!
    @IBOutlet weak var cHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    //MARK: - Create UI
    func createUI() {
        prevButton.layer.cornerRadius = 10
        prevButton.clipsToBounds = true
        
        mainButton.layer.cornerRadius = 10
        mainButton.clipsToBounds = true
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 2.0) {
            self.dHeight = self.dHeight.changeMultiplier(changeMultiplier: (self.dCount/16))
            self.iHeight = self.iHeight.changeMultiplier(changeMultiplier: (self.iCount/16))
            self.sHeight = self.sHeight.changeMultiplier(changeMultiplier: (self.sCount/16))
            self.cHeight = self.cHeight.changeMultiplier(changeMultiplier: (self.cCount/16))
            self.dNumber.text = String(describing: Int(self.dCount)) + "개"
            self.iNumber.text = String(describing: Int(self.iCount)) + "개"
            self.sNumber.text = String(describing: Int(self.sCount)) + "개"
            self.cNumber.text = String(describing: Int(self.cCount)) + "개"
            
            self.view.layoutIfNeeded()
        }
    }    
}


extension NSLayoutConstraint {
    func changeMultiplier(changeMultiplier: CGFloat) -> NSLayoutConstraint {
        NSLayoutConstraint.deactivate([self])
        let newConstaint = NSLayoutConstraint(item: self.firstItem,
                                              attribute: self.firstAttribute,
                                              relatedBy: self.relation,
                                              toItem: self.secondItem,
                                              attribute: self.secondAttribute,
                                              multiplier: changeMultiplier,
                                              constant: self.constant)
        newConstaint.priority = self.priority
        newConstaint.shouldBeArchived = self.shouldBeArchived
        newConstaint.identifier = self.identifier
        
        NSLayoutConstraint.activate([newConstaint])
        
        return newConstaint
    }
}
