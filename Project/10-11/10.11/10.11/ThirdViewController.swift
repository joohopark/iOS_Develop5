//
//  ThirdViewController.swift
//  10.11
//
//  Created by MIN JUN JU on 2017. 10. 11..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    var homeBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeBtn = UIButton(frame: CGRect(x: 10, y: 10, width: 100, height: 100))
        homeBtn.setTitle("home", for: .normal)
        homeBtn.setTitleColor(.black, for: .normal)
        
        homeBtn.addTarget(self, action: #selector(nextBtnHandler(_:)) , for: .touchUpInside)
        
        self.navigationItem.titleView = homeBtn
        
        
        


        

        
    }
    
    @objc func nextBtnHandler(_ sender: UIButton) {
        
        
        
        goToNextVC()
    }
    
    private func goToNextVC() {
        
        
        
        //Storyboard의 id값을 가지고 ViewController 를 불러냈다.
        let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
        self.navigationController?.popToRootViewController(animated: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}
