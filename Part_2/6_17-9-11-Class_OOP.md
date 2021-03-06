# 17.9.11(월)

---

## for-in, while, func 예제 문제, class, OOP   개념 간단한 설명 

---

##Quiz

- collatz 추측

```swift
func collatz(n:Int) -> Int {
    var n:Int = n
    var count:Int = 0
    while n > 1 //# n이 1보다 작아지거나, 1이되면 빠져나가서 값을 return 함. n이 1이 되는 경우는 n이 2일때, n이 1일때. {
        if count == 500 {
            n = -1
            break
        } else if n % 2 == 0 {
            n /= 2
            count += 1
        } else if n % 2 != 0 {
            n = (n*3) + 1
            count += 1
        } else if count == 100 {
            n = -1
            break
        } else if n == 0 {
            n = 1
        }
    }
    return n     
}
print(collatz(n:123286325789578297))
```

- harhad 수

```swift
func harhad(_ n:Int) -> Bool {
    var number:Int = n
    var list:[Int] = []
    
    while number >= 1 && number != 0 {
        list.insert(number % 10, at: 0)
        number /= 10
    }
    // list 에 각 자리수들이 들어있음
    
    var value:Int = 0
    var returnBool:Bool = false
    for i in list {
        value += i
    }
    // value에 각 자리수값의 합 저장
    
    
    if n % value == 0 {
        returnBool = true
        return returnBool
    }else{ 
        returnBool = false
        return returnBool
    }
    return returnBool
}
print(harhad(13))
```
---


## Class 

- 구조

 
```swift
class iamCreator  // class: 명령, iamCreator: class 이름{
 		var man:Int = 1  
 		var girl:Int = 0
 		var land:Int = 0
 		var air:Int = 0
 		
 		// 변수 man, girl 은 프로퍼티 라고 swift에서는 읽는다.
 		프로퍼티 : 객체가 가지는 속성(여기서 class 도 속성이다.)
 		
 		init(man:Int, girl)   {
 		self.man = man
 		self.girl = girl
 		}
 		// 생성자(initialization) : 스위프트 에서는 init 이외의 class member 에 초기값을 지정해주어야 오류가 발생하지않음. 
 		}
```
---

## OOP 

#### - 개념 <br>

OOP(Object-Oriented Programming)는 프로그래밍을 조금더 실제 세상에 가깝게, 구현하기 위한 고민에서 출발한다. 

![screen](/study/image/OOP.jpg)

#### 1. 추상화(Abstraction) <br>

가령 태양을 프로그래밍해서 만들자고 생각해보자, 그리고 만들었다고 가정하자. 그런데 내가 만든 태양이 실제 태양이랑 같은가? 태양이랑 비슷 하겠지만, 같지는 않다. 하지만 나는 내가 만든 저 코드들이 태양인 것을 안다. 이렇듯 추상화는 '모델링' 이다. 엄밀하게 태양은 아니지만 '태양 처럼' 모델링하고 생각하는 과정을 추상화 한다고 한다.

#### 2. 캡슐화(Encapsulation) <br> 

 변수들 과, 메서드(함수) 들을 클레스로 묶는것(the bundling of data with methods), 정보 은닉을 포함한다. 캡슐화의 목적은 class 라는 type 속에 있는 것들(변수, 함수) 들의 외부에서 접근해서 값을 변경하는것을 보호하기 위해서이다.

#### 3. 은닉화(information hiding) <br> 

변수와, 함수에 직접적으로 접근하는것을 제한하는 역활을 한다. OOP적인 생각으로는 다이렉트로 변수에 직접적으로 접근하는것을 별로 좋아하지 않음. 변수에 접근하려면 함수(객체) 를 통해서 접근하는것을 암묵적(?) 으로 선호한다. 하지만, 아직 배우지는 않았지만 code로서 접근을 막는 방법도 다른언어에서는 있음.

#### 4. 상속성(Inheritance) <br>

상속을 사용하게된 이유는. 클레스 이전의 프로그래밍 기법에서는 코드 재활용이 불가능하지는 않았다. 예전에도 라이브러리 같은것들을 긁어서 사용이 가능했는데, 이 라이브러리라는게 수정하게 되면 소스 자체를 모두 수정해야 된다는 단점을 가지고 있었다. 이것은 라이브러리 버전에 따라서 그 라이브러리를 사용하는 프로그램이 동작을 할수도 있고, 안할수도 있다는 이야기이다.
 
> '상속' 의 도입 객체 지향 프로그램에서는 이 문제를 해결하기 위해 "상속"을 도입 했다. "포용성"으로 이전의 라이브러리보다 더 논리적이고 체계적으로 기능과 데이터를 계층적으로 분류해서 사용의 편의성을 도모하면서, 상속을 사용해 부모 클래스의 특성과 기능을 그대로 이어받고 기능의 일부분을 변경해야 할 경우 상속 받은 자식 클래스에서 그 기능만을 다시 정의하여 수정하게 하였다. 이러한 작업을 "덮어쓰기(재정의:Override)"라고 한다.

#### 5. 다형성(Polymorphism) <br>

```python

OOP 에서 추상화 다음으로 가장 중요한 개념이다. 의미 그대로 다양한 성질(행동)을 하는데

      from abc import *. 
class Animal(metaclass = ABCMeta):
    @abstractmethod
    def say(self):
        pass
class Dog(Animal):
    def say(self):
        print('BOW-WOW')
class Cat(Animal):
    def say(self):
        print('MEW MEW')
class Duck(Animal):
    def say(self):
        print('QUACK QUACK')
       
      # swift 다형성을 정확히 이해하지 못해서 python 으로 작성했다.
      # 보면, Animal 이라는 클레스를 상속받으면서, 다른 클레스 명으로 작성되어져 있음. 최상위 클레스는 Animal 이면서, 다른 이름의 클레스들이 똑같은 구조를 가지고있음. 맨 처음 정의해준 구조를 벗어나게 작성을 하면 오류가 나면서, 사전에 code 작성시에 실수를 미연에 방지해줄수 있다..
```      