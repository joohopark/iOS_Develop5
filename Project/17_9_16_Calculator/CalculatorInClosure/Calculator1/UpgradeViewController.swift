
import UIKit

class UpgradeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK - Secret Method
    let sum = {(num1, num2) -> Double in num1 + num2 }
    let minus = {(num1, num2) -> Double in num1 - num2 }
    let multi = {(num1, num2) -> Double in num1 * num2 }
    let divide = {(num1, num2) -> Double in num1 / num2 }
    
    //MARK: - disPlayLable
    @IBOutlet var disPlayLabel: UILabel!
    var digit:Double = 10
    var operatorArea = ""
    var calculrationArea: Double = 0
    var observers: Double = 0 {
        willSet(newV) {
            disPlayLabel.text = String(newV)
        }
        didSet(oldV){
        }
    }
    
    @IBAction func numberAction(_ btn: UIButton) {
        let inputNumber: Double = Double(btn.tag)
        if observers == 0 {
            observers = inputNumber
        }else {
            observers = (observers * digit) + inputNumber
        }
    }
    
    // = 함수
    @IBAction func equlAction(_ btn: UIButton) {
        if operatorArea == "+" {
            calculrationArea = sum(observers,calculrationArea)
            observers = 0
            operatorArea = ""
            disPlayLabel.text = String(calculrationArea)
            calculrationArea = 0
            
        }else if operatorArea == "-" {
            calculrationArea = minus(calculrationArea, observers) // 큰수가 앞으로 와야해서 위치를 바ㅂ꾸어 준다.
            observers = 0
            operatorArea = ""
            disPlayLabel.text = String(calculrationArea)
            calculrationArea = 0
            
        }else if operatorArea == "*" {
            calculrationArea = multi(observers,calculrationArea)
            observers = 0
            operatorArea = ""
            disPlayLabel.text = String(calculrationArea)
            calculrationArea = 0
            
        }else if operatorArea == "/" {
            calculrationArea = divide(observers,calculrationArea)
            observers = 0
            operatorArea = ""
            disPlayLabel.text = String(calculrationArea)
            calculrationArea = 0
        }
    }
    
    // 오퍼레이션 함수
    @IBAction func operateAction(_ btn: UIButton) {
        if  observers == 0 {
            return disPlayLabel.text = "형 화낸다.."
        }
        // + 연산자 조건 부분.
        if btn.titleLabel?.text == "+" ||
            btn.titleLabel?.text == "-" ||
            btn.titleLabel?.text == "/" ||
            btn.titleLabel?.text == "*"  {
            
            if operatorArea == "" {
                operatorArea = (btn.titleLabel?.text)! // 
                calculrationArea = observers // input 값을 CalArea 에 넣음.
                observers = 0
                
            }else if  operatorArea == "+" {
                calculrationArea = sum(calculrationArea, observers)
                observers = 0
                operatorArea = (btn.titleLabel?.text)!
                disPlayLabel.text = String(calculrationArea)
                
            }else if  operatorArea == "-" {
                calculrationArea = minus(calculrationArea, observers)
                observers = 0
                operatorArea = (btn.titleLabel?.text)!
                disPlayLabel.text = String(calculrationArea)
                
            }else if  operatorArea == "*" {
                calculrationArea = multi(calculrationArea, observers)
                observers = 0
                operatorArea = (btn.titleLabel?.text)!
                disPlayLabel.text = String(calculrationArea)
                
            }else if  operatorArea == "/" {
                calculrationArea = divide(calculrationArea, observers)
                observers = 0
                operatorArea = (btn.titleLabel?.text)!
                disPlayLabel.text = String(calculrationArea)
            }
        }
    }
    
    // 초기화 함수
    @IBAction func resetAction(_ btn: UIButton){
        observers = 0
        calculrationArea = 0
        operatorArea = ""
    }
}
