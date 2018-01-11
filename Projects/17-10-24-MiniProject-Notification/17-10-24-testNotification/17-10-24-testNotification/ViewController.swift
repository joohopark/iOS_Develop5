//
//  ViewController.swift
//  17-10-24-testNotification
//
//  Created by MIN JUN JU on 2017. 10. 24..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLB: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 옵져빙 등록 
        NotificationCenter.default.addObserver(forName: Notification.Name.init("TestNoti"), object: nil, queue: nil) { (noti) in
            
            // noti.object가 날라왔을때, 그 조건에 따라서 실행이됨.
            if let text = noti.object as? String {
                self.mainLB.text = text
            }
            // notification에 대한 실행
            
            print(noti.object)
            print(noti.userInfo)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

