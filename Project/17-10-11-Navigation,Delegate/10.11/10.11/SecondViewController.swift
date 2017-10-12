//
//  SecondViewController.swift
//  10.11
//
//  Created by MIN JUN JU on 2017. 10. 11..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var nextBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "두번째 타이틀!"
        view.backgroundColor = UIColor(red: 1 , green: 2, blue: 3, alpha: 0.5)
        
        //third로 이동 
        nextBtn = UIButton(frame: CGRect(x: 10, y: 10, width: 100, height: 100))
        nextBtn.setTitle("Next1", for: .normal)
        nextBtn.setTitleColor(.black, for: .normal)
        
        nextBtn.addTarget(self, action: #selector(nextBtnHandler(_:)) , for: .touchUpInside)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: nextBtn)
        

    }
    @objc func nextBtnHandler(_ sender: UIButton) {
        
        
        
        goToNextVC()
    }
    
    private func goToNextVC() {
        
        
        
        //Storyboard의 id값을 가지고 ViewController 를 불러냈다.
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "ThirdViewController") as! ThirdViewController
        
        
        self.navigationController?.pushViewController(nextVC, animated: true)
    }

    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
