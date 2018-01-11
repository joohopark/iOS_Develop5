//
//  ThirdViewController.swift
//  testUIViewController
//
//  Created by MIN JUN JU on 2017. 10. 12..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    var backBtn: UIButton!
    
    var homeBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Third"
        
        backBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        backBtn.setTitle("< back ", for: .normal)
        backBtn.setTitleColor(.black, for: .normal)
        
        backBtn.setTitle("< back", for: .highlighted)
        backBtn.setTitleColor(.blue, for: .highlighted)
        
        // 버튼의 기능을, SecondViewController 로 이동하게 연결 시켰다.
        backBtn.addTarget(self, action: #selector(backBtnHandler(_:)), for: .touchUpInside)
        
        
        homeBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        homeBtn.setTitle("Home", for: .normal)
        homeBtn.setTitleColor(.black, for: .normal)
        
        homeBtn.setTitle("Home", for: .highlighted)
        homeBtn.setTitleColor(.blue, for: .highlighted)
        
        // 버튼의 기능을, SecondViewController 로 이동하게 연결 시켰다.
        homeBtn.addTarget(self, action: #selector(homeBtnHandler(_:)), for: .touchUpInside)
        
        
        
        
        // 왼쪽 버튼 올리기.
        self.navigationItem.leftBarButtonItems = [UIBarButtonItem(customView: backBtn),UIBarButtonItem(customView: homeBtn)]
        
        
        
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @objc func backBtnHandler(_ sender: UIButton) {
        
        
        
        goToBackVC()
    }
    
    private func goToBackVC() {
        
        //let backVC = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
        // navigation 은 stack 방식으로 동작이됨. push, pop 을 이용해서 ViewController를 Push, pop 을 하면서, 원하는 값을 호출 해온다
        self.navigationController?.popViewController(animated: true)
        
        
    }
    
    
    
    @objc func homeBtnHandler(_ sender: UIButton) {
        
        
        
        goToHomeVC()
    }
    
    private func goToHomeVC() {
        
        let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
        // navigation 은 stack 방식으로 동작이됨. push, pop 을 이용해서 ViewController를 Push, pop 을 하면서, 원하는 값을 호출 해온다
        
        
        self.navigationController?.popToRootViewController(animated: true)
        
        
    }
    
    

}
