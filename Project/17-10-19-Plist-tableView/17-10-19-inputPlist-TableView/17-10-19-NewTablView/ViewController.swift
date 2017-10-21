//
//  ViewController.swift
//  17-10-19-NewTablView
//
//  Created by MIN JUN JU on 2017. 10. 19..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    
    @IBOutlet var tv: UITableView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //dataSource 사용.
        tv.dataSource = self
        
        DataCenter.mainCenter.loadNameList()
        
        
        
    }
    
    
    
    // 보여지기 전에 보여주어야하는 시점이기때문에, 이시점에서 이전에 save한 데이터를 load 해줌
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tv.reloadData()
    }
    
    
    // 각각 cell 정의
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataCenter.mainCenter.nameList.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        
        //각 row당 cell의 name은, 싱글턴에서 [String]로 저장한 부분을 각각 넣어준다.
        let name: String = DataCenter.mainCenter.nameList[indexPath.row]
        
        cell.textLabel?.text = name
        return cell
    }



}

