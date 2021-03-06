# 17.9.19(화)

---

## Enumeration(열거형), Optionals, Early Exit(Guard let), if let 
 
---

## Enumeration(열거형)

열거형은 비슷한 타입들이 모여 있는 '집' 같은 느낌이다. 그 집에는 각각 다른 또 하나의 속성들이 들어있다. 

#### - 열거형 문법

```swift
enum <열거형 이름> { 
  	  case <열거 항목1>
  	  case <열거 항목2>
 
enum Planet {
 	case mercury, venus, earth,mars, jupiter 
 	여기서 ',' 를 기준으로 각각 의 case가 된다. 
  }
```
 
#### - 열거형 값 지정

```swift
enum TestEnumType {
    case one
    case two
    case three
    // 축약 정의 가능
    case four, five, six
    
    // 해당 타입일때 어떤 액션을 취할수 있게 만들수 있습니다.
    func searchEnumCase() -> String {
        switch self {
        case .one:
            return "\(TestEnumType.one)"
        case .two:
            return "\(TestEnumType.two)"
        case .three:
            return "\(TestEnumType.three)"
        case .four:
            return "\(TestEnumType.four)"
        case .five:
            return "\(TestEnumType.five)"
        case .six:
            return "\(TestEnumType.six)"
        }
    }
    func printValue() {
        print("해당 EnumType 일때 해당 함수를 사용하여, 어떤 액션을 사용할수 있습니다.")
    }
}

// 한번 Enum 으로 정의 하면 생략해서 사용가능
var getValue = TestEnumType.one
getValue = .three

var otherGetValue:TestEnumType
otherGetValue = .one

// SearchEnumCase 함수 사용
getValue.searchEnumCase()
```

Enum(열거형) 에 값을 넣어서 사용할수 있습니다. **주의** 해야할 사항으로는 Enum 해당 Type, Case 자체를 값으로 생각 해야합니다. 조금 실수 하는 부분은, Enum 의 Case 에 어떤 해당 값을 저장 프로퍼티 처럼 사용할수 없다는 것을 이해하고 있어야 합니다.

#### - Associated Values(연관된 값 정의)

```swift
enum NetworkError {
  case invalidParameter(String, String)
  case timeout
}

let error: NetworkError = .invalidParameter("email", "이메일 형식이 올바르지 않습니다.")
print(error) // invalidParameter("email", "이메일 형식이 올바르지 않습니다.")
```
 
연관된 값들을 Enum의 case 에 모아서 정의 할수 있습니다. 
 

#### - switch 문을 사용해서 값을 불러오기.

 ```swift
let error: TestEnumType = .invalidParameter("email", "이메일 형식이 올바르지 않습니다.")
print(error)

switch error {
case .invalidParameter(let a, let b):
    print("\(a), \(b)")
}
```

Enum 의 Case 값들을 Switch case 문으로 호출 할때, Associaged Values 값 각각을 호출 하고 싶다면, 바인딩을 해주고 난 이후에 값을 확인해야 합니다. 

#### - Raw Values(원시값) 

Raw Values 값 설정을 통해서, enum 에 있는 case들에 값들 지정해줄수 있습니다.. Raw Value 설정 값으로 한개의 값만 선택하면, default 값으로 enum안에 있는 녀석들에게 순차적으로 값을 넣어서 정의 할수 있습니다. 

```swift
enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}

enum Planet: Int {
    case mercury=1, venus, earth, mars, jupiter, saturn, uranus, neptune
}

enum CompassPoint: String {
    case north, south, east, west
}

// rawValue 로 해당 값을 호출
print(ASCIIControlCharacter(rawValue: "\t")) // Optional(ASCIIControlCharacter.tab)
print(Planet(rawValue: 3)) // Optional(Planet. earth)
print(CompassPoint(rawValue: "east")) // Optional(CompassPoint.east)

// 해당값으로 rawValue 를 호출
print(ASCIIControlCharacter.carriageReturn.rawValue) // "\r"
print(Planet.earth.rawValue) // "3"
print(CompassPoint.east.rawValue) // "east"
```

#### - 재미있는 사실 하나, Optional은 사실 Enum! 

```swift
public enum Optional<Wrapped> {
  case none
  case some(Wrapped)
 }
 
var age: Int? 

switch age {
case .none: // `nil`인 경우
  print("나이 정보가 없습니다.")

case .some(let x) where x < 20:
  print("청소년")

case .some(let x) where x < 65:
  print("성인")

default:
  print("어르신")
}
  -> 옵셔널이 enum 이라니...!
```

#### - Initalizing from a Raw Value 
  
enum에 있는 case를 Value 를 이용해서 instance를 만들어서 사용할수 있습니다.

```swift
enum Planet: Int {
case mercury=1, venus, earth, mars, jupiter, saturn, uranus, neptune}

let makeInstance = Planet(rawValue: 2)
var test = Planet.venus.rawValue
print(makeInstance) // Optional(__19_1commandLine.Planet.venus) 옵셔널 값으로 반환되는것을 확인할수 있다. 
print(test) // 2 반환 됩니다. 
```

#### - Recursive Enumerations
 
재귀형 Enumerations... 일반적으로 생각하는 재귀형이랑 조금 다른점은. Enum 내부에 case들의 값을 가지고, Switch 문을 가지고 어떻게 Recusive 값을 만들어서 반환할지 고민해서 반환할수 있습니다.. Recursion 자체를 설계할수 있다는 장점이 있다. 조금더 쉽게 이해하려면, 선언한 Enum Type 자체을 Recursion. 

- Recursion 예제

```swift
func fibo(n:Int) -> Int {
    //var n = n
    //var total = 0
    if n == 1 || n == 2 { // fibo 함수를 만들때 실수 한점..아.. n==2 일때로 설정해주면, 내가 원하는 값에서 리턴이 일어나는구나... 나는 n을 무조건 0을 넣어야 된다고 생각하니까.. 다르내
        return 1
    }else {
        return fibo(n: n-2) + fibo(n: n-1)
    }
}
print(fibo(n: 5)) // 8 

for i in 1...5 {
    print(fibo(n: i)) // 1 1 2 3 5 반환되는것을 확인할수 있음..
```

#### - Recursive Enumerations 
 
```swift

* indirect enum 

ArithmeticExpression { 
	case number(Int) 
	case addition(ArithmeticExpression, ArithmeticExpression) 
	case multiplication(ArithmeticExpression, ArithmeticExpression) 
}

let five = ArithmeticExpression.number(5)let four = ArithmeticExpression.number(4)let sum = ArithmeticExpression.addition(five, four)let product = ArithmeticExpression.multiplication(sum,ArithmeticExpression.number(2))

func evaluate(_ expression: ArithmeticExpression) -> Int {      switch expression {
      case let .number(value):          return value      case let .addition(left, right):
      		return evaluate(left) + evaluate(right)      case let .multiplication(left, right):          return evaluate(left) * evaluate(right)      }  }  print(evaluate(product))
```

Recursive Enumeration 의 방식이, 함수에 Enum 으로 정의한 녀석을 파라미터로 넣으면, 그 안에 있는 값을 함수에서 불러오는데, 함수 내부에서 product 가 뜯어지는 순서를 보았을때 `product` 는 ArithmeticExpression.multiplication 으로 정의되어 있습니다. switch 문에서, let .multiplication(left, right): 이 제일 먼저 실행되면, 값 내부에 있는 sum이 left 로, right 가 ArithmeticExpression.number(2) 랑 바인딩이 됩니다.

함수가 2개 호출되는데, 각각 evaluate(sum) 이 호출됩니다 -> sum 은 ArithmeticExpression.addition 으로 정의가 되어있습니다. 함수 안에 들어가서 Switch 문에서 .addition(left, right) 로 들어갑니다. 이때 들어간 left와 right 값이 더해지면 sum = 9  값을 얻게되고, return evaluate(left) * evaluate(right) 로 돌아가서 9 * evaluate(right) 가됩니다. 

이떄 right의 값은 ArithmeticExpression.number(2) 값으로 switch 문에서 value 값이 반환되어서 9 * 2 = 18 이라는 값으로 리턴되어 프린트 됩니다..

---

## Optionals

#### - nil 이란? <br>

아무 값이 없는 nil 상태

#### - Type Safety<br>
애플 사용하는 Type Safety 이다. 목적은 코드흐름의 안정성을 확보하기 위해서 입니다. nil, 이나 알수없는 error 상황을 미리 헨들링 하기 위해서 Swift 언어는 Type에 대해서 엄격하게 구분 지어서 사용합니다.
	
#### - Optional Type 

사실, 옵셔널은 하나의 enum 이다. Optional 이라는 enum 내부에 case 에 값을 넣고, 그 값을 불러오는 역활을했음..

```swift
** Optional 내부 구조 **
public enum Optional<Wrapped> : ExpressibleByNilLiteral {      case none      case some(Wrapped)      public init(_ some: Wrapped)  }
  
 -> 사실 Optional 의 값이 없으면 none에 저장이되고, 값이 있으면, some에 저장이되서 Type 가 변환되서 뜯어져 나오는것임..!
```

#### - Optional Unwrapping 

Optional일 경우, 해당 값을 Unwrapping 하여 옵셔널이 벗겨진(?) 타입으로 사용합니다.

1. Forced Unwrapping(강제 해제)
2. Optional BInding(옵셔널 바인딩)
3. Early Exit(가드문)
4. Implicitly Unwrapped Optional(암묵적으로 벗겨진 옵셔널)

#### 1. Optional Unwrapping -> Forced UnWrapping(강제해제)

```swift
func testFuc(optionalStr:String?)    {        if optionalStr != nil        {					let unwrapStr:String = optionalStr! 
					print(unwrapStr)
			} 
}

var testStr: String? = "abcdef"
print(testStr) // Optionals("abcdef")
testfuc(optionalStr: testStr) // "abcdef" -> Optionals 이 뜯겨져 나온것을 확인할수 있다.
```

#### 2. Optional Binding(옵셔널 바인딩)

- if let 바인딩

```swift
var optionalInt: Int? = 20
print(optionalInt) //optional(20)

if let intValue = optionalInt {
print(intValue) // 20
	}

var otherOptionalInt: Int? = 30

// 여러가지 옵셔널 값을 한번에 바인딩 할수 있습니다.
if let intValue = optionalInt, let otherInt = otherOptionalInt {
    print(intValue, otherInt) // 20, 30
}

// 바인딩 할때, 조건을 주어서 바인딩 할수 있습니다.
if let intValue = optionalInt, intValue < 20 {
    print(intValue)
}else {
    print("intValue 가 20 보다 큰경우")
}
```

#### 3. Early Exit(guard let 구문)

guard let 구문은, 옵셔널일때, 일종의 가드(방어막) 역활을 한다고 생각하면 좋습니다. <br>
if let, guard let 의 차이점은 guard let 은 optional 일때, guard let 이후의 코드를 실행 하지 않게 guard 하는 역활을 하고, if let 은 optional 값에 따라서 조건을 나누어서 어떤 액션을 적용하고 싶을때 사용하면 좋습니다.
 
```swift
func guardMan(value: [String:String]) {
    guard let guardManInFunc = value["a"]  else {
        print("너는 통과 못해!")
        return
    }
    print("가드맨을 통과 했습니다!")
}

var y: [String:String] = ["a":"우헤ㅣ히"]
guardMan(value: y) // 가드맨을 통과 했습니다!

var z: [String:String] = ["b":"우헤히"]
guardMan(value: z) // "너는 통과 못해!"

** guard let 에 조건을 주어서 사용할수 있습니다.

func checkNumGuard(X:Int?) {
    guard let X = X, X != 10 else {
        print("Error: X is 10!")
        return
    }
    print ("all this code will be executed when X is not 10")
}
var x = 10
checkNumGuard(X: x) // "Error: X is 10!" .. 
```

#### 4. Implicitly Unwrapped Optional(암묵적으로 벗겨진 옵셔널)


```swift
var email: String! = "devxoul@gmail.com"
print(email) // devxoul@gmail.com

 -> `!` 로 옵셔널을 정의하면 옵셔널 이기는 하지만, 원래 알고 있는 기본 옵셔널과는 조금 다른 형태의 옵셔널 입니다. nil 을 포함 하는 옵셔널 이기는 하지만, 암묵적으로 값이 들어갔을때, 옵셔널을 바로 뜯어서 값을 반환 해줍니다.
 
var x: Int!
var y: Int?
print(x, y) // nil nil

x = 20
y = 20

print(x, y) // 20, optional(20)
```

#### - Optional Chaining 


```swift
var displayLabel: UILabel?displayLabel?.text 
```
UILable은 Optional 값인데. Optional값.text 값으로 변환되어지는 과정에 **Optional Chaining**이 사용되었다. 


#### - nil-coalecing

nil 값일 경우 디폴트 값을 지정해줄수 있다. 목적은 nil 값일때 어플이 crush 나는것을 방지하기 위해서, 혹은 nil 일때 다른 값으로 반환 해주어서 사용하기 위해서 사용합니다

```swift
* 기본 옵셔널 체이닝
let array: [String]? = nil
var isEmptyArray = false

위의 두개의 변수를 사용하려면 아래의 코드를 작성하여 원하는 형태로 가공해서 사용 해야합니다. 하지만, 옵셔널 체이닝을 사용하면 조금더 쉽게 옵셔널을 벗겨주어서 사용할수 있습니다. 

if let array = array, array.isEmpty {
  isEmptyArray = true
} else {
  isEmptyArray = false
}

let x = array?.isEmpty 
print(x) nil 
옵셔널 체이닝을 사용하면 array가 nil 일때, isEmpty 를 실행하지 않고, 그 앞에 nil을 뱉어 주게됩니다.

array = []
let x = array?.isEmpty 
print(x) // true 

** 옵셔널 체이닝 활용 하기 

let defaultColorName = "red"
var userDefinedColorName: String?
var userDefinedColorName1: String?

var colorNameToUse = userDefinedColorName ?? defaultColorName
print(defaultColorName, userDefinedColorName, colorNameToUse) // "red", nil, "red" 

체이닝 형식으로 계속 넣을수도 있다.

var colorNameToUse = userDefinedColorName ?? userDefinedColorName1 ?? defaultColorName

print(colorNameTouse) // "red"
```

---