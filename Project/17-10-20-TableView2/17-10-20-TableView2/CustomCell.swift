
import UIKit

class CustomCell: UITableViewCell, SwitchTableViewCellDelegate {
    
    
    
    @IBOutlet weak var sw: UISwitch!
    // 클로져를 사용하는 방법 -> 클로져 정의는 customCell 에서 해주고, cell이 반활될때, 이 클로져의 값을 어떻게 해주면, 된다..!
    var didChangedSwitchValue: (() -> Void)?
    
    // viewController 에서 indexPath를 가져오려고함..
    var indexPath: IndexPath!
    var delegate: SwitchTableViewCellDelegate?
    
    
//     재사용값으 반환하기 위해서 값을 설정함
    var switchData: Bool = true{
        willSet {
            self.sw.isOn = newValue
            
        }

    }
    
    
    
    func switchTableViewCell(cell: CustomCell, didChangedSwitch value: Bool) {
        
    }
    
    @IBAction func changedValue(_ sender: UISwitch) {
        
        // delegate 를 사용하는 방법
        print(sender.isOn, indexPath)
        delegate?.switchTableViewCell(cell: self, didChangedSwitch: sender.isOn)
        
        // closure 로 하는 방법
        //didChangedSwitchValue!()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: true)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    

}

protocol SwitchTableViewCellDelegate {
    func switchTableViewCell(cell: CustomCell, didChangedSwitch value:Bool)
}
