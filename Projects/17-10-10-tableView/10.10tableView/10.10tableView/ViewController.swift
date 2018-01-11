//
//  ViewController.swift
//  10.10tableView
//
//  Created by MIN JUN JU on 2017. 10. 10..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let tv: UITableView = UITableView(frame: view.bounds, style: .grouped)
        
        tv.dataSource = self
        tv.delegate = self
        
        view.addSubview(tv)
        
        // register 할때, UITableViewCell을 하는 이유는, cell에 등록되어지는 녀셕이 아래 cell을 정의 할때의 녀석을 등록 한다..?
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        
    }
    
    // 각 색션의 Row 한줄한줄을 표현
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    // cell은 각 한줄한줄에 들어가는 데이터!
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 메모리를 효율적으로 사용하기 위해서 위의 tableView에서 받아오는 dequeueReusableCell을 사용 한다.
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = "this is cell"
        
        return cell
    }
    
    // 이녀석은 delegate를 체택해서 사용함.
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }



}

