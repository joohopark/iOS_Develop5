//
//  SecondViewController.swift
//  testUIViewController
//
//  Created by MIN JUN JU on 2017. 10. 12..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    var nextBtn: UIButton!
    var backBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Second"
        
        
        
        // 버튼 생성
        
        nextBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        nextBtn.setTitle("next >", for: .normal)
        nextBtn.setTitleColor(.black, for: .normal)
        
        nextBtn.setTitle("next>", for: .highlighted)
        nextBtn.setTitleColor(.blue, for: .highlighted)
        
        // 버튼의 기능을, SecondViewController 로 이동하게 연결 시켰다.
        nextBtn.addTarget(self, action: #selector(nextBtnHandler(_:)), for: .touchUpInside)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: nextBtn)
        
        // backBtn 생성
        
        backBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        backBtn.setTitle("< back ", for: .normal)
        backBtn.setTitleColor(.black, for: .normal)
        
        backBtn.setTitle("< back", for: .highlighted)
        backBtn.setTitleColor(.blue, for: .highlighted)
        
        // 버튼의 기능을, SecondViewController 로 이동하게 연결 시켰다.
        backBtn.addTarget(self, action: #selector(backBtnHandler(_:)), for: .touchUpInside)
        
        
        // 왼쪽 버튼 올리기.
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backBtn)
        
        

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @objc func nextBtnHandler(_ sender: UIButton) {
        
        
        
        goToNextVC()
    }
    
    private func goToNextVC() {
        
        
        
        //Storyboard의 id값을 가지고 ViewController 를 불러냈다.
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "ThirdViewController") as! ThirdViewController
        
        // navigation 은 stack 방식으로 동작이됨. push, pop 을 이용해서 ViewController를 Push, pop 을 하면서, 원하는 값을 호출 해온다
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    
    
    @objc func backBtnHandler(_ sender: UIButton) {
        
        
        
        goToBackVC()
    }
    
    private func goToBackVC() {
        
        //let backVC = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
        // navigation 은 stack 방식으로 동작이됨. push, pop 을 이용해서 ViewController를 Push, pop 을 하면서, 원하는 값을 호출 해온다
        self.navigationController?.popViewController(animated: true)
        
        
    }
    
        

    

}
