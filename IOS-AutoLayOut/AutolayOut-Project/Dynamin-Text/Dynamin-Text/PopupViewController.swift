//
//  PopupViewController.swift
//  Dynamin-Text
//
// Created by MIN JUN JU on 2017. 11. 13..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//

import UIKit

class PopupViewController: UIViewController {

    
    
    @IBOutlet weak var popupViewCenterY: NSLayoutConstraint!
    @IBOutlet weak var imageHeight: NSLayoutConstraint!
    @IBOutlet weak var popupImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ViewDidLoad")
        popupViewCenterY.constant = 1000
        
        
        
        
    }

    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear")
        UIView.animate(withDuration: 1, animations: {
            self.popupViewCenterY.constant = 0
            self.view.layoutIfNeeded()
        }, completion: nil)
        
    }
    
    override func viewDidLayoutSubviews() {
        let ratio = (self.popupImageView.image?.size.height)! / self.popupImageView.frame.size.height
        let calcHeight = (popupImageView.image?.size.height)! / ratio
        
        imageHeight.constant = calcHeight
        print("viewdidLayoutSubview")
    }
    
    @IBAction func backBtn(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    

}
