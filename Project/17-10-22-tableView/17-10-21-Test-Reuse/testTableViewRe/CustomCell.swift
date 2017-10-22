//
//  CustomCell.swift
//  testTableViewRe
//
//  Created by MIN JUN JU on 2017. 10. 22..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell, SwitchTableViewCellDelegate  {
    
    
    func switchTableViewCell(cell: CustomCell, didChangedSwitch value: Bool) {
        
    }
    
    
    var delegate: SwitchTableViewCellDelegate?
    
    
    @IBAction func swAction(_ sender: UISwitch) {
        switchData = sender.isOn
        
        delegate?.switchTableViewCell(cell: self, didChangedSwitch: sender.isOn)

     //   print(switchData)
    }
    
    @IBOutlet weak var sw: UISwitch!
    
    
    var idx: IndexPath?
    var switchData: Bool = true{
        willSet {
            self.sw.isOn = newValue
            
        }
        
    }
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}

protocol SwitchTableViewCellDelegate {
    func switchTableViewCell(cell: CustomCell, didChangedSwitch value:Bool)
}
