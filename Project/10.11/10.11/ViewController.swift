//
//  ViewController.swift
//  10.11
//
//  Created by MIN JUN JU on 2017. 10. 11..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var nextBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextBtn = UIButton(frame: CGRect(x: 10, y: 10, width: 100, height: 100))
        nextBtn.setTitle("Next", for: .normal)
        nextBtn.setTitleColor(.black, for: .normal)
        
        nextBtn.addTarget(self, action: #selector(nextBtnHandler(_:)) , for: .touchUpInside)
        
        // 라지 타이틀 설정
        self.navigationController?.navigationBar.prefersLargeTitles = true
        

        
        
        
        
        // 만든 Btn을 네비게이션의 오른쪽 바 버튼에 집에넣음... 아하 이런식으로 할수 있구나..!
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: nextBtn)
        
    
        
        
        //self.navigationItem.rightBarButtonItem?.action = #selector(nextBtnHandler(_:))
        
        // 타이틀의 기본 네임을 바꿀수 있음
        self.navigationItem.title = "첫번째 타이틀!"
        
        // 타이틀의을 바꾸는데 뷰의 형식으로 바꾸어 줄수 있음
        //self.navigationItem.titleView =
        
        view.backgroundColor = UIColor(red: 10 , green: 5, blue: 4, alpha: 0.2)
        
        
        
        
        
        
        
        
        
        
       
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
        
        self.navigationController?.pushViewController(nextVC, animated: true)
    }

    
    /*================= 이런식으로 pop과 push 를 할수 있게 함.
    func pushAction() {
        
        let nextVC = UIViewController()
        
        // 네비게이션 컨트롤러 프로퍼티에 각 뷰 컨트롤러가 요청을 해야 push가 이루어짐.이유는, 어차피 스텍 구조이니가, navi에 쌓여 있는 구조 그대로 가져 갈수 있음.
        self.navigationController?.pushViewController(nextVC, animated: true)
        print("pushAction")
    }
    
    func popAction() {
        self.navigationController?.popViewController(animated: true)
        print("popAction")
    }
    =================*/
    
    
}

