

import UIKit

class ViewController: UIViewController {
    
    enum NumberCheckType:Error {
        case negaTiveNum
        case biggerNumb
        case nonNum
        case noData
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        do {
            // let num을 사용해서 바인딩해줌..
            // do, try, catch 조금더 연습해서 정리 해놓자
            var data: Int?
            let num =  try isSmallNum(0, data)
        }catch NumberCheckType.noData {
            
            print("taget에 값을 넣어주세요")
        } catch NumberCheckType.negaTiveNum {
            print(" 타켓 숫자를 더 적게 입력해주세요")
        } catch NumberCheckType.nonNum {
            print("데이터값이 없다?")
        } catch NumberCheckType.biggerNumb {
            print("값이 크다")
        }catch
        {
            print("설마 다른 값이 있겠어?")
        }
    
        

    
        
        
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        //var x: NumberCheckErrorEnum = NumberCheckErrorEnum.biggerNumb
        
    }
    
    func isSmallNum(_ baseNum: Int,_ targetNum: Int?) throws -> Int {
        
        guard let compareNum = targetNum else {
            throw NumberCheckType.noData
        }
        
        if baseNum < 0 || compareNum < 0 {
            throw NumberCheckType.negaTiveNum
        }
        
        if compareNum > baseNum {
            throw NumberCheckType.biggerNumb
        }

        return compareNum


    }
    
    
    

    
    

}

