//
//  ViewController.swift
//  9.29UI
//
//  Created by MIN JUN JU on 2017. 9. 29..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate, UITableViewDataSource {
    
    
    
    
    var subView: UIView!
    var lb: UILabel!
    var btn: UIButton!
    
    var scrollView: UIScrollView!
    

    override func viewDidLoad() {
        
        // 뷰 생성, 강사님 방식 view를 생성하는 함수를 작성하고, 그것을 작성한 이후에 함수로서 실행을 해줌.
        creatView()
        updataLayout()
        
        
        
        
        
        }



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
        
        
        
    }
    
    // 뷰 생성 함수
    func creatView() {
        //UIView 만들기 -> struct와 class의 차이는 어떨때, 어떻게 사용이 되어 지냐의 차이로 나누어 진다.
        
        
        
        subView = UIView()
        
        // 속성 ->
        
        subView.backgroundColor = UIColor(red: 25/255, green: 25/255, blue: 25/255, alpha: 0.7)
        
        // 어차피 subView 자체도 인스턴스인데, 그 인스턴스의 컬러값이 투명해지느냐, 아니면 그 인스턴스 자체가 투명해 지느냐의 차이가 있다.
        // ex Code = subView.UIcolor => 지정 하거나, subview.alpha = 알파값 ->
        
        subView.alpha = 1
        subView.tag = 10
        
        // 제일 상위 타입 녀석
        // self 는 생략해주어됨, 명시적인 표현이다...?
        //view.addSubview(subView)
        
        ////// UILabel - 텍스트
        
        lb = UILabel()
        
        // 구글링해서, underline text에 대한 값을 가져옴
        lb.attributedText = NSAttributedString(string: "안녕 친구야~!", attributes:
            [NSAttributedStringKey.underlineStyle: NSUnderlineStyle.styleSingle.rawValue])
        
        //lb.text = "안녕 친구야"
        lb.font = UIFont.systemFont(ofSize: 14)
        lb.tag = 100
        
        lb.backgroundColor = UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 0.3)
        
       // scrollView.addSubview(lb)
        
        
        // 이 아래부분 잠시 대기
        // 아, 이런식으로 전역변수에 정의한 lb 를 위의 함수에서 만들어놓은 lb에 넣어서 결과적으로는 self.lb 에 내가 함수에서 만든 lb값이 지정이 되게 만들어줌..오.. 이방법 좋은것 같다. 한번 사용해보자.
        //self.lb = lb
        
        /////////////////////// button 만들기
        
        // 1. 버튼을 만들때 주의 사항은, 타입을 설정 하기. 타입설정은 초기화 수준에서만 가능.
        btn = UIButton(type: .system)
        
        // 2. 상태 선택(nomarl, highlighted.... 등등)
        btn.setTitle("버튼이름", for: .normal)
        btn.setTitle("눌렀습니다", for: .highlighted)
        
        //addTarget의 대한 설명, self를 사용하는 이유는, 내가 버튼을 누르면, 나자신에 대한 상태를 변경하기 위해서임, 다른 버튼의 상태를 넣어주면, 이 버튼을 눌렀을때, 다른 버튼이 실행되는데, 이부분은 action에서 확인해줄수 있음.
        
        // 저기 viewController 안에 상속되어있는 녀석이니까, self 를 사용해서 인스턴스를 가져와서 사용하느냐, 아니면 클레스 내부에 있는녀석을 사용하느냐에 따라서 다르다.
        btn.addTarget(self, action: #selector(ViewController.btnAction(_:)), for: .touchUpInside)
        btn.backgroundColor = UIColor.red
        
        // 테이블뷰
        
        
        
        
        ///////// scrolView
        
        scrollView = UIScrollView()
        
        scrollView.delegate = self
        
        view.addSubview(scrollView)
        scrollView.addSubview(subView)
        scrollView.addSubview(lb)
        scrollView.addSubview(btn)
        
        
        
        
        
        
        
        
    }
    
    @objc func btnAction(_ sender: UIButton) {
        
    }
    
    func updataLayout(){
        // 어떤 뷰를 만들고, 그 뷰들의 크기들만 컨트롤하기위해서 모아줌.
        //subView = UIView()
        subView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: 100)
        
        //self.subView = subView1
        
        //lb = UILabel()
        lb.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        
        ///// 버튼
        
        
        btn.frame = CGRect(x: 0, y: 200, width: 100, height: 100)
        
        /// 스크롤뷰
        
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        scrollView.contentSize = CGSize(width: 1000, height: view.frame.size.height)
        
    }
    
    
    // 테이블뷰 생성
    func makeTableView() {
        
        let tableView: UITableView = UITableView(frame: CGRect(x:0, y:0, width: view.frame.size.width, height: view.frame.size.height), style: .plain)
        
        // dataSource 라는 델리게이트 사용하기.
        tableView.dataSource = self
        
        view.addSubview(tableView)
    }
    
    // 현재 색션의 개수는 1개, rou의 개수는 10개..다.
    // 색션당 로우가 몇개냐.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    // cell을 만들건데, 어떤 위치에 있는 놈을 만들것이냐? index 색션과 row로 구분이됨
    
    // 그 row에는 cell 이 몇개가 들어가느냐?
    // 각 각 cell에 해당하는 row 당. UI 가 몇개 들어가느냐
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
    }

}

