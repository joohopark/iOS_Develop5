# 17.9.15(금)
---
## Tuple, Any, Nill, Type casting, Access Control(접근제어),Optionals, Modules and Sourece Files(모듈과, 소스 파일) 

---

## Tuple

튜플은 변경이 불가능한 배열이라고도 정의 할수 있습니다.


#### - 튜플 가지고 놀기

```swift

** 튜플에 여러개의 값을 넣을수 있습니.**
let http404Error = (404, "Not Found")

print(http404Error) 
   -> 튜플로 404, "Not Found" 두개의 값이 print 됩니다.

**반대로, 여러개의 변수에 튜플의 순서대로 값을 넣어서 정의 할수 있습니다.
let (statusCode, statusMessage) = http404Error

print("The status code is \(statusCode)")
print("The status message is \(statusMessage)")
  - > http404Error의 첫번째 값과 두번째 값이 리턴됩니다.

  
let (justTheStatusCode, _) = http404Error 
print("The status code is \(justTheStatusCode)")
   -> 튜플의 값중에 무시고하고 싶은 값은 '_' 처리합니다. 404값만 들어가서 출력됩니다.
   
** 튜플은 엄밀하게 얘기하면 index은 아니지만, index으로 접근할수도 있고, key 로도 접근할수있습니다.**
** 각 요소에 이름을 정할수도 있습니다.**
let http200Status = (statusCode: 200, description: "OK")

print(http200Status.0) -> 200
print(http200Status.1) -> "OK"

print(http200Status.statusCode) -> 200
print(http200Status.description) -> "OK"

**응용**

**temp 변수 없이 값을 서로 바꿀수 있습니다.**

var a:Int = 20
var b:Int = 30

(a,b) = (b,a)

print(a,b) -> (30, 20)

var a, b ,c, d: Int
a = 10
b = 20
c = 30

print(a, b, c) -> 10, 20, 30
print(d) -> 오류

Swift 에서 문장의 마지막에 ';' 사용하지 않아도 되지만, 사용하면 한줄에 여러개의 코드를 사용할수 있다.

var a, b, c: Int ; a = 10 ; b = 20 ; c = 30 ; print(a, b, c) -> 10, 20 ,30
```
---

## Any

- Any : 스위프트 내의 모든 타입을 나타내고, 최상위 타입입니다
- AnyObject : 스위프트 내의 모든 객체 타입을 나타냅니다.(클래스) 
- nil : 데이터가 없음을 나타냅니다

---

## Type casting

타입 변환(Type casting)은 인스턴스의 타입을 확인하는 방법 또는 인스턴스를 다른 상위 클래스나 클래스 계층구조에 있는 다른 하위 클래스처럼 처리합니다. <br>

Swift에서 타입 변환은 as 연산자로 구현됩니다. 타입 체크는 is 연산자로 확인할수 있습니다.  이러한 두 연산자는 값의 타입을 확인하거나 다른 타입으로 값을 변환하는 것을 제공하는 간단한 표현 방법을 제공합니다. <br>


#### - 다운 캐스팅 예시

```swift

var things = [Any]() 
things.append(0)     //Int 형  
things.append(0.0)   //Double 형
things.append(42)          -> 쭈루룩 타입을 넣음
things.append(3.14159) 
things.append("hello") 
things.append((3.0, 5.0)) 
things.append(Movie(name: "Ghostbusters", director: "Ivan Reitman")) things.append({ (name: String) -> String in "Hello, \(name)" })

for thing in things {
    switch thing {
    case 0 as Int:
        print("zero as an Int")
    case 0 as Double:
        print("zero as a Double")
    case let someInt as Int:
        print("an integer value of \(someInt)")
    case let someDouble as Double where someDouble > 0:
        print("a positive double value of \(someDouble)")
    case is Double:
        print("some other double value that I don't want to print")
    case let someString as String:
        print("a string value of \"\(someString)\"")
    case let (x, y) as (Double, Double):
        print("an (x, y) point at \(x), \(y)")
    case let movie as Movie:
        print("a movie called \(movie.name), dir. \(movie.director)")
    case let stringConverter as (String) -> String:
        print(stringConverter("Michael"))
    default:
        print("something else")
    }
}
 
// zero as an Int          // Any -> Int로 다운 캐스팅
// zero as a Double        // Any -> Double 
// an integer value of 42  // integer -> 
// a positive double value of 3.14159
// a string value of "hello"
// an (x, y) point at 3.0, 5.0
// a movie called Ghostbusters, dir. Ivan Reitman
// Hello, Michael. (String) -> String .. -> (String) 이 String 보다 상위 계층타입인듯.....
```

---
## Access Control(접근 제어), Modules and Sourece Files(모듈 과 소스파일)


#### - Access Control 정의

접근제어(Access control)는 다른 소스파일과 모듈에서 코드에 접근하는 것을 제한합니다. 이것은 코드의 상세 구현부를 숨길 수 있고, 인터페이스 지정하여 코드 접근과 사용 할 수 있습니다. <br>

각각의 타입(클래스, 구조체, 열거형)에 대한 접근 레벨(level)을 지정할수 있고, 프로퍼티, 메소드, 초기화, 서브스크립트에 적용됩니다. 프로토콜은 전역 상수, 변수, 함수처럼 특정 상황(context)을 제한 할 수 있습니다. <br>

다양한 레벨의 접근 제어를 제공하는 것 외에, Swift는 일반적인 시나리오에 대한 기본 접근 레벨을 제공함으로써 명시적으로 접근 제어 레벨을 지정해야 할 필요성을 줄여줍니다. 확실히, 단일-대상(single-target) 앱을 작성한다면, 명시적으로 접근 제어 레벨을 지정하는 것은 필요하지 않습니다. <br>

 
#### - Modules and Sourece Files 정의
 
Swift의 접근 제어 모델은 모듈(modules)과 소스 파일(source files)의 개념을 기반으로 합니다. <br>

모듈(module)는 단일 코드 단위 배포입니다 - Swift의 import키워드를 사용하여 다른 모듈에서 가져오는 것처럼, 프레임 워크나 앱을 내장(built)하고 가져옵니다(shipped). <br>

XCode의 각 빌드 타겟(앱 번들이나 프레임워크)은 Swift에서 분리된 모듈로 취급됩니다. 독립형 프레임 워크처럼 앱의 코드를 함께 그룹화 하면 - 아마도, 여러 앱들 사이에서 코드를 캡슐화 하고 재사용 합니다 - 앱 내에서 가져(imported)와서 사용하거나 다른 프레임 워크에서 사용할때, 프레임워크에서 정의한 모든것이 별도 모듈의 일부가 될것입니다. <br>

소스파일(source file)은 하나의 모듈(실제로, 앱 또는 프레임 워크에서 하나의 파일)로 된 Swift 소스코드 파일입니다. 별도의 소스파일로 각각 타입을 정의하는게 일반적이지만, 하나의 소스파일에서 여러 타입, 함수, 등등 에 대해 정의하는 것이 가능합니다. <br>

> 모듈은 하나의 라이브러리이고, 소스파일은 그 라이브러리를 이루고 있는, 파일들(class, func들의 단일 모임으로 이해하면 편하게 생각할수 있습니다.
> 

#### - Access Level 

Swift는 코드에서 요소들(entities)에 대해 5개의 다른 접근 레벨(access levels)을 제공합니다. 이러한 접근 레벨은 요소(entity)가 정의된 소스파일에 관련 있고, 또한 소스 파일이 속한 모듈과 관련 있습니다. <br>

`Open` access과 `public` access 요소들은 정의된 모듈의 모든 소스파일에서 요소들을(entities) 사용할 수 있고, 또한 정의된 모듈을 가져오는(imports) 다른 모듈의 소스파일에서 사용가능합니다. <br>

프레임 워크에 대해 public 인터페이스를 지정할때, 일반적으로 open 또는 public 접근을 사용합니다. open 과 public 접근의 차이점은 아래에 설명되어 있습니다. <br>

`internal` access 요소들은 정의된 모듈의 모든 소스파일에서 사용 할수 있지만, 모듈 밖의 모든 소스 파일에서는 사용 할수 없습니다. 앱 또는 프레임 워크의 내부 구조로 정의 할때, 일반적으로 internal 접근을 사용합니다. <br>

`File-privae` access은 자신이 정의된 소스파일에서만 요소(entity)를 사용할수 있도록 제한 합니다. file-private 접근은 상세 정보가 전체 파일내에서 사용될때 일부 특정 함수의 세부 구현을 숨길때 사용합니다. <br>

`Private` access은 선언된 영역(enclosing)에서만 요소를 사용할 수 있도록 제한합니다. private접근은 하나의 선언 안에서 상세 정보를 사용할때 일부 특정 함수의 세부 구현을 숨길때 사용합니다. <br>

> Open 과 Public의 가장큰 차이점은 모듈 내에서 Open은 상속이 가능하하지만 Public은 상속이 불가능합니다. 
> 
> 주의할점은 Public을 정의했을때는, internal, file-private, private 들을 사용할수 없습니다. Public 변수로 사용되는 곳에서 해당 변수들을 사용할수 없게 만들기 때문이다.


| * | * |
| :--: | :--: |
|open(개방 접근수준) |모듈 외부까지 접근가능 | 
|public(공개 접근수준) | 모듈 외부까지 접근가능| 
| internal(내부 접근수준)| 모듈 내부에서 접근가능, 기본 지정값 | 
|FilePrivate(파일외 비공개)  | 파일 내부에서만 접근가능 | 
|private(비공개)  | 블럭코드 단위에서만 접근가능 | 

---


## Reference

[Checking for Protocol Conformance](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Protocols.html#//apple_ref/doc/uid/TP40014097-CH25-ID283)<br>
[애플 개발문서 Swift 3.1 Language Guide - Access Control](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/AccessControl.html#//apple_ref/doc/uid/TP40014097-CH41-ID3)
