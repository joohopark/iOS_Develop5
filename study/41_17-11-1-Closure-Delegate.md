# 41_17-11-1

---

## Delegate, Closure, Map, Filter, Reduce...

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

ViewController 에서 정의한 Closure 를, CustomView로 던져줍니다 -> ViewController 의 Closure 가 CustomView로 던져질때 Closure의 캡쳐라는 기능을 이용해서 ViewController 의 인스턴스(self)를 가지고 있고, 그 인스턴스가 CustomView에서 실행이 되어지게되면, Closure가 가지고 있는 ViewControlelr 의 인스턴스를 가지고 어떤 액션을 행할수 있게 됩니다.

```swift

** CustomView 부분


import UIKit

class CustomView: UIView {
    @IBOutlet var customViewLB: UILabel?
    
    // 사용할 closure 를 정의 
    var closure: ((String) -> Void)?
    
    @IBAction func CustomViewBtnAction(_ sender: UIButton)
    {
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

## Closure 응용(Map, Filter, Reduce)

#### - Map

![screen](/study/image/Delegate-3.jpg)


> Map 은 어떤 정의역(x) 값을 받아서 y값으로 인풋을 해주느 는 함수가 있다면, 여기에서 `함수` 의 부분이 Map 의 역활이다..! 
> 

```swift
var digitNumber = 0...10

// Closure 의 타입 생략을 사용했습니다. 
let y = digitNumber.map {
    $0*10
}

print(y) // [0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100]
```

#### - filter

``` swift
var digitNumber = 1...10
let y = digitNumber.filter { (X) -> Bool in
    return X % 2 == 0
}

print(y) // [2, 4, 6, 8, 10]
```

> filter 은 Bool값을 return 하는데, 이때 true인 값을 내부적으로 어떻게 어떻게 동작 시켜서, return 값이 true 인 값들만 filter 해서 값을 돌려줍니다
> 

#### - reduce 

![screen](/study/image/Delegate-4.jpg)

```swift
var digitNumber = 1...10

let y = digitNumber.reduce(0) { (x, y) -> Int in
    return x+y
}
print(y) // 55

let y = digitNumber.reduce(1) { (x, y) -> Int in
    return x+y
}
print(y) // 56

let y = digitNumber.reduce(2) { (x, y) -> Int in
    return x+y
}
print(y) // 57
	-> 조금 했갈릴수 있는게 reduce(X) 여기에서 X는 인자의 파라미터의 첫번째 값이 아니라 그냥 초기 값이다.


var digitNumber = 1...10

let y = digitNumber.reduce(0) { (x, y) -> Int in
    return x*y
print(y) // 0

let y = digitNumber.reduce(1) { (x, y) -> Int in
    return x*y
print(y) // 3628800
}	
```

> reduce는 피보나치 수열처럼, 받는 파라미터의 값을 이터레이터로 하나씩 하나씩 파라미터의 모든 값을 연산해줍니다.
> 

#### - map, filter, reduce 사용하기

```swift

let y = digitNumber.map {
    $0 * 1000
    
    }.filter({
    
        $0 % 2000 == 0
    }).reduce(0) {
        $0 + $1
}

print(y) // 30000
```

---

