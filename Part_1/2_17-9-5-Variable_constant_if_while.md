# 17.9.5(화)

## Swift 변수 정의, 자료형, 산술 & 비교 & 논리 연산자, 타입추론, if, while
---

## 변수 & 함수
 - 변수 : 메모리에 값 할당. 언어 마다(객체지향, 순서지향) 저장되는 방식이 조금씩 차이가 있음
 - 힘수 : 변수들의 모음이고, 스위치 역활(스텍프레임의 방식으로 함수 호출시, 변수가 쌓이고, 함수 끝나면 메모리 해제됨)

---
## 변수의 구성 
 - name : 변수를 구분 짓기 위해 임시로 지정된 이름
 - type : 데이터의 자료형
 - address(메모리주소) : 메모리상에 저장되어있는 주소
 - value : 대입 연산자 통해서 값을 지정할수 있음
 - scope(영역) : 변수의 사용가능한 영역, 메모리에 쌓이는 방식, stack, heap 에 따라서 다름
 - sysntax : var name: Type = value = var(변수 키워드), name(변수명), Type(자료의 타입), value(변수에 넣은 값)
 - 예외 사항(명명규칙) : 시스템 예약어 사용할수없음(var..등) 숫자는 이름으로 시작될수 없지만 이름에 포함 가능, 공백 포함 할수 없음, 변수&함수는 lowerCamelCase, 클래스 명은 UpperCameCase

---
## 변수 자료형

- Int(정수) : 1,2,3,10.. ex) var intName:Int
- Double(실수) : 1.1, 2.34, 3.2 ex) doubleName:Double <br>
	- Int 형과 Double 형은 메모리에 저장방식에 따라서, 정밀도가 지정되어 있음..
- String(문자열) : "yo man~!" ex) var stringName:String
- Bool(불리언) : true or false ex) var boolName:Bool 
- Character : 단어나 문장이 아닌 문자 하나

---
## Int & Uint

- 정수형 타입(integer)
- Int : +/- 부호를 포함한 정수이다. 
- Uint : -부호를 포함하지 않은(0은 포함) 정수
- 최대값과 최소값은 max, min 프로퍼티를 통해 알아볼수 있다.
- 8, 16, 32, 64의 시스템 아키텍쳐에 따라서 달라진다. 인코딩 방식에 따라서 아스키, 유니코드을 선택을 하는게 달라진다는 이야기 같음..(정확하게 이해x)
 
---
## 타입추론

- Swift 에서는 선언시 할당되는 값에 의해 타입을 추론하여 가진다.
- python 에서는 동적 언어라서 타입형을 지정해주지 않아도, 문자면 문자, 숫자면 숫자로 자동으로 지정이 되었는데, Swift는 정적 언어라서 변수를 선언할때 자료형을 지정해줘야함.

---
## 변수 VS 상수
 
- 변수 : 변할수 있는 값
	- var name: String = "joo" 
	- name = "Wing"
	- 선언은 var

- 상수 : 변경할수 없는 값
	- let name: String = "joo"
	- name = "Wing" -> 선언하면 컴파일 에러 발생함
 
---
## 산술 연산자 & 비교 연산자 & 논리 연산자 

- 산술 연산자 : `> +, -, *, /, % (더하기, 빼기, 곱하기, 나누기, 나머지)`
- 비교 연산자 : `> ==, >=, <=, >, <, (값이 같다, 크거나 같다ㅡ 작거나 같다, 크다, 작다)`
- 논리 연산자 : `> &&, ||, ! (AND, OR, NOT)`
  
---
## if 문법, 예제 
- if 문법
 
```swift
if 조건 {
   조건이 맞을시 실행
   }
```

- else if 문
 
```swift
if 조건 {
    조건이 맞을시 실행
    }
    
else if 조건 {
      if 조건 아니고, else if 조건 맞으면 실행 
      
}else{
    if 조건 아니고, else if 조건이 아닐시 실행
    }    
```

 - 예제 

```swift
x 가 3 이면 fizz x가 5 이면 buzz x 가 10 이면 fizzbuzz
var x = 3
if x == 3 {
    print("fizz")
    } else if x == 5 {
    print("buzz")
    } else if x == 10 {
    print("fizzbuzz")
}else{
    x = 0
    print(x)
    }  
```

---
## while 문법, 예제

- while 문법

```swift
while x < 10  {
   print(" x는 현재 \(x) 입니다 ")
   x += 1
}
```

- while 예제(구구단 만들기)

```swift
	x = 1
	y = 2
	
	while x < 10 and y < 10:	    
	    print(x*y)
	    x += 1
	    if x == 10:
	        x = 1
	        y += 1
```
---

## Refernece 

[Swift Programming Guide](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/TheBasics.html)