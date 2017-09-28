//
//  ViewController.swift
//  9.28UIView
//
//  Created by MIN JUN JU on 2017. 9. 28..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var scrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 스크롤뷰 라는 view 자체를 하나 생성한다..?
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height))
        
        // contentSize 를 준것, 가로 스크롤 뷰 사이즈만 줌
        scrollView.contentSize = CGSize(width: 1000, height: 1000)//scrollView.frame.size.height)
        
        
        // 스크롤을 했을때 끝까지 가지 않음. 값을 false 로 주었을떄.
        scrollView.bounces = false
        
        // 스크롤을하고, 손을 때면 페이지가 던져지지 않음. 움직일때 페이징 범위로 움직이게됨. 이동 거리가 50% 가 넘어가면 돌아오고, 50% 가 넘지 않으면 돌아옴
        scrollView.isPagingEnabled = true
        
        // offset 전체 스크롤뷰에서, 처음에 어디서 시작을 할지를 정해줌. 컨텐츠 사이즈의, 이상태에서
        scrollView.setContentOffset(CGPoint(x: 400, y:0), animated: true)
        
        
        //view.addSubview(scrollView)
        
        
        
        for n in 0..<10 {
            
            let view: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 330, height: 1000))
            scrollView.addSubview((view))
            
            /*//윗줄
            let view:UIView = UIView(frame: CGRect(x: n*100, y: 0, width: 100, height: 100))
            
            //let row: CGFloat
            let colum: CGFloat
            
            view.backgroundColor = UIColor(red: CGFloat(Double(n)*10.0/255.0), green: CGFloat(Double(n)*10.0/255.0), blue: CGFloat(Double(n)*10.0/255.0) , alpha: 1)
            
            scrollView.addSubview(view)*/
            
            /*// 아랫줄
            let view1:UIView = UIView(frame: CGRect(x: n*100, y: 110, width: 100, height: 100))
            view1.backgroundColor = UIColor(red: CGFloat(Double(n)*10.0/255.0), green: CGFloat(Double(n)*10.0/255.0), blue: CGFloat(Double(n)*10.0/255.0) , alpha: 1)
            
            scrollView.addSubview(view1) */
            
            
            
            
            
            
            
            
            
        }
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
       //scrollView.setContentOffset(CGPoint(x: 400, y:0), animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //scrollView.setContentOffset(CGPoint(x: 400, y:0), animated: true)
    }


}

