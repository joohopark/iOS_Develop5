//
//  ViewController.swift
//  10-12-Delegate
//
//  Created by MIN JUN JU on 2017. 10. 12..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//

import UIKit

class ViewController: UIViewController  {

    
    

    
    
    
    
    
    @IBOutlet var customViewValue: CustomView!
    
    // 델리게이트 선택하자!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
      /*=================== test 완료
        // 타이틀 변경
        customViewValue?.changeLB(changLBText: "뷰컨에서 변경")
        
        
        
        // 이미지 변경
        customViewValue?.changeIM(RangeOfString10: "2")
        
        // 스위치 변경 on 설정
        //customViewValue?.changeOn()
 
         ====================*/
        
        
        // 델리게이트 선택하자!
        
        //customViewValue.delegate = self
        //customViewValue?.changeOn()
        
        customViewValue.changeLB(changLBText: "뷰컨 변경")
        
        customViewValue?.changeIM(RangeOfString10: "2")
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

