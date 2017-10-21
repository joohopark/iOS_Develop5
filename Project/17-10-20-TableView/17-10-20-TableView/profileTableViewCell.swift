//
//  profileTableViewCell.swift
//  17-10-20-TableView
//
//  Created by MIN JUN JU on 2017. 10. 20..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//

import UIKit

class profileTableViewCell: UITableViewCell {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameTextLabel: UILabel!
    // 일반적으로 화면간 전화을 할때, 현재 누른 셀의 정보를 가지고 다음 뷰컨트롤러에 넘겨주어야 하는데, 그 방법이 조금 까다로워서 커스텀ㄴ 셀을 만든다..?
    var data: ProfileModel?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    

}
