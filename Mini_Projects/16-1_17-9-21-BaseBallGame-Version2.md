# 17.9.21

---

## baseball Game ver.2

#### [프로젝트 위치는 이곳입니다](/Mini_Projects/Projexts_Xcode/17-9-21-baseballGame-Version2)


 - 반복되는 코드들을 조금 줄여서 만들어 보았다.


```swift
import UIKit
class ViewController: UIViewController {
    
    //레이블 모음
    @IBOutlet var disPlayLabel: UILabel!
    @IBOutlet var disPlayLabel1: UILabel!
    @IBOutlet var disPlayLabel2: UILabel!
    @IBOutlet var resultDisPlayLabel: UILabel!
    
    //텍스트 레이블(내가 만든것들 로그 추적해서 다시 만들어 보자
    @IBOutlet var textView: UITextView!
    
    //변수 모음
    var isRunning:Bool = false
    var randomValueArray:[Int] = []
    var selectedNumArray:[Int] = []
    
    // 함수 모음
    // 시작 버튼
    @IBAction func startBtn(_ btn: UIButton) {
        isRunning = true    
        //randomValueArray에 난수 생성
        creatRandomValue()
        // text view 에 보여지는 모습 출력
        textView.text = "\(randomValueArray)"
        resultDisPlayLabel.text = "start game 뾰로롱~!"
    }
    
    // 난수를 생성하는 함수를 호출 함
    func creatRandomValue() -> [Int] {    
        while randomValueArray.count <= 2 {
            var randomValue1 = Int(arc4random_uniform(10))
            if !randomValueArray.contains(randomValue1) {
                randomValueArray.append(randomValue1)
            }
        }
        return randomValueArray
    }
    
    // reset 초기화 버튼
    @IBAction func resetBtn(_ btn: UIButton) {    
        // 레이블, 텍스트 초기화
        disPlayLabel.text = ""
        disPlayLabel1.text = ""
        disPlayLabel2.text = ""
        resultDisPlayLabel.text = "대기중 입니다.."
        textView.text = "게임이 초기화 되었습니다..."
        
        // 변수 초기화
        randomValueArray = []
        selectedNumArray = []
    }
    
    // 숫자 버튼 함수 생성
    @IBAction func numberBtn(_ btn: UIButton) {
        if isRunning {
            var btnTag = Int((btn.titleLabel?.text)!)
            if selectedNumArray.count == 0 {
                selectedNumArray.append(btnTag!)
                disPlayLabel2.text = String(selectedNumArray[0])
            }else if selectedNumArray.count == 1 && !selectedNumArray.contains(btnTag!) {
                selectedNumArray.append(btnTag!)
                disPlayLabel1.text = String(selectedNumArray[1])
                
            }else if selectedNumArray.count == 2 && !selectedNumArray.contains(btnTag!){
                selectedNumArray.append(btnTag!)
                disPlayLabel.text = String(selectedNumArray[2])
                textView.text = "\(randomValueArray)\n\(selectedNumArray) 당신이 선택한 숫자 \n 결과는?"
                
            }else if selectedNumArray.count >= 3 && !selectedNumArray.contains(btnTag!){
                resultDisPlayLabel.text = "이제그만.."
            }
            print(selectedNumArray, randomValueArray)
        }
    }
    
    @IBAction func resultBtn(_ btn: UIButton) {
        var strike = 0
        var ball = 0
        var out = 0
        if isRunning {
            for i in 0...2 {
                // 선택한 값이 랜덤값안에 있으면,
                if randomValueArray.contains(selectedNumArray[i]) {
                    if selectedNumArray[i] == randomValueArray[i] {
                        strike += 1
                    }else {
                        ball += 1
                    }
                }else {
                    out += 1
                }
            }
            print(strike, ball, out)
        }
        if out == 3 {
            resultDisPlayLabel.text = "삼진아웃~!"
            textView.text = "\(randomValueArray)\n\(selectedNumArray) 당신이 선택한 숫자 \n 결과는? 삼진 아웃!"   
        }else if strike == 3 {
            resultDisPlayLabel.text = "3S !!"
            textView.text = "\(randomValueArray)\n\(selectedNumArray) 당신이 선택한 숫자 \n 3S !!"
        }else if strike >= 1 {
            resultDisPlayLabel.text = " \(strike)S, \(ball)B, \(out)O 입니다"
            textView.text = "\(randomValueArray)\n\(selectedNumArray) 당신이 선택한 숫자 \n 결과는? \(strike)S, \(ball)B, \(out)O 입니다"
        }else if strike == 0 {
            resultDisPlayLabel.text = " \(ball)B, \(out)O 입니다"
            textView.text = "\(randomValueArray)\n\(selectedNumArray) 당신이 선택한 숫자 \n 결과는?  \(ball)B, \(out)O 입니다"
        }
    }
}
```
> 반복되는 코드들을 1차로 조금 줄여서 사용했다. 

---

## Class 를 나누어서, viewcontroller 부분이랑 나누어서 설계해보았다.

```swift
import UIKit
class ViewController: UIViewController {
    //레이블 모음
    @IBOutlet var disPlayLabel: UILabel!
    @IBOutlet var disPlayLabel1: UILabel!
    @IBOutlet var disPlayLabel2: UILabel!
    @IBOutlet var resultDisPlayLabel: UILabel!
    
    //텍스트 레이블(내가 만든것들 로그 추적해서 다시 만들어 보자
    @IBOutlet var textView: UITextView!
    
    // player 생성
    var me: User = User()
    var computer: Computer = Computer()
    
    // 버튼들 모음
    // 시작 버튼
    @IBAction func startBtn(_ btn: UIButton) {    
        resultDisPlayLabel.text = "게임을 시작합니다!"
        textView.text = "난수는: \(me.creatRandomValue())"
    }
    
    // reset 초기화 버튼
    @IBAction func resetBtn(_ btn: UIButton) {
        //레이블들 초기화
        disPlayLabel.text = ""
        disPlayLabel1.text = ""
        disPlayLabel2.text = ""
        resultDisPlayLabel.text = ""
        // instance 변수들 초기화
        me.reset()
        computer.reset()
    }
    
    // 숫자 버튼 함수 생성
    @IBAction func numberBtn(_ btn: UIButton) {
        if me.isRunning {
            resultDisPlayLabel.text = "값을 선택중 입니다.."
            var btnTag = Int((btn.titleLabel?.text)!)
            // 인스턴스 함수에 누른 버튼을 인자로 넣어준다.
            me.numberbtn(n: btnTag!)
            if me.selectedNumArray.count == 1 {
                disPlayLabel2.text = String(me.selectedNumArray[0])
            }else if me.selectedNumArray.count == 2{
                disPlayLabel1.text = String(me.selectedNumArray[1])
            }else if me.selectedNumArray.count == 3{
                disPlayLabel.text = String(me.selectedNumArray[2])
            }else {
                resultDisPlayLabel.text = me.outputString
            }
            textView.text = "난수는: \(me.creatRandomValue()) \n 너가 선택한 수는 \(me.selectedNumArray) \n 결과는?!"
            print(me.selectedNumArray, me.randomValueArray)
        }
    }
    
    // 결과 버튼
    @IBAction func resultBtn(_ btn: UIButton) {
        if self.me.isRunning && computer.getUserRandomValue.count == 0 {
            // me 라는 인스턴스 computer가 사용
            computer.getUser(n: me)
            // 연산위해서 유저의 값을 가져옴
            computer.decompositionValue()
            computer.result()
            if computer.out == 3 {
                resultDisPlayLabel.text = "삼진아웃~!"
                textView.text = "난수는: \(me.creatRandomValue()) \n 너가 선택한 수는 \(me.selectedNumArray) \n 결과는?! 삼진아웃~!"
                // 레이블 초기화
                disPlayLabel.text = ""
                disPlayLabel1.text = ""
                disPlayLabel2.text = ""
                me.selectedNumArray = []
                computer.reset1()
            }else if computer.strike == 3 {
                resultDisPlayLabel.text = "3S !!"
                textView.text = "난수는: \(me.creatRandomValue()) \n 너가 선택한 수는 \(me.selectedNumArray) \n 결과는 3S!!!!!!"
            }else if computer.strike >= 1 {
                resultDisPlayLabel.text = " \(computer.strike)S, \(computer.ball)B, \(computer.out)O 입니다"
                textView.text = "난수는: \(me.creatRandomValue()) \n 너가 선택한 수는 \(me.selectedNumArray) \n 결과는?! \(computer.strike)S, \(computer.ball)B, \(computer.out)O 입니다"
                disPlayLabel.text = ""
                disPlayLabel1.text = ""
                disPlayLabel2.text = ""
                me.selectedNumArray = []
                computer.reset1()
            }else if computer.strike == 0 {
                resultDisPlayLabel.text = " \(computer.ball)B, \(computer.out)O 입니다"
                textView.text = "난수는: \(me.creatRandomValue()) \n 너가 선택한 수는 \(me.selectedNumArray) \n 결과는?! \(computer.ball)B, \(computer.out)O 입니다"
                disPlayLabel.text = ""
                disPlayLabel1.text = ""
                disPlayLabel2.text = ""
                me.selectedNumArray = []
                computer.reset1()
            }
        }
    }
}


****User부분 ******
import Foundation
class User {    
    var randomValueArray:[Int] = []
    var isRunning:Bool = false
    var selectedNumArray:[Int] = []
    var outputString = ""
    
    //start 버튼 난수 생성
    func creatRandomValue() -> [Int] {
        // 게임 시작 활성화
        isRunning = true    
        // 난수 생성해서 인스턴스에 던져줌.
        while randomValueArray.count <= 2 {
            var randomValue1 = Int(arc4random_uniform(10))
            if !randomValueArray.contains(randomValue1) {
                randomValueArray.append(randomValue1)
            }
        }
        return randomValueArray
    }
    
    func reset() {
        //변수 초기화
        self.randomValueArray = []
        self.selectedNumArray = []
        self.isRunning = false
    }
    
    func numberbtn(n:Int) {
        if self.isRunning {
            if self.selectedNumArray.count == 0 {
                selectedNumArray.append(n)
            }else if selectedNumArray.count == 1 && !selectedNumArray.contains(n) {
                selectedNumArray.append(n)
            }else if selectedNumArray.count == 2 && !selectedNumArray.contains(n){
                selectedNumArray.append(n)
            }else if selectedNumArray.count >= 3 && !selectedNumArray.contains(n) {
                outputString = "이제그만..."
            }
        }
    }    
}

******* Computer 부분*********
import Foundation
class Computer {
    var getUserValueArray: [User] = []
    var getUserRandomValue: [Int] = []
    var getUserSelectedValue: [Int] = []
    var strike = 0
    var ball = 0
    var out = 0
    
    // user 의 인스턴스를 가지고옴
    func getUser(n:User) {
        getUserValueArray.append(n)
    }
    
    // user 의 value 값을 가져온다.
    func decompositionValue() {    
        for i in getUserValueArray[0].randomValueArray {
            getUserRandomValue.append(i)
        }
        for i in getUserValueArray[0].selectedNumArray {
            getUserSelectedValue.append(i)
        }
    }
    
    func result() {
        //S, B, O 값
        for i in 0...2 {
            // 선택한 값이 난수 속에 있으면
            if getUserRandomValue.contains(getUserSelectedValue[i]) {
                // 인덱스가 같으면, strike +1
                if getUserSelectedValue[i] == getUserRandomValue[i] {
                    strike += 1
                }else {
                    ball += 1
                }
            }else {
                out += 1
            }
        }
        print(strike, ball, out)
    }
    
    func reset() {
        self.getUserRandomValue = []
        self.getUserSelectedValue = []
        self.getUserValueArray = []
        self.strike = 0
        self.ball = 0
        self.out = 0
    }
    
    func reset1() {
        self.getUserRandomValue = []
        self.getUserSelectedValue = []
        self.ball = 0
        self.strike = 0
        self.out = 0
    }
}
```

<p align="center">

![screen](/study/image/baseBallGame.png)

</p>


