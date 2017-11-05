//
//  MindTestViewController.swift
//  MiniHackerton
//
//  Created by 김정원 on 2017. 11. 2..
//  Copyright © 2017년 김정원. All rights reserved.
//

import UIKit

class MindTestViewController: UIViewController {
    var mindTestRuntimeModel: MindTestRuntimeModel?
    @IBOutlet weak var exit: UIButton?
    @IBOutlet weak var button1: UIButton?
    @IBOutlet weak var button2: UIButton?
    @IBOutlet weak var button3: UIButton?
    @IBOutlet weak var button4: UIButton?
    @IBOutlet weak var progress: UIProgressView?
    @IBOutlet weak var progressLb: UILabel?
    
    let UNWIND_SEGUE_TO_MAIN = "unwindSegueMindTestToMain"
    let SEGUE_TO_RESULT = "segueMindTestToResult"
    
    override func viewDidLoad() {
        displayValue()
    }
    
    func displayValue(){
        if let model = mindTestRuntimeModel {
            progress?.progress = Float(model.currentDepth) / Float(model.size)
            progressLb?.text = "\(model.currentDepth+1) / \(model.size)"
            randomButton()
            button1?.setTitle(randomOrders[0].msg, for: .normal)
            button2?.setTitle(randomOrders[1].msg, for: .normal)
            button3?.setTitle(randomOrders[2].msg, for: .normal)
            button4?.setTitle(randomOrders[3].msg, for: .normal)
        }
    }
    
    var randomOrders: [(value:Int, msg:String)] = []
    func randomButton(){
        if let data = mindTestRuntimeModel?.currentData {
            var orders: [(value:Int, msg:String)] = [
                (1, data.d),
                (2, data.i),
                (3, data.s),
                (4, data.c),
            ]
            randomOrders = []
            for _ in 0..<orders.count {
                randomOrders.append(
                    orders.remove(
                        at: Int(arc4random_uniform(UInt32(orders.count)))
                    )
                )
            }
        }
    }
    
    @IBAction func handleBtn(_ button: UIButton) {
        guard let tag = MindTestBtnTag(rawValue: button.tag) else {
            return
        }
        switch tag {
        case .exit:
            let alert = UIAlertController(title: "안내", message: "진행하시던 내용이 모두 날아갑니다.\n계속하시겠습니까?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "취소", style: .cancel) {
                _ in
            })
            alert.addAction(UIAlertAction(title: "나가기", style: .default) {
                _ in self.performSegue(withIdentifier: self.UNWIND_SEGUE_TO_MAIN, sender: self)
            })
            present(alert, animated: true, completion: nil)
            return
        case .btn1: break
        case .btn2: break
        case .btn3: break
        case .btn4: break
        }
        let value = randomOrders.filter{ $0.value == tag.rawValue }.first!.value
        mindTestRuntimeModel?.appendResult(value: value)
        if mindTestRuntimeModel?.isResultFull ?? false {
            performSegue(withIdentifier: SEGUE_TO_RESULT, sender: self)
        } else {
            mindTestRuntimeModel?.upCountDepth()
            displayValue()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else {return}
        switch identifier {
        case SEGUE_TO_RESULT:
            if let resultVC = segue.destination as? ResultViewController {
                resultVC.resultData = mindTestRuntimeModel?.resultStack
            }
        default: break
        }
    }

    enum MindTestBtnTag: Int{
        case btn1 = 1
        case btn2 = 2
        case btn3 = 3
        case btn4 = 4
        case exit = 0
    }
}


/* if let vc = storyboard?.instantiateViewController(withIdentifier: "mindtest") as? MindTestViewController {
 mindTestRuntimeModel?.upCountDepth()
 vc.mindTestRuntimeModel = mindTestRuntimeModel
 vc.modalPresentationStyle = .custom
 present(vc, animated: true, completion: nil)
 }*/
