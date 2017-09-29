//
//  ViewController.swift
//  9.28scrollview
//
//  Created by MIN JUN JU on 2017. 9. 28..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//

import UIKit

// Delegate 를 가져올수 있음.
class ViewController: UIViewController, UIScrollViewDelegate {
    
    var scrollView: UIScrollView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // delegate 를 셀프로 지정함.
        
        
        
        // 스크롤뷰 크기 생성 
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height))
        
        // 컨텐츠뷰 사이즈 정의
        
        scrollView.contentSize = CGSize(width: 1000, height: scrollView.frame.size.height)
        
        // 끝까지 가지않는 기능
        
        scrollView.bounces = false
        
        
        //// 페이징 단위 기능
        
        scrollView.isPagingEnabled = true
        
        
        
        
        /// view 생성
        let otherView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 1000))
        otherView.backgroundColor = UIColor.black
        
        let otherView1: UIView = UIView(frame: CGRect(x: 310, y: 0, width: 300, height: 1000))
        otherView1.backgroundColor = UIColor.red
        
        let otherView2: UIView = UIView(frame: CGRect(x: 620, y: 0, width: 300, height: 1000))
        otherView2.backgroundColor = UIColor.blue
        
        //scrollView.addSubview(otherView)
        //scrollView.addSubview(otherView1)
        //scrollView.addSubview(otherView2)
        
        
        
        // 위에서는 nil 이기때문에 키자마자 크러시가 남.. 아.. 이유는 맨처음 디폴트 값이 옵셔널이기때문이고, scrollview 안에 아무것도 없기 때문에 크러시가 난것임.. 아항..
        
        
        // scrollView offset 지정함.
        scrollView.delegate = self
        
        
        // delegate를 다른 기능으로 사용해봄. 스위치를 이렇게 해서 만들어 줄수 있음.. 이것에 대한 기능을 넣고 싶으면 addTaget를 사용해서 어떻게 동작하는지에 대한 동작 유무를 구분해줄수 있음.
        
        
        // switcher 도 이런식으로 사용할수 있음. 스위치에 대한 모양과 크기를 정하고, 그것을 실행할때마다, 어떤 함수가 실행되게 만들수 있음..
        let switcher:UISwitch = UISwitch(frame: CGRect(x: 30, y: 30, width: 0, height: 0))
        
        switcher.addTarget(self, action: #selector(self.switchAction(_:)), for: .touchUpInside)
       
        switcher.thumbTintColor = UIColor.red
        
        scrollView.addSubview(switcher)
        
        
        let silder:UISlider = UISlider(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        
        scrollView.addSubview(silder)
        
        
        
        
        
        
        view.addSubview(scrollView)
        
    
    }
    
    // delegate 기능.. 스크롤을 움직일때마다 이녀석이 불림.
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        //scrollView.contentOfset 까지 CGPoint
        //let offsetX: CGFloat = scrollView.contentOffset.x
        
        
        print("오프셋")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func switchAction(_ sender:UISwitch) {
        print("버튼 누름")
        
    }

}

