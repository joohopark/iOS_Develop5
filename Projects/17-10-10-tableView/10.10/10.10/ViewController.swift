//
//  ViewController.swift
//  10.10
//
//  Created by MIN JUN JU on 2017. 10. 10..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {
    var scrollView: UIScrollView!
    var imageView: UIImageView!
    var containerUIView: UIView!
    
    var btn: UIButton!
    var lb: UILabel!
    var textField: UITextField!
    
    var pinchGesture = UIPinchGestureRecognizer()
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        
        //UIScrollView, Label, UIImageView, UIButton, UITextField
        
        // 스크롤뷰 사이즈 정의
        scrollView = UIScrollView()
        imageView = UIImageView()
//        containerUIView = UIView()
        lb = UILabel()
        textField = UITextField()
        
        // scrollView의 사이즈는, 모바일의 전체 사이즈. containerUIView의 사이즈는 컨텐츠뷰 사이즈로 한다!
        let frameSize = view.bounds.size
        scrollView = UIScrollView(frame: CGRect(origin: CGPoint.zero, size: frameSize))
        
        containerUIView = UIView(frame: CGRect(origin: CGPoint.zero, size: frameSize))
        
       // 컨텐츠 뷰 사이즈는 이미지의 크기로
        let image = UIImage(named: "deagu.jpeg")
        imageView = UIImageView(image: image)
        
        // 스크롤뷰의 컨텐츠 뷰 와 containerUIView 사이즈 정의
        scrollView.contentSize = imageView.bounds.size
        
        // btn 정의 하고, 버튼위치를 containerUIView에 넣자
        btn = UIButton(frame: CGRect(x: 20, y: 20, width: 50, height: 50))
        btn.backgroundColor = UIColor.blue
        
        btn.setTitle("btn", for: .normal)
        
        
        // UILable 정의
        
        lb = UILabel(frame: CGRect(x: 80, y: 80, width: 100, height: 30))
        lb.backgroundColor = UIColor.cyan
        lb.text = "    lb!"
        
        // UITextField 사이즈, 정의
        
        textField = UITextField(frame: CGRect(x: 180, y: 250, width: 100, height: 30))
        textField.backgroundColor = UIColor(red: 50/255, green: 50/255, blue: 50/255, alpha: 0.3)
        
        textField.placeholder = "wait..."
        ////////
        
        containerUIView.isUserInteractionEnabled = true
//        imageView.isUserInteractionEnabled = true
        scrollView.isUserInteractionEnabled = true
        
    
        
    
        
        //
        view.addSubview(scrollView)
        scrollView.addSubview(containerUIView)
        
        containerUIView.addSubview(imageView)
        containerUIView.addSubview(btn)
        containerUIView.addSubview(lb)
        //containerUIView.addSubview(textField)
        containerUIView.addSubview(textField)
        
        
        
        
        
        
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func tapToZoom(_ gestureRecognizer: UIGestureRecognizer) {
        
        
        print("줌..")
        
        // 더블탭 간단 하게 구현
        if scrollView.zoomScale == CGFloat(1) {
            scrollView.setZoomScale(3, animated: true)
        }else {
            scrollView.setZoomScale(1, animated: true)
        }
        
    }
    
    
    
    
    // Pinch Gesture 줌 인, 아웃 가능
    @objc func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        
        //print("viewFor")
        
        
        return containerUIView
    }


}

