//
//  ViewController.swift
//  MyCalculator
//
//  Created by MIN JUN JU on 2017. 9. 12..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//








import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var disPlayLabel: UILabel! // 내가 만든 레이블을 이녀석과 연결 해주는것.

    override func viewDidLoad() { // 화면에 뿌리기 전에 작업되는 영역이다.
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
    var displayText:String = ""
    var temp:[String] = []
    @IBAction func btnNumberClick(btn: UIButton) {
        
        if disPlayLabel.text == "0" {
            displayText = (btn.titleLabel?.text)!
            temp.append(btn.titleLabel!.text!)
        }else {
            displayText += (btn.titleLabel!.text)!
            temp.append(btn.titleLabel!.text!)
        }
        
       
        disPlayLabel.text = displayText
        print(temp)
        
    }
    
    @IBAction func btnResetClick(btn: UIButton) {
        displayText = "0"
        temp.removeAll()
        disPlayLabel.text = displayText
    }

    
    @IBAction func resbtn(btn: UIButton) {
        var num:String = ""
        var num1:String = ""
        
        
        for i in 0...(temp.count-1)
        {
            
            
            if temp[i] == "+"
            {
                for j in 1...(temp.count-1)-i
                {
                    num1 += temp[i+j]
                    var result:String = " \(Int(num)! + Int(num1)!) "
                    disPlayLabel.text = result
                    
                }
                break
                
            }
                
            else if temp[i] == "-"
            {
                for j in 1...(temp.count-1)-i
                {
                    num1 += temp[i+j]
                    var result:String = " \(Int(num)! - Int(num1)!) "
                    disPlayLabel.text = result
                }
                break
                
            }
            else if temp[i] == "*"
            {
                for j in 1...(temp.count-1)-i
                {
                    num1 += temp[i+j]
                    var result:String = " \(Int(num)! * Int(num1)!) "
                    disPlayLabel.text = result
                }
                break
                
            }
            
            
            else if temp[i] == "%"
            {
                for j in 1...(temp.count-1)-i
                {
                    num1 += temp[i+j]
                    var result:String = " \(Int(num)! / Int(num1)!) "
                    disPlayLabel.text = result
                }
                break
                
            }




            
            num += temp[i]
            
        }
        
        
    
        
        
        
        
        
        
        
        
    }
    
  /*  @IBAction func btnResetClick(btn: UIButton) {
        displayText = "0"
        disPlayLabel.text = displayText
    }
    
    @IBAction func operatorbtn(btn: UIButton){
        
        if temp[temp.count-2] == "+"
        {
            
            
        }
        
        
    }*/

    /*
    @IBAction func btn1Click(btn:UIButton) // 버튼 클릭을 했을때 함수의 결과가 레이블에 나옴.
    {
        disPlayLabel.text = "1"
    
    
    
    var list:[String] = []

    @IBAction func numberKeyClick(btn:UIButton)
    {
        
        list.append((btn.titleLabel?.text)!)
        
        var watchString = ""
        
        for i in 0...list.count-1
        {
            watchString += list[i]
            
        }
        disPlayLabel.text = watchString
       // disPlayLabel.text = btn.titleLabel?.text// display의 text를 titleLabel.text로 바로 볼수 있게 보여주는 명령어.
        //print(list)
        
        
    }
    
    @IBAction func initnum(btn:UIButton) //_ list:[String] = list)
    {
        list.removeAll()
        btn.titleLabel?.text = " "
        disPlayLabel.text = "0"
        
        
    }
    
    */
    
    
    
    
    
        
       /*
        let math = Subject(name: "수학")
        math.setScore(s: 100)
        
        let english = Subject(name: "영어")
        english.setScore(s: 50)
        
        let computer = Subject(name: "컴퓨터 공학")
        computer.setScore(s: 50)
        
        let s1 = Student(name: "주영민", id: 1003)
        s1.addSubject(subject: math)
        s1.addSubject(subject: english)
        s1.addSubject(subject: computer)
      
        print(s1.totalScore)
        print(s1.subjects.count)
        print(math.score)
        
        
 
        let cal = SubjectCalculation(calName: "주영민계산기")
        print(cal.calname)
        
        
        override func viewWillAppear(<#T##animated: Bool##Bool#>)
        
        override func viewDidAppear(<#T##animated: Bool##Bool#>)
        
        override func viewWillLayoutSubviews()
        
        override func viewDidAppear(<#T##animated: Bool##Bool#>)
        */
        

        
        
        
        
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

