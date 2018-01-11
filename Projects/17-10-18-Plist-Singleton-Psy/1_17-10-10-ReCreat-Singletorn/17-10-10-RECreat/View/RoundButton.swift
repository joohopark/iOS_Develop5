//
//  RoundButton.swift
//  17-10-18-PsyTest
//
//  Created by MIN JUN JU on 2017. 10. 18..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//

import UIKit

class RoundButton: UIButton {
    
    
    // 스토리 보드에서는 부모클래스의 이니셜 라이즈를 불러주어야함
    required init?(coder aDecoder: NSCoder) {
        // 부모뷰의 녀석까지 받아와야 스토리보드에서 사용하는것을 사용할수 있음.
        super.init(coder: aDecoder)
        
        // 곡선값을 줌
        self.layer.cornerRadius = 20
        // tintColor 는 UIColer 인데, CGclor로 바꾸어준다.
        self.layer.borderColor = self.tintColor.cgColor
        self.layer.borderWidth = 1
    }
    
}

