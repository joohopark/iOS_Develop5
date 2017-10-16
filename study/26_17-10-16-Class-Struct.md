# 26_17-10-16

---

## Class, Struct 

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
- 모든 구조체는 자동으로 `Memberwise Initializers`가 만들어 진다.

- base Initializers : 일반적으로 사용하는 init

```swift

 struct Subject {       var name:String   }   class Student {       var subjects:[Subject] = []       func addSubject(name:String) {let subject = Subject(name: name)   <-- `Memberwise Initializers`           subjects.append(subject)       }}var wingMan:Person = Person()  <-- `Initializers`Memberwise Initializers


```

- Memberwise Initializers : 구조체의 init

```swift

// Struct의 경우 모든 프로퍼티가 초기화 할수 있게 모든 멤버에 대해 initializer가 생긴다. init(name:String)

struct Subject {    var name:String} class Student {    var subjects:[Subject] = []    func addSubject(name:String) {let subject = Subject(name: name)        subjects.append(subject)    }}var wingMan:Person = Person()

```

- Custom Initializer : 임의의 값을 받아서 초기화 해주면, custom Initializer 한다고 한다..?

![screen](/study/image/ClassVSStruct-2.jpg) <br>

[apple 문서 ](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Initialization.html)

> 사용자가 어떤 값을 파라미터로 받아서, 초기화 하면 custom Initializer 한다고 하는데... 음... 일반 init과 어떤 차이가 있는지 아직은 알쏭달쏭하다. 
 


- Designated initializer : 특정 조건을 만족 시켜야한다. 
	- 모든 프로퍼티가 초기화 되어 있어야 한다
	- 상속을 받았다면 부모 클래스의 `Designated initializer` 을 호출 해야한다
	
```swift

init(parameters) { statements }

```



- Convenience initializers : 편의 초기화, 이 기능이 필요없다면 구현해주지 않아도 된다. 말 그대로 class의 편의를 위해서 사용하는 초기화인데, 예를들어서 



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


- Required Initializers <br>
	-  상속받은 모든 클래스는 필수로 구현 해야 한다
	-  required 를 구현할때는 override 수식어를 사용하지 않아도 된다.

```swift

class SomeClass {
	required init() {
	
		}
	}

```


---

## Class VS Struct

- Class는 참조 타입이며, Struct는 값 타입 이다.(사실 Class와 Struct의 차이는 이 차이때문에 나머지 차이들이 파생되어서 생긴다.)
- Struct는 Type Casting을 사용할수 없다
- Structure의 프로퍼티는 instance가 var를 통해서 만들어야 수정이 가능하다(값 타입이기 때문에, let으로 선언시 더이상 바꿀수 없는 상수로 선언되기때문이다)
- Class는 Reference Counting을 통해 인스턴스의 해제를 계산합니다.
- Class는 deinitializer 를 사용할수 있다. 

---

## 값타입 VS 참조 타입 

- Memory 구조 

![screen](/study/image/ClassVSStruct-5.jpg) <br>


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






















---

## 10.16 필기

# swift 라는 언어를 통해서 cocoa touch 프레임 사용...?

스토리 보드를 통해서 스크롤뷰를 만들때, 스크롤뷰 위에 첫번째로 올라가는 View는 contentsView로 인식이 됨. 

컨텐츠뷰의 사이즈를 고정시키는 방법이거나,
컨텐츠뷰의 사이즈는 유동적이지만, 컨텐츠의 사이즈들이 고정이거나. 

위의 두가지 방법으로 정의가 가능하다.

---

## Class vs Struct

**class, struct 도 둘다 인스턴스 라고 불린다**

class 는 heap 에,
struct 는 stack 에 쌓임.. struct의 크기에 따라서 heap 에 저장되기도 한다..?


- Designated initializers(지정 이니셜라이저)
	- 우리가 일반적으로 사용하고 있는 init 방식 

- Convenience initializers(편의 이니셜 라이저)

- required 는 오버라이드를 작성하지 않는다. 이유는 사실 모든 required 로 작성 되어진 코드는 상속받은 모든 녀석들이 구현을 해주어야 해야 암시적으로 override 를 작성하지 않는다..!


- 이니셜라이져 5가지 정리하자.. 어떤것들이지? 

- 여러가지로 지정 이니셜라이저로 만들어도 상관 없지만, 편의를 위해서 편의 이니셜라이즈를 사용해도 된다.. 

- 이니셜라이져는 지정이녀설 라이저에 있는 녀석을 불러서 사용하는 방식을 취한다.


```swift


**closure 를 다르게 사용하는 방법**

아래의 녀석 자체가 클로져가 되는것이고 
let nameLBC: () -> UILable = {


aaaaaaaa
return lb 
}

위의 녀석은 closure 로 정의가 되어 있어서  사용하려면 

viewdidLoad 로 가서 클로져를 실행 해주어서 클로져 내부에 있는 값들을 던져 준다. 
문법적인 차이와, 실행 순서에 차이가 있음. 

let 다른변수: UILabel = nameLBC() 


/*====================*/
위의 경우나 .

let name: UILable = {
	let lb: UILable = UILable()
	lb.textColor = .red 
	
	return lb 

}()

위의 녀석은 UILable 자체를 바로 실행해서 값을 던져준다는 의미이다.
```

--- 

전역함수와, 중첩함수는 클로져. 

**매소드는 클로져가 아니다.**

---

## Class Vs Struct 

- Class 는 타입 케스팅이 가능하고, struct는 타입 케스팅이 불가능하다. 이유는 스트럭트는 상속을 받지 않기 때문이다.

- Structure의 프로퍼티는 instance가 var를 통해서 만들어야 수정 가능하다. 이 이야기는 맨처음에 var, let 으로 structue 를 선언할할때 는 struct의 값을 초기화값을 지정 해줄수 있지만, 그 이후에 수정이 가능 하려면, var로 선언 해야만 수정이 가능하다 

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

---

## 값타입 vs 참조 타입 

메모리는 그냥 사용하면 비효율적이기때문에, 어느정도 논리적으로 구분을 시켜서 사용하는것이 효율적이기 떄문에 메모리의 구역을 나눈다(stack, heap, data, code)

code: 프로그램의 code 저장
data: 전역변수, 정적 변수가 저장, static 키워드도 이곳에 들어간다.
heap: 동적 할당을 위한 영역 -> class의 인스턴스는 의미상으로 heap에 emfdjrksek. 
stack: 지역변수, 매개 변수 등 


실질적으로 swift의 모든 녀석들은 참조타입이다. 이유는 모든 녀석들이 heap 에 들어가기 때문에.

- 결국에는 stack, heap에 쌓여서 동작을 하는데, 각각 이녀석들이 어디의 메모리 주소를 참조하느냐, 새롭게 만드느냐에 따라서 결과 값이 조금 달라진다.


---

## 값 타입과, 참조 타입

Enum 은 사실 구조체처럼 쓰이지만 ,사실은 값 타입처럼 사용이 되는것처럼 보이지만, 엄밀하게는 참조타입으로서 정의되어서 사용되는것임... swift뭐지.... 이거 내부구조 한번 뜯어보는 방법 찾아보자.

**변수, 함수, 인스턴스가 Stack, Heap 어느 영역에 들어가는지 한번 확인해보자**

값 타입의 경우에는(struct ..등등) 매서드들은 내부에서 변경이 불가능 하다. 

```swift

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

---

## 애플 가이드라인

var someInts:[Int] = [1,2,3,4] 
  -> 이런 문법을 `섭 스크립트` 문법이라고 한다.
  
  

- 우리가 서버에서 데이터를 받아올때, 제이슨을 통해서 가져온다.. 그 제이슨 속의 데이터는 스트링 일수도 있고, 다른 형태일수도 있다... 

- 어떤 데이터를 제이슨으로 사용할때 바로 사용하지 않고, 데이터 모델링을 통해서 데이터를 모델링해서 사용 한다...
- 

---

## 데이터 모델 만들기

초기화 init을 사용할때 옵셔널을 사용하면, 초기화에 실패할수 있는 가능성을 내포한다는 의미가 된다.


```swift

if let rawData = dataDic["gender"] as? Int,  (rawData == 1 || rawData == 2){}

```

if let 문법에서, 를 사용하면 2가지 조건을 걸게됨. , 앞에 조건이 참이면 뒤의 조건도 실행한다.

모델링을 할때는 스트럭스틑 사용한다. 이 스트럭트를 사용해서 모델링 만들기 정리해놓자..!


알라모파이어가 가장 유명한 네트워크 관리해주는 프로그램이다 -> 이거 사용법 한번 찾아보자. 







