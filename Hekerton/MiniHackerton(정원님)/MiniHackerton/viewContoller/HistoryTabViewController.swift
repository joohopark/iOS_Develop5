//
//  HistoryTabViewController.swift
//  MiniHackerton
//
//  Created by 김정원 on 2017. 11. 2..
//  Copyright © 2017년 김정원. All rights reserved.
//

import UIKit
import RealmSwift

class HistoryViewController: UIViewController, UITableViewDataSource {
    @IBOutlet weak var exitBtn: UIButton?
    @IBOutlet weak var stackView: UIStackView?
    
    let UNWIND_SEGUE_TO_MAIN = "unwindSegueHistoryToMain"
    
    let realm = try! Realm()
    var historyData: [MindTestHistoryVO] = []
    lazy var resultPlistData = DataRepository().getResultPlistData()
    
    override func viewDidLoad() {
        for item in realm.objects(MindTestHistoryVO.self) {
            historyData.append(item)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return historyData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if let historyCell = cell as? HistoryTableCell {
            let item = historyData[indexPath.row]
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy년 MM월 dd일 HH:mm"
            historyCell.timeLb?.text = formatter.string(from: item.time)
            historyCell.contentLb?.text = resultPlistData?.getContent(value: item.result)?.title
        }
        
        return cell
    }
    
    @IBAction func handleBtn(_ button: UIButton) {
        performSegue(withIdentifier: UNWIND_SEGUE_TO_MAIN, sender: self)
    }

}

class HistoryTableCell: UITableViewCell {
    @IBOutlet weak var timeLb: UILabel?
    @IBOutlet weak var contentLb: UILabel?
}
