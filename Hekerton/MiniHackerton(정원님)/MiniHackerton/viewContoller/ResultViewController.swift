//
//  ResultViewController.swift
//  MiniHackerton
//
//  Created by 김정원 on 2017. 11. 2..
//  Copyright © 2017년 김정원. All rights reserved.
//

import UIKit
import RealmSwift

class ResultViewController: UIViewController {
    var resultData: [Int]!
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var msgLabel: UILabel?
    
    let UNWIND_SEGUE_TO_MAIN = "unwindSegueResultToMain"
    
    let realm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()

        if let data = DataRepository().getResultPlistData() {
            var countDic = [Int:Int]()
            for item in resultData {
                countDic[item] = countDic[item] ?? 0 + 1
            }
            if let result = countDic.sorted(by: { $0.value > $1.value }).first?.key {
                titleLabel?.text = data.getContent(value: result)?.title
                msgLabel?.text = data.getContent(value: result)?.msg
                
                let saveData = MindTestHistoryVO(value: [Date(),result])
                try! realm.write {
                    realm.add(saveData)
                }
            }
        }
    }
    
    @IBAction func handleBtn(_ button: UIButton) {
        performSegue(withIdentifier: UNWIND_SEGUE_TO_MAIN, sender: self)
    }
}
