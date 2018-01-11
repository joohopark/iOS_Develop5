//
//  ViewController.swift
//  testUIViewController
//
//  Created by MIN JUN JU on 2017. 10. 12..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var nextBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //현재 navagitionContoller 의 title 설정함.
        self.navigationItem.title = "first"
        
        // navigationController의 LargeTitle 설정 하는 방법
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        //self.navigationItem.rightBarButtonItem
        
        // 버튼 생성
        
        nextBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        nextBtn.setTitle("next >", for: .normal)
        nextBtn.setTitleColor(.black, for: .normal)
        
        nextBtn.setTitle("next>", for: .highlighted)
        nextBtn.setTitleColor(.blue, for: .highlighted)
        
        // 버튼의 기능을, SecondViewController 로 이동하게 연결 시켰다.
        nextBtn.addTarget(self, action: #selector(nextBtnHandler(_:)), for: .touchUpInside)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: nextBtn)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @objc func nextBtnHandler(_ sender: UIButton) {
        print("nextBtnHandler")
        
        
        goToNextVC()
    }
    
    private func goToNextVC() {
        
        print("gotoNextVC")
        
        //Storyboard의 id값을 가지고 ViewController 를 불러냈다.
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        
        // navigation 은 stack 방식으로 동작이됨. push, pop 을 이용해서 ViewController를 Push, pop 을 하면서, 원하는 값을 호출 해온다
        self.navigationController?.pushViewController(nextVC, animated: true)
    }



}

