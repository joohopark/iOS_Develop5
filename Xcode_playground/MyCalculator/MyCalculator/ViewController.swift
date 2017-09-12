//
//  ViewController.swift
//  MyCalculator
//
//  Created by MIN JUN JU on 2017. 9. 12..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        /*var picacho:Poketmon = Poketmon(name: "피카츄", level:1)
        
        var goboogi:Poketmon = Poketmon(name: "꼬부기", level:2)
        
        var paeri:Poketmon = Poketmon(name: "파이리", level:3)
        
        picacho.getType(choiceType:"전기")
        goboogi.getType(choiceType:"물")
        paeri.getType(choiceType:"불")
        
        picacho.attack(taget: "꼬부기")*/
        
        
        let math = Subject(name: "수학")
        math.setScore(s: 100)
        
        let english = Subject(name: "영어")
        english.setScore(s: 50)
        
        
        let s1 = Student(name: "주영민", id: 1003)
        s1.addSubject(subject: math)
        s1.addSubject(subject: english)
        
      
        print(s1.totalScore)
        print(s1.subjects[0])
        print(math.score)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

