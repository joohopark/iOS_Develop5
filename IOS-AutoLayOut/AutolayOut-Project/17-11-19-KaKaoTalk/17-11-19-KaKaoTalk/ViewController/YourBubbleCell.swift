//
//  YourBubbleCellTableViewCell.swift
//  17-11-19-KaKaoTalk
//
//  Created by MIN JUN JU on 2017. 11. 26..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//

import UIKit

class YourBubbleCell: UITableViewCell {

  @IBOutlet internal weak var yourTextBubble: UILabel!
  @IBOutlet weak var profileImageView: UIImageView!
  override func awakeFromNib() {
        super.awakeFromNib()
    profileImageView.clipsToBounds = true
    profileImageView.layer.cornerRadius = 15
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
