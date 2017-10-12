//
//  CustomView.swift
//  10-12-Protocol
//
//  Created by MIN JUN JU on 2017. 10. 12..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//

import UIKit

class CustomView: UIView {

    
    //스토리 보드를 이용해서 시작하기 1-1
    
    @IBOutlet var titleLB: UILabel?
    
    // 2-1 delegate 만들기
    
    var delegate: CustomViewDelegate?
    
    
    
    
    
    // 이부분은 코드로서 만들기 인가.?
    // ViewController의 viewdidload 랑 같다고 생각하면 된다.. 1-2
    override func awakeFromNib() {
        // override 했기때문에, super를 한다.
        super.awakeFromNib()
        
        titleLB?.text = "로드가 완료됨"
    }
    
    // 1-3
    
    func changeText(newText: String) {
        
        titleLB?.text = newText
        
    }
    
    // 1-4
    
    @IBAction func btnAction(_ sender: UIButton) {
        
        // delegate가 nil이면 호출이 되지 않음. 
        delegate?.didSelectedCustomView(self)
        // delegate 값 추적해보자.
        dump(delegate)
        
    }
    
    
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    

}


// 2-1 protocol 만들기
protocol CustomViewDelegate {
    
    // 이런 함수를 만듬.
    func didSelectedCustomView(_ customView: CustomView)
}







