//
//  CustomButton.swift
//  Hackaton
//
//  Created by moonhohyeon on 2017. 11. 2..
//  Copyright © 2017년 FC. All rights reserved.
//

import UIKit

class CustomButton: UIButton, Shakeable
{
    override func awakeFromNib()
    {
        self.layer.cornerRadius = 20
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 10
        self.layer.masksToBounds = false
    }
}



protocol Shakeable: class {
    
}

extension Shakeable where Self: UIView {
    func shake() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.05
        animation.repeatCount = 5
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 4.0, y: self.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 4.0, y: self.center.y))
        layer.add(animation, forKey: "position")
    }
}

