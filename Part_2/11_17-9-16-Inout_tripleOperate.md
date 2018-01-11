# 17.9.16(토)

---
## Func, Inout(Call by Value, Call by Reference), 논리연산자(===, !===), 삼항 연산자
 
--

## Func - Auguments Lables And Parameter Name 

#### - Auguments Lables, Parameter Name 구별 이유

```swift
func fName(agumentName  paramName:Int) -> Int {      return paramName + 3  }
```

- fName : 함수 이름 <br>
- agumentName : 인수 레이블(함수 내부에서 쓰이는 변수가 어떻게 쓰이는지 명시 해줄수 있다. 함수에 사용되는 인자 이름이 아니다. <br>
- paramName : 함수 내부에서 쓰이는 인자의 이름. 

Auguments Lables 은 생략이 가능합니다 Auguments Lables가 없을때는 ParameterName이 Auguments Lables로 사용됩니다. Auguments Lables 과 ParameterName 을 엄밀하게 구분하면 인터페이스 사용이 조금 더 수월해진다
  
#### - Inout

스위프트는 기본적으로 함수에 들어가는 Parameter 가 함수 내부로 들어가면 해당 파라미터 값을 수정&변경 할수 없게 됩니다. 이 설정을 바꾸어 줄수있는 명령어가 `Inout` 입니다. 해당 값은, 함수 내부에서도 수정&변경이 가능하고, 함수의 생명주기 밖에서도 사용이 가능해집니다.

```swift

func Value(li:[Int]) {

		li = [10,20,30,40]
		print(li) 

}
var li:[Int] = [1,2,3,4]

print(Value(li:li)) -> [10,20,30,40]
print(li) -> [1,2,3,4]

값이 변하지 않는다.

func Value(li:Inout [Int]) {

		li = [10,20,30,40]
		print(li) 

}
var li:[Int] = [1,2,3,4]

print(Value(li:&li)) -> [10,20,30,40]
print(li) -> [10,20,30,40]

값이 변해있다. 엄밀하게 위는 Value, 아래는 Reference는 아니지만.. 원리는 비슷하게 동작한다는것을 확인할수 있다.
```
---

## 논리연산자(===, !===)

- '===', '!===' : 같은 인스턴스냐를 비교할때 사용된다. 같은 메모리주소값을 가지고 있다. 같은 참조 형식이다로 이해할수있다.
 
```swift
class Person {
}

var person = Person()
var person2 = person
var person3 = Person()

print(person === person2) // true 
print(person === person3) // false

withUnsafePointer(to: &person) { pA in
    print(pA) }  //0x00000001002fcc10
withUnsafePointer(to: &person2) { pA in
    print(pA) }  //0x00000001002fcc20
withUnsafePointer(to: &person3) { pA in
    print(pA) }  //0x00000001002fcc10
    
- > 같은 인스턴스(내부 properties 와 구성들이 같은) 인지를 비교한다. 서로 다른 메모리 주소를 가지고 있다.
```


---

## 삼항 연산자 

- 문법 <br>
	- question ? answer1 : answer2. -> 조건 <br>  
- 결과 <br>
	- question이 참이면 answer1값을   거짓이면 answer2값은 지정한다. <br>
 
> 삼항 연산자의 응용은, 한줄에 조건값을 적어야 할때 사용하면 유용하게 사용할수 있습니다! 

```swift
let age:Int = 20
var result:String = age > 19 ? "성년" : "미성년" 
   // 변수 안에 결과값과, 조건을 모두 넣었음.. 잘 사용하면 매우 편리하게 사용할수 있을것 같다.
```
---

