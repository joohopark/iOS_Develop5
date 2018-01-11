//
//  MyBubbleCell.swift
//  17-11-19-KaKaoTalk
//
//  Created by MIN JUN JU on 2017. 11. 19..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//

import UIKit

class MyBubbleCell: UITableViewCell {

  @IBOutlet internal weak var myTextBubble: UILabel!
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
