//
//  ViewController.swift
//  reCreatTableView
//
//  Created by MIN JUN JU on 2017. 9. 30..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//

import UIKit

// UITableViewDataSource, UITableViewDelegate 두개를 상속받음, 각각의 매소드들을 사용하기위해서!
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    var viewTablelist:[String] = []
    var vt: UITableView?
    let poketmon: [String] = ["1","2","3","4","5","6","7","8","9"]
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //appendNumber()
        
     //
        
        
        
        // 테이블뷰를 사용하기 위해서는 계층구조를 이해해야함.
        //테이블뷰의 전체 section, row, cell 의 구조를 알고 있어야한다.
        // 전체 큰 타이틀은 Section, 그 색션의 각 구역 index 같은 부분을 row 그 row 안에들어가있는 데이터가 cell!
        
        
        // 1. 테이블뷰 정의
        vt = UITableView()
        
        
        // bounds 는, defaults로, 그 기기의 전체 해당의 전체 사이즈를 의미한다
        vt = UITableView(frame: view.bounds, style: .grouped)
        
        // 테이블뷰를 사용하기위해서는 section, row, cell을 사용해야하는데, 그녀석을 사용하기 위한 함수를 사용하기 위해서는 datasource와, delegate를 상속받아서, 그 안에 있는 프로퍼티, 함수를 사용해야한다. 그러기 위해서 내가 만든 프로퍼티에 datasource, delegate를 인스턴스로 넣어준다.
        vt!.dataSource = self
        vt!.delegate = self
        
        // cell을 사용하기위해서 기본적으로 identifier 을 해야함.
                  // UITableViewCell class 자체를 등록해서, 그 클레스를 사용하겠다는 의미이다   // 등록이름은 아무거나해도되는데, 통상 클레스 이름을 많이 사용한다.
        vt!.register(MyCustomCell.self, forCellReuseIdentifier: "MyCustomCell")
        
        // 테이블 뷰를 뷰에 뿌려준다
        view.addSubview(vt!)
        
        
        
        
        
        
    }
    // row는, ViewTablelist의 길이만큼으로 작성함. *** tableView 함수를 사용하기 위해서 dataSource를 사용한다. ***
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return poketmon.count //viewTablelist.count
    }
    
    // cell 을 어떻게 구성할건지 정의해주는곳!, cell의 재사용을 하기위해서 설계를 해주어야 한다
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // cell을 등록하고, 어떻게 사용할것인지 뿌려줄것인지 정해 주었음
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCustomCell", for: indexPath) as! MyCustomCell
        
        
        
        
        // 셀의 이미지 셋팅은, indexPath.row 의 번호를, poketmon array 의 인덱스 번호로 사용해서, 이미지 셋팅을 해주고 그 값을 text로 뿌려준다!
        cell.setImage(name: poketmon[indexPath.row])
        
        // cell의 보여지는 부분을 viewTablelist로 할것이기 때문에, textLabel 선택
        /*cell.textLabel?.text = viewTablelist[indexPath.row]
        print(indexPath, indexPath.row, indexPath.section)*/
        
        return cell
        
        
        
        
        
    }
    
    // 총 색션을 3개로 구성
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 3
    }
    
    // 값을 어레이에 집에 넣어주는 함수생성
    
    func appendNumber() {
        
        for i in 0...29 {
            viewTablelist.append(String(i))
        }
        
        
        
        
    }
    
    // 테이블뷰를 선택했을때, 어떤 모션이 발생하게 만들어보자!
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // 1. UIAlertController 설정
        let popAlert: UIAlertController = UIAlertController(title: "PppooooppP", message: "\(indexPath.section) 색션의, \(indexPath.row) 번째 row가 선택 되었습니다.", preferredStyle: .alert)
        
        // 2. UIAlertAction 설정
        
        let okAlertAction: UIAlertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        let cancelAlertAction: UIAlertAction = UIAlertAction(title: "cancel", style: .default, handler: nil)
        
        // 3. 알럿액션을 알럿 컨트롤러에 연결
        popAlert.addAction(okAlertAction)
        popAlert.addAction(cancelAlertAction)
        
        // 4. 알럿 뿌려주기
        
        self.present(popAlert, animated: true, completion: nil)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    


}

