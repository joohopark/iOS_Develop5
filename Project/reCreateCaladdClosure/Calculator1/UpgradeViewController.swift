
import UIKit

class UpgradeViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /* var operation = ((Double, Double) -> Double)
    var displayNumber:Double?
    var inputNumber:String?
    var digit:Double = 10
    let operationLabel:[String] = ["/","*","-","+","="] */
    
    
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
            //print("변화 이전의 값은 \(oldV)")
            
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
    /*// == 함수
    @IBAction func equlAction(_ btn: UIButton) {
        
        if operatorArea == "+" {
            observers = sum(observers,calculrationArea)
        }else if operatorArea == "-" {
            observers = minus(observers,calculrationArea)
        }else if operatorArea == "*" {
            observers = multi(observers,calculrationArea)
        }else if operatorArea == "/" {
            observers = divide(observers,calculrationArea)
        }
        
        
        
    }*/
    
    
    // 오퍼레이션 함수
    @IBAction func operateAction(_ btn: UIButton) {
        
        if  observers == 0 {
            return disPlayLabel.text = "형 화낸다.."
        }
        // + 연산자 조건 부분.
        if btn.titleLabel?.text == "+"  {
            
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
        
    
            // 마이너스 연산자 부분
        }else if btn.titleLabel?.text == "-" {
            
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
        

            // 연산자 부분
        }else if btn.titleLabel?.text == "*" {
            
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
            
            // '/' 나누기 연산자 부분
        }else if btn.titleLabel?.text == "/" {
            
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
            
        }else if btn.titleLabel?.text == "=" {
            
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

    

        //print(observers,calculrationArea,operatorArea)
        
        
        
        
    // 초기화 함수 
    @IBAction func resetAction(_ btn: UIButton){
        observers = 0
        calculrationArea = 0
        operatorArea = ""
    }
    
    
    
}


        
       

    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    


