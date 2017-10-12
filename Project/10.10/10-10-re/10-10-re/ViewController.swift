//
//  ViewController.swift
//  10-10-re
//
//  Created by MIN JUN JU on 2017. 10. 11..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 수동 세그웨이를 실행 하는 방법
       // performSegue(withIdentifier: "SecondSegue", sender: nil)
        
  
        
        
        
    }
    
    
    
    // 세그웨이 액션을 실행 하기 위한 녀석..?
    
    // 하나의 뷰 컨트롤러에서 하나의 세그웨이만 만들수 있는것은 아님. 여러가지 세그웨이를 정의 할수 있음.
    
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        print("shouldPerformSegue")
        
        if identifier == "SecondSegue" {
            
            return false
        }else if identifier == "ThirdSegue" {
            return true
            
        }
        return false
    }
    
    
    // 세그웨이가 호출이 되기 직전에 이녀석
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("perpare")
        performSegue(withIdentifier: "SecondSegue", sender: nil)
        
        // 정보가 담겨 있는.
        // segue.destination.xxx = sender -> 수동 메뉴얼로 사용할때 이런식으로 정보 값을 넘겨 줄수 있음.
        
        //segue.source
        
    }
    
    // 이녀석을 만들어주면, 뒤로 돌아가는 새그웨이를 설정해서 만들어 줄수 있다.
    @IBAction func reverse(_ sender: UIStoryboardSegue) {
        print("reverse")
        
    }

}

