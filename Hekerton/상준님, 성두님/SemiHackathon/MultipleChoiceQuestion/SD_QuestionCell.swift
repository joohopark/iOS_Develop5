//
//  QuestionCell.swift
//  SemiHackathon
//
//  Created by esung on 2017. 11. 2..
//  Copyright © 2017년 esung. All rights reserved.
//

import UIKit

class SD_QuestionCell: UICollectionViewCell {
    @IBOutlet weak var q1Button:UIButton!
    @IBOutlet weak var q2Button:UIButton!
    @IBOutlet weak var q3Button:UIButton!
    @IBOutlet weak var q4Button:UIButton!
    private var closure:((Int)->Void)?
    func setClosure(_ closure:@escaping (Int)->Void){
        self.closure = closure
    }
    
    @IBAction private func q1ClickHandler(_ sender:UIButton){
        closure?(0)
    }
    @IBAction private func q2ClickHandler(_ sender:UIButton){
        closure?(1)
    }
    @IBAction private func q3ClickHandler(_ sender:UIButton){
        closure?(2)
    }
    @IBAction private func q4ClickHandler(_ sender:UIButton){
        closure?(3)
    }
    
    
}
