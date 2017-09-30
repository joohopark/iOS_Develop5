//
//  ViewController.swift
//  9.29UItableView
//
//  Created by MIN JUN JU on 2017. 9. 29..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//

import UIKit
// 데이터 소스와, 델리게이트를 기본적으로 추가해놓고 사용하자.
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 테이블뷰 정의                                   // 뷰 전체를 만든다는것? -> view.bounds
        let tv: UITableView = UITableView(frame: view.bounds, style: .plain)
        // dataSource를 사용하기 위해서 사용해줌
        tv.dataSource = self
        tv.delegate = self
        
        // cell을 등록하는 과정? -> UITableViewCell.self 는 클레스 자체를 가리킨다. -> 클레스 자체를 받아옴... Identifier 는 아래에 내가 만든 Cell의 이름이랑 같은 이름을 사용 해야한다. tv.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tv.register(MyCustomCell.self, forCellReuseIdentifier: "MyCustomCell")
        
        //tv.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        
        
        
        view.addSubview(tv)
        
    }
    let poketmon: [String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 색션의 개수 생성
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    
    // 각 색션당 row 의 개수를 설정.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return poketmon.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 타입 2가지 사용하는 방법 -> indexPath 의 section을 기준으로 바꾸어준다..
        
        
            
            // 이녀석은 재사용을함. 테이블 뷰 안에 존재하는녀석을 가져다가 사용을함.
            // 자료구조에서 데이터를 끄집어 낼때 dequeue 라고 하고, 데이터를 넣을때 enqueue
            // 처음에 queue에 집에넣지 않고, "Cell
            // 없으면 새로 만들어서 넣어주고, 있으면 꺼내준다.
            // 아.. 스크롤을 올때마다, 현재 indexPath에 있는 녀석의 값을 ID를 가지고 꺼내오는데,
            // 색션별로, 내려 스크롤을 내릴때, 현재 와야하는 cell이 있으면, 가져오고, 없으면 테이블뷰에 있는 cell을 새로 만들어준다..?
            // let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            
            // 다운캐스팅을 한 이유는, register 에서 row당 등록을 cell 이라는 변수를 사용해야하는데, 등록하는 변수의 타입과, 등록되어지는 cell의 타입을 같게 해주기 위해서이다.
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCustomCell", for: indexPath) as! MyCustomCell
            // indexPath.row 는 현재 index 값같은 것이라고 생각해야 겠다.
            // jpg 가 아닌경우에는 확장자를 제외하고 작성해주어도 괜찮음..
        cell.setImage(name: poketmon[indexPath.row])
            
            //*******이거 잠깐 지워줌
        
        cell.textLabel?.text = poketmon[indexPath.row]
 
 
            return cell
            
        }
        
        
        
        
        
        
        // 사실은 재사용해야되는데 ex) 타입이 2가지이면, 보여지느건 5개인데, 스크롤을 올리면, 이때 스크롤을 내리면, 녹색이 5개 쌓이고, 그 아래 파란색이 와야하는데, 사실은 파란색5개를 다시 만들어서 총 10개를 계속 가지고 있음.. 재사용이 아니라는 이야기임..!
        //return cell
    
    
    // 테이블뷰의 low의 기본 높이를 지정해줌
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
        return 300
    }
    
    // 셀이 선택 되었을때 -> 이녀석을 delegate.self 를 선택 했을때 사용이 가능 하다.
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //눌린 아이의 텍스트 위치,
        let name = poketmon[indexPath.row]
        
        // 1. 알럿을 만들때 제일먼저 해야하는게 알럿 컨트롤을 만들어야함.************* 알럿을 만드는 로직 다시한번 생각하고 만들어보자.
        
        let alertC: UIAlertController = UIAlertController(title: "테이블 테으스트", message: "현재 귀하는 \(name)을 선택 하셨습니다.", preferredStyle: .alert)
        
        // 2. 액션을 만들어야함
        
        let action: UIAlertAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        
        // 3. 알럿에 액션을 추가 해야함
        
        alertC.addAction(action)
        
        // 4. 알럿을 화면에 뿌려줘야함 ->
        
        self.present(alertC, animated: true, completion: nil)
        
        
    }
    
    
    

    
    


}

