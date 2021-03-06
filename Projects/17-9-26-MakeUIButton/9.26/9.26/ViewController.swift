//
//  ViewController.swift
//  9.26
//
//  Created by MIN JUN JU on 2017. 9. 26..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let onBtn: UIButton = UIButton(frame: CGRect(x: 30, y: 30, width: 100, height: 100))
    let offBtn: UIButton = UIButton(frame: CGRect(x: 140, y: 140, width: 100, height: 100))
    
    
    
    
    // viewDidLoad 역활
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // 새로운 뷰 올리기
        
        // v6 뷰를, v2에올리기, 이때 좌표는 상대 좌표를 사용한다.
        let v6 = UIView(frame: CGRect(x: 20, y: 20, width: 50, height: 50))
        
        v6.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        v2.addSubview(v6)
        
        ////////////////////////
        
        let v7 = UIView(frame: CGRect(x: 10, y: 230, width: 100, height: 100))
        
        v7.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        
        view.addSubview(v7)
        
        
        ////////////////
        
        let lb:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: v2.bounds.size.width, height: v2.bounds.size.height))
        
        // 레이블의 줄수는 무한대.
        lb.numberOfLines = 0
        
        
        // 폰트 사이즈는 굵게
        lb.font = UIFont.boldSystemFont(ofSize: 10)
        
        // v2상자에, lb 레이블을 넣었음..!
        lb.text = "가나다라 마바사아자ㅁㅁㅁㅁㅁㅁㅁㅁㄴㅇㅁㅇㄴㅁㅇㅁㅁ"

        v2.addSubview(lb)
        */
        
        
        
        /*////////////////실습
        
        lb.text = "안녕!"
        
        view.addSubview(lb)
        
        
        
        //// Button 만들기
        
        // Button 을 눌렀을때, 모션이 되게 함..
        let btn:UIButton = UIButton(type: UIButtonType.system)
        
        btn.titleLabel?.text = "this is button"
        btn.backgroundColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
        
        btn.setTitle("안녕!", for: UIControlState.normal)
        btn.setTitleColor(UIColor.white, for: UIControlState.normal)
        
        // button action 에 대한 기본적인 구조.
        btn.addTarget(self, action: #selector(ViewController.btnAction(_:)), for: UIControlEvents.touchUpInside)
        
        
        
        
        btn.frame = CGRect(x: 200, y: 300 , width: 100, height: 100)
        view.addSubview(btn)
        */
        
        
        
        
       /* 버튼 기능과 함께 다시만들기
        // 다시만들어봄
                                      // 이렇게되면 생략인데, 사실 UIButtonType 가 생략됨.?
        let btn: UIButton = UIButton(type: .custom)
        
        btn.frame = CGRect(x: 20, y: 20, width: 100, height: 100)
        btn.setTitle("text", for: .normal)
        
        // 버튼을 누르고 있을때 변하는값
        btn.setTitle("highlight", for: .highlighted)
        
        // 버튼을 누르고 손가락을 떼었을때 변하는값.
        btn.setTitle("selectred", for: .selected)
        
        // 각 기능마다 색상을 변경 해줄수 있다.
        btn.setTitleColor(.white, for: .normal)
        btn.setTitleColor(.red, for: .highlighted)
        btn.setTitleColor(.blue , for: .selected)
        
        //액션 정의 해주는것
        
        btn.addTarget(self, action: #selector(self.btnAction(_:)), for: .touchUpInside)
        
        btn.backgroundColor = .purple
        
        view.addSubview(btn)
        
        
    }
    
    @objc func btnAction(_ sender:UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            
        }else {
            sender.isSelected = true
        }
        
        
    }
    */
        

        
        
        onBtn.setTitle("on", for: UIControlState.normal)
        onBtn.setTitle("highlighted", for: UIControlState.highlighted)
        onBtn.setTitle("selected", for: UIControlState.selected)
        
        onBtn.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        onBtn.setTitleColor(.white, for: .normal)
        onBtn.setTitleColor(.red, for: .highlighted)
        onBtn.setTitleColor(.green, for: .selected)
        
        
        onBtn.addTarget(self, action: #selector(self.onBtnAction(_:)), for: .touchUpInside)
        
        view.addSubview(onBtn)
        
        
        
        
        
        offBtn.setTitle("off", for: UIControlState.normal)
        offBtn.setTitle("highlighted", for: UIControlState.highlighted)
        offBtn.setTitle("selected", for: UIControlState.selected)
        
        offBtn.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        offBtn.setTitleColor(.white, for: .normal)
        offBtn.setTitleColor(.red, for: .highlighted)
        offBtn.setTitleColor(.green, for: .selected)
        
        
        offBtn.addTarget(self, action: #selector(self.offBtnAction(_:)), for: .touchUpInside)
        
        view.addSubview(offBtn)

        
        
        
        
    }
    
    @objc func onBtnAction(_ sender:UIButton) {
        
        //내꺼가 눌리고 난 이후에, 상대꺼 안눌림
        sender.isSelected = true
        sender.isUserInteractionEnabled = false
        
        // 내꺼를 누를때 off 버튼의 isSelected 상태를 변화시켜주고, 상대방 버튼을 누를수 있게 만들어줌.
        offBtn.isSelected = false
        offBtn.isUserInteractionEnabled = true
        
    }
    
    @objc func offBtnAction(_ sender:UIButton) {
        
        // 내꺼 selected 가능 상태로,
        sender.isSelected = true
        sender.isUserInteractionEnabled = false
        
        // on 버튼 끄기
        
        onBtn.isSelected = false
        onBtn.isUserInteractionEnabled = true
    }
        
    
    
    /*
    // func 를 사용할때 @objc 를 붙여줘야함., 기능은 버튼을 누를때마다 텍스트가 변하게 만듬..
    @objc func btnAction(_ sender:UIButton) {
        print("버튼 클릭함")
        //lb.text = "버튼을 클릭했으니까 변했다."
        
        btnClickNumber += 1
        var forNumber = 0
        
        var disPlayText = "버튼을 클릭할때마다 변한다."
        
        var totalDisPlayText = ""
        
        for i in disPlayText.characters {
            
            if btnClickNumber == 16 {
                forNumber = 0
                btnClickNumber = 0
                totalDisPlayText = ""
                
            }else if forNumber < btnClickNumber {
                totalDisPlayText += String(i)
                forNumber += 1
            }
            print(forNumber, btnClickNumber)
        }
        lb.text = totalDisPlayText
        
        
        
    }*/
    
    
    
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

