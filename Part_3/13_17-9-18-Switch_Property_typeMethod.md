# 17.9.18(월)

---

## Switch, 프로퍼티(저장, 연산, 타입), Type Method-static

---

## Switch Case 

- Switch 에서 모든 경우가 case에 해당하는 경우라면, dafault 구역을 정의하지 않아도 됩니다.
- Switch문과 else - if 문에서 다른점은, Switch 문에서는 각 조건으로 들어온 값으로 새롭게 다시 변수를 할당해서 다른 조건을 실행 시킬수 있습니다. 

--- 

```swift
* 문법

switchsome value to consider { case 조건 1: 	결과값case 조건 2:
     조건 3:	조건2,3 결과값 default:  	  조건1,2,3 에서 걸리지 않은 모든경우 인데, if-else 와는 다르게 정말 '모든' 부분을 포함함. Nill 까지 고려 합니다


if-else 문과 비교했을때, 조금더 세분화 시켜서 조건문을 사용할수 있다는 장점이 있다고 하는데,  복잡한 패턴 매칭을 간단하게 사용할수 있습니다.


** switch 문에서 _은 (_, 0) 에서, 값이 0일때 모든 x값이 저 스위치 문에서 걸린다..!
func getPoint(somePoint:(Int,Int))     {         switch somePoint {         case (0, 0):             print("\(somePoint) is at the origin")         case (_, 0):             print("\(somePoint) is on the x-axis")         case (0, _):             print("\(somePoint) is on the y-axis")         case (-2...2, -2...2):             print("\(somePoint) is inside the box")         default:             print("\(somePoint) is outside of the box")         }}

** 조건으로 들어온 값 바인딩**
func getPoint(somePoint:(Int, Int)) {
    
    switch somePoint {       
    case (0, _) :
        print("현재 \(somePoint)")
    case (10, 10) :
        print("현재 \(somePoint)")
    case (let x, 0):
        print("현재 x값 \(x)")
    default:
        print("위의 조건을 벗어난 모든값 \(somePoint)")
    }
}
 -> Switch 문으로 들어간 somePoint 가, let x 변수로 바뀌어서 값이 바인딩 되고, 거기에 새로운 조건을 넣어서 가지고 놀수 있다.

 ** 값을 바인딩하고, 변환한 값에 조건을 넣어서, 그 조건이 실행 되게 할수도 있는데, 그때 사용하는게 'where' **
 
 func getPoint(somePoint:(Int, Int)) {
    
    switch somePoint {
        
    case (0, 0) :
        print("현재 \(somePoint)")
    case (10, 10) :
        print("현재 \(somePoint)")
    case (let x, 0):
        print("현재 x값 \(x)")
    case let (x, y) where x == y:
        print("현재 \(x, y) 값이 같습니다.")
    default:
        print("위의 조건을 벗어난 모든값 \(somePoint)")
    }
}

 ->Switch 안에, SomePoint 변수를 let (x, y)로 바인딩하고, 그 바인딩한 프로퍼티들을 where을 이용해서 새로운 조건을 주고 그 조건이 맞으면 case 문이 실행될수 있게 된다.
```

---

## Property
 
- 프로퍼티의 종류 <br>
	- Stored Properties(저장 프로퍼티) <br>
	- Computed Proerties(연산 프로퍼티) <br>
	
- Type Proerties(타입 프로퍼티) <br>
- Stored Properties(저장 프로퍼티) 
	- 값을 저장하는 용도로 사용할수 있다. ex) var a = 10
 
 ```swift
 class test {
    var x:Int = 10
    var y:Int = 20
    init(x:Int, y:Int) {
        self.x = x
        self.y = y
    }
}

var storedProperties = testtest(x: 10, y: 20)
 -> storedProperties 프로퍼티에, class 의 정보들이 '저장'되었다로 이해할수 있다.
 ```
 
- Lazy Stored Properties(게으른 저장 프로퍼티) 

사용되어지기 전에는, 메모리에 저장되어 있지않다가, 사용되어질때, 메모리에 저장되어 사용 되어 집니다. 한번만 사용해야 될때, 사용하면 메모리 관리 차원에서 도움이 될수 있습니다. 
 
한번에 많은 값이 불려지는 곳에서 사용할때 Load 하기 보다, 그렇지 않은 경우에 사용할때 좋습니다.
 
- Computed Properties(연산 프로퍼티)

실제 값을 저장하지 않지만 get, set 키워드를 통해서 값을 간접적으로 설정하거나 받을 수 있다. 
 
 OOP적인 생각으로 class 내부의 전역프로퍼티(?) 들의 값을 컨트롤하고 싶을때, 직접접근하는 방식은 OOP에서 선호하지 않는 방식이다. 그래서 get, set 값을 설정하기 위해서 함수로 만들어 주어야하는데, 간단한 값변경할때는 매우 비효율적일수 있다.. 그래서 이때 사용하는 방식이 Computed Properties 가 될수 있음... 
 
```swift
 
var a: Int = 10
var b: Int = 20

var addProperty: Int {
    get {
        return a+b
    }set(newValue) {
        a = newValue
        b = newValue
        print(a, b)
    }
}

print(addProperty) // 30
addProperty = 10 // 10, 10
print(addProperty) // 20 

  -> 연산 프로퍼티를 사용 하는 경우는, 해당 프로퍼티 하나만으로, 다른 변수들과 연관 지어서 만들어 놓고 싶을때 사용하면 좋을것 같습니다. 저장 프로퍼티나, 함수를 구현해서 만들떄 보다 추상적이긴 하지만, 활용하려고 한다면 무궁 무진하게 사용할수 있을것 같습니다 
 ```
 
- Read Only 연산 프로퍼티

```swift

var url: URL = http://naver.com 

var getProperty: URL {
	return url
	}

print(getProperty) // http://naver.com
	다른 값에 영향을 받지 않고, 고유하게 사용하고 싶은 값이 있을때 사용하면 좋을 것 같습니다. let 이라는 키워드로 변경이 불가능하게 만들어 줄수 있지만, 조금더 유연하게 정의할수 있을것 같습니다. 
```

- Property Observers

프로퍼티 값의 변화를 감시하고(observer), 변화 값에 따라서 대응하는 `변수` 를 정의할수 있습니다. 초기값이 있어야 생성할수 있습니다.

didSet, willSet 키워드를 통해 값 변화의 직전 직후를 감지 할수 있습니다. 변수 이름을 지정하지 않을때는 oldValue, newValue가 기본값으로 지정 됩니다.


```swift
//Property Observers 확인하기

var Observers:Int = 0 {
    didSet(oldV){
        print("변화 이전의 값은 \(oldV)")
    }
    willSet(newV) {
        print("변화 이후의 값은 \(newV)")
    }
}
for i in 0...10 {
    Observers = i // oldV 에는 0 1 2...9
    						// newV 에는 1 2...10 
}
```
변수의 변화 이전, 이후의 값을 추적 할수 있습니다. 그 값에 따라서 어떤 액션을 정해줄수 있습니다.
---

## Type Method 

- static 

타입 프로퍼티랑 마찬가지로 타입 자체에서 호출이 가능한 매서드 `static` 키워드를 사용하여 정의 하면, 해당 타입의 instance 에서 호출하는게 아니라, class(type) 에서 호출 하는것이 가능해집니다. 

static를 사용하는 이유는.. Class 나, 다른 어떤 Type를 불러서 확인하기 위해서 사용합니다... 용도에 따라서 static을 나눠 놓은것 같다.

static은 저장되는 공간이 다르다. memory의 구조중, stack, heap, data, code 영역 중에, class 는 stack에(?) class에서 만들어진 인스턴스는 heap(?) 에... data에 static이 들어간다... 쉽게 생각하면 static은 super 전역 변수라고 생각하면 될꺼습니다. 

```swift 
 class test {
 static var version: String = "1.2.3."
}
print(test.veresion) -> class 이름으로, property 를 불러올수 있습니다..

```
---
 
 
 
 
 