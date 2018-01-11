//
//  MyCustomCell.swift
//  reCreatTableView
//
//  Created by MIN JUN JU on 2017. 9. 30..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//

import UIKit

// cell 을 커스텀하기 위해서 MycustomCell 을 cocoa touch class 로 생성함.
class MyCustomCell: UITableViewCell {
    
    //UI 를 스토리 보드로 만들었을때 이녀석에서부터 시작 함.. -> 일반 viewcontrollor 에서  viewDidLoad 영역..?
    /*override func awakeFromNib() {
     super.awakeFromNib()
     // Initialization code
     } */
    
    // 시작지점은 init
    // required init의 정의는 UITableViewCell 에 필수적으로 만들라고 정의 되어 있음.
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        creatView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    var bgImgView: UIImageView?
    
    // 이미지를 만듬.
    func creatView() {
        bgImgView = UIImageView()
        
        // 옵셔널을 넣어주고 느낌표를 찍는이유는, 이미지가 확실히 들어있다고 내가 알고 잇기 때문에 느낌표를 날려줌!
        self.addSubview(bgImgView!)
        
    }
    
    //우리가 넣으려는 이미지 이름.
    func setImage(name: String) {
        bgImgView?.image = UIImage(named: name)
    }
    
    func updataLayout() {
        bgImgView?.frame = self.bounds
    }
    
    // 새로운 메소드 생성
    override func layoutSubviews() {
        updataLayout()
    }

}
