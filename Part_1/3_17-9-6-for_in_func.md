# 17.9.5(수)
## For - in 문법, 예제, func 문법, 예제, 퀴즈
---

## for - in 문법, 예제
 
- 범위 연산자 

```swift
 1...10 : 1부터 10까지
 1..<10 : 1부터 9 까지
 1...x : x에 변수 올수 있고, 배열등도 올수 있음. 
 
 -> 처음, 끝 지정 숫자에 변수를 넣어도 가능
```
 
- for - in 문법 
 
```swift
 for element in 1...10 {
     실행될 기능 
  }
```
 
- 예제

```swift
 구구단 만들기
 for i in 1...9 {
     for j in 1...9 {
               print(i*j)
          }
}
```
 
---
 
## func 문법, 예제 

- func 문법 
 
```swift
 func functionName(x:Int, y:Int) -> String { 
 	reutnr String
 }
 
 func: 함수를 정의 하는 내장 명령어
 functionName : 함수 이름
 x:Int, y:Int: 매게변수, 각 변수별로 타입과 디폴트 값을 지정해줄수 있다. 
	 -> String : 반환 type을 정해놓을수 있음. 
```
 
--- 
 
## Quiz
 
- 윤년 구하기

```swift
func check(leapYear:Int) -> String{
    if leapYear % 4 == 0 && leapYear % 100 == 0 {
        return ("\(leapYear) 는 윤년 입니다.")
    }
    else if leapYear % 100 == 0 && !(leapYear % 400 == 0)
    {
        return ("\(leapYear) 는 윤년이 아닙니다.")
    }else {
        return ("\(leapYear) 는 윤년이 아닙니다.")
    }
}
print(check(leapYear:1200))

-> 100을 기준으로만 작동함! 
```

 
- 인풋값 각 자리수를 더하기

```swift
func addAllDigit(num:Int) -> Int {
    
    var num = num
    var returnValue: Int = 0
    
    while num >= 1 && num != 0 {
        returnValue = returnValue + number%10
        number = number/10
    }
    return returnValue
}

print(addAllDigit(num:123)) //6
print(addAllDigit(num:5792)) //23
- > 진법 나누기 방식으로 풀이함
- > input 값을 10으로 나눈 나머지값을 계산 더해가면서, input 값을 10으로 나누면서, 계산함.
```
 
- 별 그리기 
 
```swift
func drawStar(line:Int) {
    
    var str:String = ""
    var str1:String = " "
    var str2:String = ""
    
    for i in 1...line {
        str1 = " "
        str2 = ""
        
        for j in 1...(line+1 - i)  // 빈칸 {
            str1 = str1 + " "
        }
        
        for k in 1...(2*i-1) //별 {
            str2 = "*" + str2
        }
        str = str1 + str2
        print(str)
    }
}
print(drawStar(line: 3))
-> 문제풀때 몰랐던것이 "" + "a" = "a" 인것을 몰라서 해맸음. 
-> 위의 개념을 기반으로, 각 라인을 빈칸빈칸빈칸*** 형식으로 한줄씩 구현 해놓았음. 
```
---


  
