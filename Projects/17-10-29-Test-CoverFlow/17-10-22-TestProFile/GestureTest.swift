//
//  GestureTest.swift
//  17-10-22-TestProFile
//
//  Created by MIN JUN JU on 2017. 10. 30..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//

import UIKit

class GestureTest: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var countLB: UILabel!
    @IBOutlet weak var locationLB: UILabel!
    
    @IBOutlet var tap: UITapGestureRecognizer!
    override func viewDidLoad() {
        super.viewDidLoad()

        tap.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        countLB.text = "횟수 : \(touch.tapCount)"
        
        locationLB.text = "\(touch.location(in: touch.view))"
        
        return true
    }
    
    

    
}
