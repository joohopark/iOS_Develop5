//
//  ViewController.swift
//  reDelegate
//
//  Created by MIN JUN JU on 2017. 10. 13..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CustomViewDelegate  {
    func returnTrueisUserInteractionEnabled(customView: CustomView) -> Bool {
        return true
    }
    
    
    @IBOutlet var customViewValue: CustomView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* 변경 가능
        customViewValue.customLB.text = "뷰컨"
        customViewValue.changeimage(imageName: "2") */
        
        // 이것을 만들기전에, 아래의 코드가 안되는 이유는, 우리가 @IB 로 customView에서 인스턴스를 생성 했기 때문에, 다른 클레스에서, 코드로 만들게 되면, 스토리보드로 만든 인스턴스와, 코드로 만든 인스턴스는 다르기 때문에, 인터페이스 빌더로 만든 변수와, 매서드들이 nil 상태가 되서 크러쉬가 나는 것이었다..!
//        customViewValue = CustomView()
        customViewValue.delegate = self
        
        dump(customViewValue.delegate)
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}

