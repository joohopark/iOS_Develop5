//
//  ViewController.swift
//  9.25UIUI
//
//  Created by MIN JUN JU on 2017. 9. 25..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    


    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
         let origin:CGPoint = CGPoint(x: 100, y: 100)
         let size:CGSize = CGSize(width: 200, height: 200)
         
         let rect:CGRect = CGRect(origin: origin, size: size)
         
         
         let subView:UIView = UIView(frame: rect)
         subView.backgroundColor = UIColor.red
         
         view.addSubview(subView)
         */
        // 으흠.. 타입을 찾아서, 값을 어떻게 넣어줄건지 고민 해보고, 찾아본다음에 명령어로 실행 해봄.
        // 이런식으로 code로서 좌표를 주면서 만들수 있다.
        
        /*let rect:CGRect = CGRect(x: 100, y: 100, width: 200, height: 200)
         let subView:UIView = UIView(frame: rect)
         
         subView.backgroundColor = UIColor.red*/
        
        
        /* label 만들기
         let subView: UILabel = UILabel(frame: CGRect(x: 100, y: 100, width: 200, height: 200))
         subView.text = "HHHHHI"
         
         subView.backgroundColor = UIColor.blue
         view.addSubview(subView) */
        
        // 레이블 위치와 초기값주기 .
        /*
         let halfView:UIView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height/2))
         
         halfView.backgroundColor = UIColor.red
         self.view.addSubview(halfView) */
        /*
         let quiz: UIView = UIView(frame: CGRect(x: 15, y: 15, width: 345, height: 100))
         
         quiz.backgroundColor = UIColor.blue
         
         view.addSubview(quiz)
         
         
         let quiz1: UIView = UIView(frame: CGRect(x: 15, y: 552, width: 345, height: 100))
         
         quiz1.backgroundColor = UIColor.blue
         
         
         quiz1.alpha = 0.5
         
         view.addSubview(quiz1)
         */
        
        /*let halfView:UIView = UIView(frame: CGRect(x: 15, y: 15, width: self.view.bounds.size.width*0.92 ,height: 100))
        
        halfView.backgroundColor = UIColor.red
        self.view.addSubview(halfView)
        
        let halfView1:UIView = UIView(frame: CGRect(x: 15, y: self.view.bounds.size.height-115, width: self.view.bounds.size.width*0.92 ,height: 100))
        
        halfView1.backgroundColor = UIColor.red
        self.view.addSubview(halfView1) */
        
        /*let makeLabel: UILabel = UILabel(frame: CGRect(x: 100, y: 100, width: 200, height: 200))
        
        // backgroundColor 설정해줌.
        makeLabel.backgroundColor = UIColor.darkGray
        makeLabel.text = "Label TEXT"
        makeLabel.font = UIFont.systemFont(ofSize: 50)
        
        
        view.addSubview(makeLabel) */
        
        // UI image 연습하기
        
        let viewTest: UIImageView = UIImageView()
        viewTest.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        
        viewTest.image = UIImage(named: "dot.jpg")
        self.view.addSubview(viewTest)
        
        
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

