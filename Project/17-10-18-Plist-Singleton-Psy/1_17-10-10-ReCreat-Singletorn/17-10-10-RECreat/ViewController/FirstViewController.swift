//
//  ViewController.swift
//  17-10-18-PsyTest
//
//  Created by MIN JUN JU on 2017. 10. 18..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    var image: UIImage?
    var imageView: UIImageView?
    
    
    
    // MARK: View Life Cycle -> 이거사용가능
    override func viewDidLoad() {
        super.viewDidLoad()
        
        image = UIImage(named: "ComputerScience1-bg")
        
        //imageView = UIImageView(
        
    }
    
    // 반드시 파라미터로 UIStoryBoardSegue 를 받아야함
    // 세그웨이의 설정은 돌아가려고 하는 뷰에서 구현해주어야함, 버튼의 위치는 현재 LoginViewController 부분 
    @IBAction func unwindToFirstViewController(segue: UIStoryboardSegue) {
        
        print("버튼 클릭")
        
        
    }
    
    
    
    
}

