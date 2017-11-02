//
//  customTableViewCell.swift
//  miniHackerTone
//
//  Created by okkoung on 2017. 11. 2..
//  Copyright © 2017년 okkoung. All rights reserved.
//

import UIKit

class customTableViewCell: UITableViewCell {

  @IBOutlet weak var customCellView: UIView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
//    customCellView.layer.borderWidth = UIScreen.main.scale / 1
//    customCellView.layer.borderColor = #colorLiteral(red: 0.9019607843, green: 0.9019607843, blue: 0.9019607843, alpha: 1)
    customCellView.backgroundColor = #colorLiteral(red: 0.9019607843, green: 0.9019607843, blue: 0.9019607843, alpha: 1)
    customCellView.layer.cornerRadius = 20
    
  }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
