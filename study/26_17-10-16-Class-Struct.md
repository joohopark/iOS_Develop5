# 26_17-10-16

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


