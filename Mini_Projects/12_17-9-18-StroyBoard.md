# 17.9.8(월)

---

## StoryBoard 이용해서 기업 대표이사 되기 <br>

#### [프로젝트 위치는 이곳입니다](/Mini_Projects/Projexts_Xcode/17-9-17-vending_machine)



<p align="center">

![screen](/study/image/vending_machine.png)

</p>


금액을 충전하고, 기업 이미지 구매를 눌렀을때, 가격이 구매 금액의 가격을 반환하도록 만들었습니다. 


```swift 
import UIKit
class ViewController: UIViewController {
    @IBOutlet var moneyDisPlayLabel: UILabel! // 충전 금액 표시 
    @IBOutlet var buyResultDisPlayLabel: UILabel! // 구입 결과 표시
    var chargeMoney:String = ""
    var chargeMoneyArea:Int = 0
    var chargeMoneyArea1:Int = 0
    @IBAction func moneyBtn(btn: UIButton) { // 버튼 함수
        if btn.titleLabel?.text == "1 억" {  // 각 버튼들 숫자로 변환!
            btn.titleLabel?.text = "1"
            if chargeMoney == "" {
                chargeMoney = "0"
                chargeMoneyArea = Int((btn.titleLabel?.text)!)! + Int(chargeMoney)!   // 버튼값과, 현재값을 연산
                chargeMoney = ""
                chargeMoney += "\(chargeMoneyArea)"
            }else {
                chargeMoneyArea = Int(chargeMoney)! + 1
                chargeMoney = "\(chargeMoneyArea)"
            }
        }else if btn.titleLabel?.text == "10 억" {
            btn.titleLabel?.text = "10"
            if chargeMoney == "" {
                chargeMoney = "10"
                chargeMoneyArea = Int((btn.titleLabel?.text)!)! + Int(chargeMoney)!   // 버튼값과, 현재값을 연산
                chargeMoney = ""
                chargeMoney += "\(chargeMoneyArea)"   
            }else {    
                chargeMoneyArea = Int(chargeMoney)! + 10
                chargeMoney = "\(chargeMoneyArea)"
            }
        }else if btn.titleLabel?.text == "100 억" {
            btn.titleLabel?.text = "100"
            if chargeMoney == "" {
                chargeMoney = "100"
                chargeMoneyArea = Int((btn.titleLabel?.text)!)! + Int(chargeMoney)!   // 버튼값과, 현재값을 연산
                chargeMoney = ""
                chargeMoney += "\(chargeMoneyArea)"
            }else {
                chargeMoneyArea = Int(chargeMoney)! + 100
                chargeMoney = "\(chargeMoneyArea)"
            }
        }
        moneyDisPlayLabel.text = chargeMoney
    }
    @IBAction func buyBtn(btn: UIButton) {        
        if chargeMoney == "" { // 오류 방지
            chargeMoney = "0"
        }
        if btn.titleLabel?.text == "10 억" { // Intel 버튼 조건 찾기
            chargeMoneyArea = Int(chargeMoney)! // 현재금액을 숫자로 환상
            if chargeMoneyArea >= 10 {
                chargeMoneyArea1 = Int(chargeMoney)! - 10 // 총금액 연산
                chargeMoney = "\(chargeMoneyArea1)"
                chargeMoneyArea1 = 0
                buyResultDisPlayLabel.text = "Intel 의 대표 이사가 되었습니다."
            }else if chargeMoneyArea < 10 {
                buyResultDisPlayLabel.text = "현재 자금이 부족합니다.."
            }
        }else if btn.titleLabel?.text == "500 억" {
            chargeMoneyArea = Int(chargeMoney)! // 현재금액을 숫자로 환상
            if chargeMoneyArea >= 500 {
                chargeMoneyArea1 = Int(chargeMoney)! - 500 // 총금액 연산
                chargeMoney = "\(chargeMoneyArea1)"
                chargeMoneyArea1 = 0
                buyResultDisPlayLabel.text = "Instagram 의 대표 이사가 되었습니다."
            }else if chargeMoneyArea < 500 {
                buyResultDisPlayLabel.text = "현재 자금이 부족합니다.."
            }
        }else if btn.titleLabel?.text == "1000 억"{
            chargeMoneyArea = Int(chargeMoney)! // 현재금액을 숫자로 환상
            if chargeMoneyArea >= 1000 {
                chargeMoneyArea1 = Int(chargeMoney)! - 1000 // 총금액 연산
                chargeMoney = "\(chargeMoneyArea1)"
                chargeMoneyArea1 = 0
                buyResultDisPlayLabel.text = "facebook 의 대표 이사가 되었습니다."
            }else if chargeMoneyArea < 1000 {
                buyResultDisPlayLabel.text = "현재 자금이 부족합니다.."
            }
        }else if btn.titleLabel?.text == "5000 억" {
            chargeMoneyArea = Int(chargeMoney)! // 현재금액을 숫자로 환상
            if chargeMoneyArea >= 5000 {
                chargeMoneyArea1 = Int(chargeMoney)! - 5000 // 총금액 연산
                chargeMoney = "\(chargeMoneyArea1)"
                chargeMoneyArea1 = 0
                buyResultDisPlayLabel.text = "google 의 대표 이사가 되었습니다."
            }else if chargeMoneyArea < 1000 {
                buyResultDisPlayLabel.text = "현재 자금이 부족합니다.."
            }
        }
        moneyDisPlayLabel.text = "\(chargeMoney)"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}
```

---