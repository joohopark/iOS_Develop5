//
//  CustomView.swift
//  reDelegate
//
//  Created by MIN JUN JU on 2017. 10. 13..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//

import UIKit

class CustomView: UIView {
    
    @IBOutlet var customLB: UILabel!
    @IBOutlet var customImageView: UIImageView!
    @IBOutlet var customSwitcher: UISwitch!
    
    var delegate: CustomViewDelegate?
    
    
    
    //UIViewcontroller 의 ViewDidLoad 같은 녀석이다
    override func awakeFromNib() {
        print("customView 실행")
        
        customSwitcher.isOn = false
        customSwitcher.isUserInteractionEnabled = false
        
        customLB.text = "delegate"
        
        changeimage(imageName: "1")
        
        
        
        
        
        
        
        
    }
    
    @IBAction func btn(_ sender: UIButton) {
        
        customSwitcher.isUserInteractionEnabled = (delegate?.returnTrueisUserInteractionEnabled(customView: self))!
        print("버튼이 눌림")
    }
    
    @objc func changeimage(imageName name: String) {
        let image: UIImage = UIImage(named: name)!
        
        customImageView.image = image
        
    }
    

}

// 프로토콜을 생성 한다!
protocol CustomViewDelegate {
    func returnTrueisUserInteractionEnabled(customView: CustomView) -> Bool
}
