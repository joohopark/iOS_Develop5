//
//  ViewController.swift
//  17-10-20-TableView2
//
//  Created by MIN JUN JU on 2017. 10. 20..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, SwitchTableViewCellDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var onOffList = [true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
    
    // section 개수 설정
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return onOffList.count
    }

    // cell 정의
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: CustomCell! = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomCell
        
        
        
        cell.delegate = self
        cell.textLabel?.text = "\(indexPath.row)"
        
        
        //cell.switchData = onOffList[indexPath.row]
        print(cell.switchData.hashValue)
        cell.indexPath = indexPath
        
        
        
        /*
         closuer 를 사용하는 방법
        let cell: CustomCell! = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomCell
        cell.didChangedSwitchValue = { 
            print("sdfsdf")
            
        }*/
        return cell
    }
    func switchTableViewCell(cell: CustomCell, didChangedSwitch value: Bool) {
        
        // 이녀석을 통해서 어디에 스위치가 바뀌는지 알수 있음.
        //print("\(cell.indexPath.row)", value)
        print(value)
        onOffList[cell.indexPath.row] = value
    }
    


}

