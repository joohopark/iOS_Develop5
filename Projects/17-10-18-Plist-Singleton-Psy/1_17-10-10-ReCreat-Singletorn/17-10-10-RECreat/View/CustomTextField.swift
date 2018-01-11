//
//  CustomTextField.swift
//  17-10-10-RECreat
//
//  Created by MIN JUN JU on 2017. 10. 18..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {
    
    
    func configureAttributedString(
        string: String,
        range: NSRange,
        stringColor: UIColor
        ) {
        
        // attribute 스트링을 만드는 부분.
        let attributedString = NSMutableAttributedString(string: string)
        
        // atrribute 스트링의 컬러값과 범위를 지정해줄수 있게 만들어주었다.
        attributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: stringColor, range: range
        )
        
        // attribute 만들어서 placeholder 에 넣어줌.
        self.attributedPlaceholder = attributedString
    }

    // leftViewRect의 속성을 바로 바로 override 하지말라고 설명이 나온다. 그래서 class 에서 override를 해서 사용하라고 설명이 온다. leftView의 Rect를 정의해서 던져 줄수 있다.
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        
        // 이건 뭐하고 있는거지?
        let leftViewWitdth = self.bounds.size.height / 2
        let resultRect = CGRect(x: 10, y: (self.bounds.size.height/2) - (leftViewWitdth/2), width: leftViewWitdth, height: leftViewWitdth)
        
        // 왼쪽에서 조금 떨어져서 y값의 가운데로 주는것, 이따가 다시 정리 해보자
        return resultRect
    }
    
    
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        //CGRect를 반환하는데 UIEdgeInset을 사용해서 반환함.
        // 어떤 패딩값을 넣어준만큼, 왼쪽에서 밀려난다, placeholder의 위치를 반환함
        
        return UIEdgeInsetsInsetRect(self.bounds, UIEdgeInsetsMake(0, (self.bounds.size.height/2)+40, 0, 0))
    }
    
    /*
    // 이건 잠깐 홀드 해놓자, 플레이스 홀더 말고 실제 사용자가 입력하는 텍스트 필드의 처음 해당 위치도 정해줄수 있는것임..!
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        
        let returnX = UIEdgeInsetsInsetRect(self.bounds,
                                            UIEdgeInsetsMake(0, (self.bounds.size.height/2)+40,
                                                             0,
                                                             0))

        
        return returnX
        
    }*/

}
