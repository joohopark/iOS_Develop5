//
//  ViewController.swift
//  MiniHackerton
//
//  Created by 김정원 on 2017. 11. 2..
//  Copyright © 2017년 김정원. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    let SEGUE_TO_MINDTEST = "segueMainToMindTest"
    let SEGUE_TO_HISTORY = "segueMainToHistory"
    @IBOutlet weak var customBtnMindTest: CustomImageTextButton?
    @IBOutlet weak var customBtnHistory: CustomImageTextButton?
    @IBOutlet weak var titleTopLayout: NSLayoutConstraint?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let titleTopLayout = titleTopLayout {
            titleTopLayout.constant = view.bounds.height * 0.08
        }
        
        let btnClosure: (UIView) -> Void = {[unowned self] (view) in
            guard let tag = MainBtnTag(rawValue: view.tag) else {return}
            switch tag {
            case .mindtest:
                self.performSegue(withIdentifier: self.SEGUE_TO_MINDTEST, sender: self)
            case .history:
                self.performSegue(withIdentifier: self.SEGUE_TO_HISTORY, sender: self)
                break
            }
        }
        
        customBtnMindTest?.touchUpInsideClosure = btnClosure
        customBtnHistory?.touchUpInsideClosure = btnClosure
    }
    
    @IBAction func unwind( segue: UIStoryboardSegue ){
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else {return}
        switch identifier {
        case SEGUE_TO_MINDTEST:
            if  let mindtestVC = segue.destination as? MindTestViewController,
                let data = DataRepository().getExmaplePlistData() {
                var numOrders: [Int] = Array(1...data.count)
                var randomOrders: [Int] = []
                for _ in 0..<numOrders.count {
                    randomOrders.append(
                        numOrders.remove(
                            at: Int(arc4random_uniform(UInt32(numOrders.count)))
                        )
                    )
                }
                mindtestVC.mindTestRuntimeModel = MindTestRuntimeModel(
                    size: randomOrders.count, closure: { data["\(randomOrders[$0])"] })
            }
        case SEGUE_TO_HISTORY:
            
            break
        default: break
        }
    }
    
    enum MainBtnTag: Int{
        case mindtest = 1
        case history
    }

}


