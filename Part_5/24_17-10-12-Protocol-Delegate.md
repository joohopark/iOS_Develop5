# 24_17.10.12(목)
---

## Protocol, Delegate Pattern

---
## Protocol 

protocol : 일종의 통신규약 처럼 체택 하면 어떤 Protocol 을 체텍한다는것은, 해당 Protocol 이 정의해놓은 무언가를 따르겠다는 약속(?) 체결이 된다.

#### - protocol 문법과 채택, 

```swift
protocol Runable {var regCount:Int {get set} func run()class Animal: Runable {var regCount:Int = 0func run()	}
} 
```
Animal class가, 체텍한 Runable 이라는 Protocol의 기능들을 구현 해야합니다. protocol을 작성할때 함수는 변수는 get,set 으로 함수는, 이름과 파라미터들을 정의 할수 있다.

```swift
protocol Runable {	var regCount:Int {get set} 	func run()
 }protocol Flying :Runable { var wingCount:Int {get set} }class Animal: Flying{	var wingCount: Int = 0	var regCount:Int = 0	func run() {	}
}
```
> Runable 상속 -> Flying 상속 -> class 에서 프로토콜 채택 하게되면, Runable, Flying 의 기능들을 Animal 은 모두 구현해야한다. 
> 
---

## 추상 클래스로의 protocol

다음과 같은 클래스가 있고, racing 이라는 함수를 구현하려고 한다면!

```swift  class Dog: Runable{  //... } class Horse: Runable{  //... } func racing(animals:[Runable]) -> Runable { }- 프로토콜타입으로 사용가능하다.let winner:Runable = racing(animals: [Dog(),Horse()])
```

> 학심은 Procotol도, type 가 될수있다. 상속받은 class 의 type을 protocol type로 묶어서 사용할수 있다.
> 
> 사실 이 부분 때문에, Delegate 가 가능하다.

---

## Delegate 패턴 

![screenc](/study/image/Delegate.jpg)

> 델리게이트 패턴은 특정 클래스가 하는 일 중 일부를 자신의 다른 커스텀 클래스 에서 대신 처리하기 위해서 사용할수 있는 패턴 입니다. 다른 언어와 비교하자면 클래스 추상화(Class Abstraction)와 비슷하게 생각 할수도 있습니다. 엄밀하게 Delegate의 의미인 `위임한다` 라는 표현이 맞겠지만, 
>
>참고로 델리게이트 패턴은 데코레이터 패턴(Decoratior Pattern)의 하위 분류로서 `확장 기능 제공` 을 위한 디자인 패턴중 하나 입니다.
>

---

## Delegate 연습해보기

| * | * | 
| :--: | :--: |
| ![screenc](/study/image/Delegate-1.jpg) | ![screenc](/study/image/Delegate-2.jpg) |

> 위에서 ViewController 에 있는 View는 customView라는 새로운 Class 를 만들어서, 정의 해주었습니다.. 사실 두개가 서로 분리 되어있지만, Delegate 패턴을 사용해서 ViewController 에서 View에 있는 Label의 속성 값을 변경 했습니다.
> 

#### - 예제 코드


```swift
** CustomView 부분
import UIKit
class CustomView: UIView {
    @IBOutlet var customViewLB: UILabel?
    // 2. Delegate 변수 생성  
    var delegate: CustomViewDelegate?
    @IBAction func CustomViewBtnAction(_ sender: UIButton) {
        // 3. ViewController에서 던져지는 Delegate 값이 사용 되어 지는곳.
        customViewLB?.text = delegate?.changeTextLB(self)
    }
}

// 1. Delegate 패턴 사용을 위해서 protocol 생성 
protocol CustomViewDelegate {
    func changeTextLB(_ x: CustomView) -> String
}

## ViewController 부분 
import UIKit
// 1. CustomViewDelegate 채택
class ViewController: UIViewController, CustomViewDelegate {
    @IBOutlet weak var otherView: CustomView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 2. Delegate 사용하기 위해서 인스턴스 생성 
        otherView.delegate = self
    }
    
    // 채택한 protocol 함수 작성-> 실행 
    func changeTextLB(_ x: CustomView) -> String {
    		// changeTextLB에서 던져지는 String 의 값이 CustomView에 있는 LB의 속성(text) 를 변경 시켜 줍니다.
        let returnString: String = "너로 정했다!"
        return returnString
    }
}
```

---

## Closure 로 변경해보기

#### - 위의 방식을 Delegate 가 아닌 closure 를 사용해서 변경해봅니다!

사용하려고 하는 데이터를 Closure 로 캡쳐해 저장한후, 사용하려고 하는 `시점`에 해당 closure 를 실행해줍니다. 

```swift
** CustomView 부분
import UIKit

class CustomView: UIView {
    @IBOutlet var customViewLB: UILabel?
    
    // 사용할 closure 를 정의 
    var closure: ((String) -> Void)?
    
    @IBAction func CustomViewBtnAction(_ sender: UIButton) {
  			// CustomView의 버튼이 눌리면 closure 실행. 이때 closure 는 nil 이기 때문에 실행이 되지않는다.
        closure?("너로 정했다!")
    }
}

** ViewController 부분
import UIKit
class ViewController: UIViewController{
	 // 1. CustomView의 인스턴스 생성 
	 // 이때 IBOutlet 으로 인스턴스를 생성한 이유는, CutomView 자체가 스토리보드로 생성 되었기 때문입니다.. 스토리보드로 인스턴스를 생성할때와, Code로 인스턴스를 생성할때 서로 다르다는것을 인지하고 있어야 할것 같습니다.
    @IBOutlet weak var otherView: CustomView!
    
    override func viewDidLoad() {
        super.viewDidLoad()            
        // 2. customView에서 정의한 Closure를 Closure의 캡쳐기능을 이용해서, `ViewController` 에서 기능을 정의하고, 정의한 기능을 `CustomView` 에서 파라미터로 넣은 값이 실행 되는 형식으로 만들었습니다.        
        otherView.closure = {[weak self] (string) -> Void in
            self?.otherView.customViewLB?.text = string
       }
    }
}

-> closure의 캡쳐 기능으로 인해서, ViewController의 인스턴스를 customView로 던져서 Delegate 처럼 사용이 되었습니다.  	
```

> Closure 를 사용할때, ViewController 에 있는 인스턴스를 사용하게 됩니다. 그렇게 되면 Closure의 특성상 ViewController 의 ref Count가 증가하게되어 순환참조 형식이 되게 됩니다. 어디선가 ViewController 의 인스턴스를 해제 하게되면, 메모리에서 엄밀하게 사라지지 않는 문제가 생기게 됩니다. 그래서 `[weak self]`  명령어를 사용해서, 순환참조 하지 않게 만들어 줍니다.
> 

---

## Delegate

Delegate는 view와 viewcontroller 에서 자주 사용이 되는데, 다른 관계에서도 사용이 가능함
Delegate 는 선언부와, 구현부가 나뉘어져 있는데, 선언부에서는, 구현부에서 알수 없는 기능들을 선언 해놓고, 구현부에서는 Delegate로 체텍을 하면, 선언부에 쓰여진 delegate 값들을 가져와서 사용한다. 

> 실행 원래는 선언부 class 에서 protocol을 체텍해서, ```protocol로 받아온 값이 실해 되는 매서드 안에 Delegate를 넣어놓고``` 그 값에 따라서 변화되는 결과를 Control 할수 있게 사용자에게 ```InterFace``` 를 제공해준다고 생각하자 .

**Delegate 선언부**

```swift
import UIKit
class CustomView: UIView {
    @IBOutlet var customLB: UILabel!
    @IBOutlet var customImageView: UIImageView!
    @IBOutlet var customSwitcher: UISwitch!
    var delegate: CustomViewDelegate?
    
    //UIViewcontroller 의 ViewDidLoad 같은 녀석이다
    override func awakeFromNib() {
        print("customView 실행")    
        customSwitcher.isOn = false
        customSwitcher.isUserInteractionEnabled = false
        customLB.text = "delegate"
        changeimage(imageName: "1")
    }
    
    @IBAction func btn(_ sender: UIButton) {
        customSwitcher.isUserInteractionEnabled = (delegate?.returnTrueisUserInteractionEnabled(customView: self))!
        print("버튼이 눌림")
    }
    
    @objc func changeimage(imageName name: String) {
        let image: UIImage = UIImage(named: name)!
        customImageView.image = image
    }
}
// 프로토콜을 생성 한다!
protocol CustomViewDelegate {
    func returnTrueisUserInteractionEnabled(customView: CustomView) -> Bool
}
```

![screen](/study/image/Delgate.jpg)

> 스토리보드에서, CustomView라는 Class를 상속받은 View를 만들어 놓고, 그 안에 있는 btn, label, switcher, imageView를 Control 하게 만들었다. 


---

## Delegate

**Delegate 구현부**

```swift
import UIKit
class ViewController: UIViewController, CustomViewDelegate  {
    func returnTrueisUserInteractionEnabled(customView: CustomView) -> Bool {
        return true
    }
    
    // IBOutlet 으로, CustomView 에 연결할 변수를 설정한다. 
    @IBOutlet var customViewValue: CustomView!
    override func viewDidLoad() {
        super.viewDidLoad()
        /* 변경 가능
        customViewValue.customLB.text = "뷰컨"
        customViewValue.changeimage(imageName: "2") */
        
        // 이것을 만들기전에 customViewValue = CustomView() 이녀석을 만들고 실행하면, delegate에 받는 값이 nil이 되어서 크러쉬가 난다..
        
        // delegate의 인스턴스를 생성한다 -> 인스턴스를 생성해야, customView에 있는 delegate의 값이 들어가서, 그 값이 유효한 값이 되어서 어떤 행동을 취한다.
        customViewValue.delegate = self   
    }
}
```

![screen](/study/image/Delgate1.jpg)

> Default 값으로 Switcher 의 userinterection 이 false 인데, btn을 누르면, userinterection 이 true 변경되어서, 활성화된다. 
> 
> 여기에서 한계는, 델리게이트의 값을 true 변경 해주어야 한다!

**Delegate 를 설계할때, nil이면 동작이 되지 않아야 하는데, nil일때 app이 죽어버리는 연산을 하는 경우가 많은데, 이 경우를 잘따져 주어서 설계를 해야 할것 같다 ㅠ_ㅠ**
---