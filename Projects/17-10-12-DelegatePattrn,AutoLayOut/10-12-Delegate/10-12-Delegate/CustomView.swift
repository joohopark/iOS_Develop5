//
//  CustomView.swift
//  10-12-Delegate
//
//  Created by MIN JUN JU on 2017. 10. 12..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//

import UIKit

class CustomView: UIView {
    
    // 레이블, 스위쳐, 이미지 뷰 설정
    @IBOutlet var customLB: UILabel!
    @IBOutlet var customSW: UISwitch!
    @IBOutlet var customIM: UIImageView!
    
    // 델리게이트 만들자
    var delegate: CustomViewDelegate?
    
    

    
    override func awakeFromNib() {
        // override 했기때문에, super를 한다.
        super.awakeFromNib()
        
        
        //changeIM(RangeOfString10: "2")
    }
    
    // LB 변경
    func changeLB(changLBText: String) {
        
        if customLB.text == "막아줘" {
            changeOn()
        }else {
            customLB.text = changLBText
        }
        
    }
    
    // image 변경
    func changeIM(RangeOfString10 changeImage: String) {
        let image = UIImage(named: changeImage)
        customIM.image = image
            
        }
        
        
        // 아래처럼 하면 작동이 되지 않음. 이유는 위에서 스토리 보드로 이미지를 만들었는데, 아래에 이미지로 만들것에 또다시 이미지를 만들어서 그렇다..!
        //customIM = UIImageView(image: image)
        
        
        
      
        
    
    
    // 스위쳐 on, off 추적
    
    func changeOn() {
        customSW.isUserInteractionEnabled = (delegate?.userInteractionFalse(customView: self))!
        
        //customSW.isUserInteractionEnabled = delegate?.switcherOnisUserInteractionEnabled(customView: self)
        //customSW.isOn = true
        
        
        //customSW.isUserInteractionEnabled = true
        
        
    }
    
}

protocol CustomViewDelegate {
    func userInteractionFalse(customView: CustomView) -> Bool
}
