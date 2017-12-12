//
//  ViewController.swift
//  TestDatePickerrr
//
//  Created by MIN JUN JU on 2017. 12. 11..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var dateView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let date: Date = Date(
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func datePickerButtonAction(_ sender: UIButton) {
        print("액션")
        let datePickerView: UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.date
        datePickerView.addTarget(self,
                                 action: #selector(self.datePickerValueChanged),
                                 for: UIControlEvents.allEditingEvents)
        datePickerView.locale = Locale(identifier: "ko_korea")
        
        let alertControler = UIAlertController(title: "컨트롤러",
                                               message: "",
                                               preferredStyle: UIAlertControllerStyle.actionSheet)
        
        let alertAction = UIAlertAction(title: "해당 날짜로 선택", style: UIAlertActionStyle.default){ (action) in
            // Text field 에 선택한 날짜를 변경 하는 로직 추가 하면됨.
        }
        let alertAction1 = UIAlertAction(title: "취소", style: UIAlertActionStyle.cancel, handler: nil)
        
        var height:NSLayoutConstraint = NSLayoutConstraint(item: alertControler.view,
                                                           attribute: NSLayoutAttribute.height,
                                                           relatedBy: NSLayoutRelation.equal,
                                                           toItem: nil,
                                                           attribute: NSLayoutAttribute.notAnAttribute,
                                                           multiplier: 1, constant: self.view.frame.height * 0.80)
        alertControler.view.addConstraint(height)
        //alertControler.view.addSubview(datePickerView)
        alertControler.addAction(alertAction)
        alertControler.addAction(alertAction1)
        self.present(alertControler, animated: true, completion: nil)
    }
    @objc func datePickerValueChanged(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        print("""
            sender.date is \(sender.date)
            dateFormatter.string is \(dateFormatter.string(from: sender.date))
            """)
    }
    
    
}

