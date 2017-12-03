# 26_17-10-16

---

## Class, Struct, Initialization, Setting a Default Property Value with a Closure or Function

---

## Class && Struct 

- 프로그램 코드 블럭의 기본 구조이다.
- 변수, 상수, 함수 추가 할수 있다.
- 사용시 인스턴스(instance) 라고 불린다. 

---

## 기본 구조


```swift

class VideoMode {var resolution = Resolution()var interlaced = falsevar frameRate = 0.0var name: String?}


struct Resolution {}var width = 0var height = 0

```

---

## Initialization 

- 인스턴스에 설정된 속성의 초기값의 설정과 초기화 하는데 목적이 있다.
- 클래스 및 구조체는 인스턴스로 만들어 질때 프로퍼티는 적절한 초기값으로 모두 초기화 해야 한다.
- 모든 구조체는 자동으로 `Memberwise Initializers`가 만들어 진다
- base Initializers : 일반적으로 사용하는 init

```swift

 struct Subject {       var name:String   }   class Student {       var subjects:[Subject] = []       func addSubject(name:String) {let subject = Subject(name: name)   <-- `Memberwise Initializers`           subjects.append(subject)       }}var wingMan:Person = Person()  <-- `Initializers`Memberwise Initializers


```

#### - Memberwise Initializers : 구조체의 init

```swift

// Struct의 경우 모든 프로퍼티가 초기화 할수 있게 모든 멤버에 대해 initializer가 생긴다. init(name:String)

struct Subject {    var name:String} class Student {    var subjects:[Subject] = []    func addSubject(name:String) {let subject = Subject(name: name)        subjects.append(subject)    }}var wingMan:Person = Person()

```

#### - Custom Initializer : 임의의 값을 받아서 초기화 해주면, custom Initializer 한다고 한다..?

![screen](/study/image/ClassVSStruct-2.jpg) <br>



> 사용자가 어떤 값을 파라미터로 받아서, 초기화 하면 custom Initializer 한다고 하는데... 음... 일반 init과 어떤 차이가 있는지 아직은 알쏭달쏭하다. 
 


#### - Designated initializer : 특정 조건을 만족 시켜야한다. 
	- 모든 프로퍼티가 초기화 되어 있어야 한다
	- 상속을 받았다면 부모 클래스의 `Designated initializer` 을 호출 해야한다
	
```swift

init(parameters) { statements }

```

#### - Convenience initializers : 편의 초기화, 이 기능이 필요없다면 구현해주지 않아도 된다. 말 그대로 class의 편의를 위해서 사용하는 초기화인데, 예를들어서 



```swift

convenience init(parameters) {	statements }

class Food {
    var name: String
    init(name: String) {
        self.name = name
    }
    convenience init() {
        self.init(name: "[Unnamed]")
    }
}

var test = Food()

dump(test)


test = Food(name: "앙")

dump(test)


```

> convenience 는 사실 없어도 된다, 하지만 사용자 입장에서 이름을 작성하지 않는 경우를 추가 하고싶을때 사용한다...? 정도로 짚고 넘어가자.


#### - Required Initializers <br>
	-  상속받은 모든 클래스는 필수로 구현 해야 한다
	-  required 를 구현할때는 override 수식어를 사용하지 않아도 된다.

```swift

class SomeClass {
	required init() {
	
		}
	}

```


---

## Setting a Default Property Value with a Closure or Function

- Closure 를 코드 블럭으로 사용하기



```swift


**Closure의 함수가 인스턴스 정보를 던져주는 경우.**

let CreatBtn: () -> UIButton = {
	let Btn = UIButton()
	Btn.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
	Btn.backgroundColor = .red
	
	**이 시점에서 view.addSubView() 를 할수 없다(이 시점은 인스턴스가 생성 되기 이전의 시점이기때문이다.**
	
	return Btn
}

위의 녀석은 Closure 로 정의된 내부값을 던져준다. Btn 인스턴스를 생성해서 인스턴스의 내부값 자체들을 함수로 만들어서 던져주어서, Btn 인스턴스를 생성 시켜주는 방법이다.

class ViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubView(CreatBtn())
        
        
         }

}


**Closure 자체가 Btn 인스턴스가 되는 경우**

let CreatBtn: UIButton = {
            let Btn: UIButton = UIButton()
            Btn.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
            Btn.backgroundColor = .red
            
            view.addSubview(Btn)
            
            
            return Btn
            
        }()
        
위의 Closure 는 CreatBtn 자체가 Button의 인스턴스 이면서, 인스턴스의 정보값 모두를 가지고 있다. 심지어 view.addSubView(Btn) 까지 완료한 상태의 Btn 이다.

```


---

## Class VS Struct

- Class는 참조 타입이며, Struct는 값 타입 이다.(사실 Class와 Struct의 차이는 이 차이때문에 나머지 차이들이 파생되어서 생긴다.)
- Struct는 Type Casting을 사용할수 없다
- Structure의 프로퍼티는 instance가 var를 통해서 만들어야 수정이 가능하다(값 타입이기 때문에, let으로 선언시 더이상 바꿀수 없는 상수로 선언되기때문이다)

```swift

struct testLet {
    var x: Int
    var y: Int = 10
    
    let a: Int
    let b: Int
}

let abcdefg = testLet(x: 10, y: 20, a: 30, b: 40)

dump(abcdefg)
abcdefg.a = 10 // 컴파일 에러 
abcdefg.b = 30 // 컴파일 에러 
 -> let 으로 선언이 되어서 수정이 불가능하다 

```

- **값 타입은 매서드들은 내부에서 변경이 불가능 하다** : `mutating` 키워드를 사용해야 수정 해줄수 있다.

```swift

값 타입의 경우에는(struct ..등등) 

struct Point {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        self.x += deltaX
        self.y += deltaY }
}


var test = Point(x: 10, y: 10)

test.moveBy(x: 40, y: 40)

dump(test) // mutating 를 사용하지 않으면, x, y 는 struct 내부의 값 이기때문에 변하지 않는다. 

```

> struct에 있는 moveBy 함수는, dstruct 내부의 x,y 값을 변경 하기때문에, mutating 을 사용하면, 한번 정의하면 더이상 값을 변경 할수 없다. 하지만 mutating 를 사용하면 변경이 가능하다.

- Class는 Reference Counting을 통해 인스턴스의 해제를 계산합니다.
- Class는 deinitializer 를 사용할수 있다. 

---

## 값타입 VS 참조 타입 

- Memory 구조 

![screen](/study/image/ClassVSStruct-5.jpg) <br>

> 메모리는 그냥 사용하면 비효율적이기때문에, 어느정도 논리적으로 구분을 시켜서 사용하는것이 효율적이기 떄문에 메모리의 구역을 나눈다(stack, heap, data, code)



- Memory 에 Class, Struct가 어떻게 들어가는지 확인해보자!

**Struct 인스턴스**

var num: Int = 4
var num2: Int = 5

**Class 인스턴스**

let lb:UIView = UIVIew()

> 각각 메모리에 어떻게 들어가는지 확인해보자


| Struct Instance  | Class Instance | 
| :------------ | -----------: | 
| ![screen](/study/image/ClassVSStruct-6.jpg) | ![screen](/study/image/ClassVSStruct-7.jpg) | 

- 결과 

| 비교  |
| :------------ |
|![screen](/study/image/ClassVSStruct-8.jpg) |




> 보면 Struct로 인스턴스로 만들어진 녀석들을 STACK, CODE 영역에 저장이 됬다.
> 
> 이유는 Struct는 값 타입이라서, 기본적으로 Struct 인스턴스를 생성할때, 인스턴스의 값을 다른 공간에 새롭게 복사해서, 복사된 인자를 전달한다. 그렇기 때문에 기본적으로 Stack 의 Stack Frema 에 쌓이게된다. 하지만 Struct의 값이 커지게 되면 Heap 영역에 저장 되기도 한다. 
> 
> Class Instance 는 HEAP 영역에, 그 인스턴스의 주소값(이 인스턴스가 가리키는 '값' 이라고 표현하는게 조금더 정확할 것 같다)은 Stack 영역에 쌓였다.
> 
> 하지만 엄밀하게 얘기하면 Swift의 모든 타입은 변수들은 heap 저장되어서 참조 타입이다. 사실 Struct도 인스턴스로 만들어져서 어떤 인스턴스를 '참조' 하고 있을 테니 말이다. 
> 
> 이렇게 생각하게 되면 엄밀하게 내부에서 어떻게 동작하는지 뜯어서 눈으로 확인해야 하지만 실질적으로 그렇게 확인하는게 시간적으로나, 능력(?) 적으로나 매우 까다롭다. 그래서 값, 타입과 참조 타입 두개로 나누어서 생각하기 보다는, 참조 할때는, Heap 영역에 있는 어떤 '값'을 바라보고 있고, 값으로서 사용될떄는 Stack Frema 안에서 사용 되어 진다고 생각하자.


---

## 애플 가이드 라인 

- 연관된 간단한 값의 집합을 캡슐화하는 것만이 목적일 때 <br>
- 캡슐화된 값이 참조되는 것보다 복사되는 것이 합당할 때 <br>
- 구조체에 저장된 프로퍼티가 값타입이며 참조되는 것보다는 복 사되는 것이 합당할때 <br>
- 다른 타입으로부터 상속받거나 자신이 상속될 필요가 없을 때


---


## Reference 


### [apple Initialzation Documents](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Initialization.html)







