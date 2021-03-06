# 17.9.26(화)

---
 
## UIButton, UITextField, UITextFieldDelegate

---

## UIButton, highlight, normal, selected,

```swift
import UIKit
class ViewController: UIViewController {
    
    // UIButton 생성
    let onBtn: UIButton = UIButton(frame: CGRect(x: 30, y: 30, width: 100, height: 100))
    let offBtn: UIButton = UIButton(frame: CGRect(x: 140, y: 140, width: 100, height: 100))
    
    override func viewDidLoad() {
        super.viewDidLoad()    
        // 모양과 좌표를 만드는 여러가지 방법이 있다.
        // onBtn.frame = CGRect(x: <#T##CGFloat#>, y: <#T##CGFloat#>, width: <#T##CGFloat#>, height: <#T##CGFloat#>)
        
        // 버튼이 눌리기전, 노말상태에서의 Title값 셋팅
        onBtn.setTitle("on", for: UIControlState.normal)
        
        // 버튼을 누르고 있을때, 변하는 highLight 값 셋팅
        onBtn.setTitle("hihgLighted", for: UIControlState.highlighted)
        
        // 버튼을 누르고 난이후에, 변하는 값을 선택
        onBtn.setTitle("selected", for: UIControlState.selected)
        
        // backGroundColor 값 설정, 여러가지 다른방법으로 값을 설정할수 있다.
        onBtn.backgroundColor = UIColor.blue
                
        // 각각 상태(normal, highlighted, selected) 가 변했을때, titleColor 를 셋팅해줌.
        onBtn.setTitleColor(.white, for: .normal)
        onBtn.setTitleColor(.red, for: .highlighted)
        onBtn.setTitleColor(.green, for: .selected)
        
        // 버튼이 눌렸을때, 구현되는 기능부.        
        onBtn.addTarget(self, action: #selector(self.onBtnAction(_:)), for: .touchUpInside)
        
        //onBtn을 view 에 뿌려주는함수.
        view.addSubview(onBtn)
        
        // offBtn 설정
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
        //isSelected가 true여야, 내가 selected에 설정한 폰트 컬러값들이 변경됨.
        sender.isSelected = true
        //isUserInteractionEnabled = false 가되면, 해당 버튼이 더이상 터치가 안됨
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
```

<p align="center">

![screensh](/study/image/UI.png)

</p>

---

## UI View에, 또다른 Sub View 올리기.


```swift
import UIKit
class ViewController: UIViewController {
    let v1: UIView = UIView(frame: CGRect(x: 50, y: 50, width: 100, height: 100))
    let v2: UIView = UIView(frame: CGRect(x: 20, y: 20, width: 50, height: 50))
    
    override func viewDidLoad() {
        super.viewDidLoad()    
        v1.backgroundColor = UIColor.black
        v2.backgroundColor = UIColor.white
        view.addSubview(v1)
        v1.addSubview(v2)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
```
<p align="center">

![screensh](/study/image/UI-1.png)

</p>

---

## 버튼 하나를,여러 버튼과 기능을 연결, 연결되지 않은 버튼은 다른 기능 수행 하는 버튼 만들기


```swift
import UIKit
class ViewController: UIViewController {   
    // 각각 버튼들 생성, 다른방법으로 생성 할수도 있음.
    let rectangle: UIButton = UIButton(frame: CGRect(x: 0, y: 0 , width: 118, height: 215))
    let rectangle1: UIButton = UIButton(frame: CGRect(x: 128, y: 0 , width: 118, height: 215))
    let rectangle2: UIButton = UIButton(frame: CGRect(x: 256, y: 0 , width: 118, height: 215))
    let rectangle3: UIButton = UIButton(frame: CGRect(x: 0, y: 225 , width: 118, height: 215))
    let rectangle4: UIButton = UIButton(frame: CGRect(x: 128, y: 225 , width: 118, height: 215))
    let rectangle5: UIButton = UIButton(frame: CGRect(x: 256, y: 225 , width: 118, height: 215))
    let rectangle6: UIButton = UIButton(frame: CGRect(x: 0, y: 450 , width: 118, height: 215))
    let rectangle7: UIButton = UIButton(frame: CGRect(x: 128, y: 450 , width: 118, height: 215))
    let rectangle8: UIButton = UIButton(frame: CGRect(x: 256, y: 450 , width: 118, height: 215))
    
    override func viewDidLoad() {
        super.viewDidLoad()    
        // 버튼들 화면에 뿌려줌
        creatreRectangle()
        //rectangle 1,3,5,7 을 다른 기능으로 묶었음.
        rectangle.addTarget(self, action: #selector(self.rectangleAction(_:)), for: .touchUpInside)
        rectangle1.addTarget(self, action: #selector(self.rectangle1Action(_:)), for: .touchUpInside)
        rectangle1.tag = 1
        rectangle2.addTarget(self, action: #selector(self.rectangleAction(_:)), for: .touchUpInside)
        rectangle3.addTarget(self, action: #selector(self.rectangle1Action(_:)), for: .touchUpInside)
        rectangle3.tag = 3
        rectangle4.addTarget(self, action: #selector(self.rectangleAction(_:)), for: .touchUpInside)
        rectangle5.addTarget(self, action: #selector(self.rectangle1Action(_:)), for: .touchUpInside)
        rectangle5.tag = 5
        rectangle6.addTarget(self, action: #selector(self.rectangleAction(_:)), for: .touchUpInside)
        rectangle7.addTarget(self, action: #selector(self.rectangle1Action(_:)), for: .touchUpInside)
        rectangle7.tag = 7
        rectangle8.addTarget(self, action: #selector(self.rectangleAction(_:)), for: .touchUpInside)
    }
    
    // 뷰에 뿌려주는 함수 구현
    @objc func creatreRectangle() {
        var rectangleArray: [UIButton] = [rectangle,rectangle1,rectangle2,rectangle3,rectangle4,rectangle5,rectangle6,rectangle7,rectangle8]
        for i in rectangleArray {
            view.addSubview(i)
            i.backgroundColor = UIColor.blue
        }
    }
    
    // 버튼 별로 각각 다른 기능으 구현
    @objc func rectangleAction(_ sender:UIButton) {
        if sender.backgroundColor == UIColor.blue {
            rectangle.backgroundColor = UIColor.darkGray
            rectangle2.backgroundColor = UIColor.darkGray
            rectangle4.backgroundColor = UIColor.darkGray
            rectangle6.backgroundColor = UIColor.darkGray
            rectangle8.backgroundColor = UIColor.darkGray
        }else {
            rectangle.backgroundColor = UIColor.blue
            rectangle2.backgroundColor = UIColor.blue
            rectangle4.backgroundColor = UIColor.blue
            rectangle6.backgroundColor = UIColor.blue
            rectangle8.backgroundColor = UIColor.blue
        }
    }
    
    // 1,3,5,7 기능 구현
    @objc func rectangle1Action(_ sender:UIButton) {
        if sender.backgroundColor == UIColor.blue {
            switch sender.tag {
            case 1:
                rectangle1.backgroundColor = UIColor.darkGray
            case 3:
                rectangle3.backgroundColor = UIColor.darkGray
            case 5:
                rectangle5.backgroundColor = UIColor.darkGray
            case 7:
                rectangle7.backgroundColor = UIColor.darkGray
            default:
                print("없는 범위 입니다.")
            }
        }else {
            switch sender.tag {
            case 1:
                rectangle1.backgroundColor = UIColor.blue
            case 3:
                rectangle3.backgroundColor = UIColor.blue
            case 5:
                rectangle5.backgroundColor = UIColor.blue
            case 7:
                rectangle7.backgroundColor = UIColor.blue
            default:
                print("없는 범위 입니다.")
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
```

> 만들때 몰랐던 사항한가지는, 전역 프로퍼티에, var rect: UIButton! 을 설정하고 Viewdidload에 서 rect.fraem = CGRect(--------------값) 주었는데, 오류 발생 했습니다. 알고 보니까, 클레스 내부의 프로퍼티로 인스턴스를 생성하지 않고, 타입만 지정해 주었을때는, 인스턴스가 없기때문에 nil 이됩니다.그래서 인스턴스가 만들어지기 전이라서 옵셔널 강제 추출 키워드인 `!` 를 사용하니까, app이 바로 죽어 버렸습니다..
<p align="center">

![screensh](/study/image/UI-2.png)

</p>

---

## UITextFieldDelegate 사용하기 


```swift
import UIKit
class ViewController: UIViewController, UITextFieldDelegate {
    // textField 생성
    let tf: UITextField = UITextField(frame: CGRect(x: 10, y: 40, width: 300 , height: 40))
    //ok 버튼생성
    let okBtn: UIButton = UIButton(type: .detailDisclosure)
    //label 생성
    let lb: UILabel = UILabel(frame: CGRect(x: 10, y: 90, width: 300, height: 300))
    // label 에 표시해줄 텍스트 프로퍼티 생성    
    var temp: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()    
        // textField
        tf.placeholder = "여기에다"
        tf.borderStyle = .line
        view.addSubview(tf)
        //okbtn
        okBtn.frame = CGRect(x: 320, y: 40, width: 50, height: 40)
        okBtn.addTarget(self, action: #selector(ViewController.okBtnAction(_:)), for: .touchUpInside)
        view.addSubview(okBtn)
        //label
        lb.backgroundColor = UIColor.brown
        view.addSubview(lb)
        // lines 를 설정해줘야지 label의 라인을 무한정 사용할수 있다.
        lb.numberOfLines = 0
        // 델리게이트 설정
        tf.delegate = self
    }
    
    @objc func okBtnAction(_ sender: UIButton) {
        temp += tf.text! + "\n"
        lb.text = temp
        tf.text = ""
        print(temp, lb.text)
    }
    
    // 키보드를 올렸다가, 사라지게 하는 함수..
    @objc func textFieldShouldReturn(_ textField: UITextField) -> Bool {    
        tf.resignFirstResponder()
        return true
    }
}
```

<p align="center">

![screensh](/study/image/UI-3.png)

</p>



