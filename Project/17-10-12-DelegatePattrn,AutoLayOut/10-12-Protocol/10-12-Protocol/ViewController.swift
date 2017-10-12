//
//  ViewController.swift
//  10-12-Protocol
//
//  Created by MIN JUN JU on 2017. 10. 12..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CustomViewDelegate {
    
    
    
    //ViewController가 customView를 가지고 있기 때문에 IBOutlet을 한다
    
    @IBOutlet var newView: CustomView!
    
    @IBOutlet var newLb: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        newView.changeText(newText: "뷰컨에서 바뀜")
        // Do any additional setup after loading the view, typically from a nib.
        
        newView.delegate = self
        dump(newView)
        dump(newView.delegate)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 프로토콜을 채택한 클레스를 변수로 받으면 -> 클레스가 채택한 프로토콜을 따라야 하기 떄문에, 그 프로토콜에서 구현됨 함수를 사용해야 함..이때, delegate가 실행되려면 값이 들어가 있어야 실행이됨..
    func didSelectedCustomView(_ customView: CustomView) {
        newLb.text = "커스텀뷰 클릭됫다."
    }


}

