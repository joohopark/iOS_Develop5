# 34_17-10-23

---


## 10.23 필기 

스위프트에만 있는 것 중 특징 적인것은

- 옵셔널
	- if let
	- guard let
	
- property 
	- 저장
	- 연산
	- 프로퍼티
	
	
	
app이 런치 되면 
->  Life Cycle
-> application UI 
-> appDelegate

view의 입장에서는 awikefromXIB 
viewController의 최종은 viewdidload?

  -> 무슨말이지
  
 
UIKit 은 항상 하나의 5가지중 한가지의 상태가 됨 

[reference: app life cycle ](https://developer.apple.com/documentation/uikit/core_app/managing_your_app_s_life_cycle#2934064)

view -> VIewcontoller 에게 어떤 행동을 주는? Tagetting
viewController 가 할일은 view가 대신하게 해주는 Delegate



그러면 notification은?

VC -> notification Center 을 보내면 -> 모든 VC, VC 들에게 보냄. 
notification 은 VC 와 VC 간의 데이터를 전달하면서 사용할수 있음.

serect, closure 를 사용해서 파라미터로 던져준다....?
셀렉터라는 방식을 -> 클로져 방식으로 변환하고 있음.. 셀렉터는 objective-C의 유산같은 녀석이다...?



*애자일, 스크럼, 스프린트 -> 이거 한번 다시찾아서 정리한번 해보자*


- 옵셔널

옵셔널 체이닝 

var a: Int?

var b: Int = a ?? 0

init 하는 시점에서는 프로퍼티 옵져빙이 실행이 되지 않음..
	-> 이유는, 옵져빙이 초기화 시점에서 등록이 아직 되지 않아서 실행이 되지 않는다..라고 생각해볼수 있다.
	
	command + option -> 화면 접힘
	
	
---

스토리 보드를 통해서 인스턴스를 만들때와, 그냥 UI를 통해서 만드는것과, 


```swift

override func awakeFromNib() {
        <#code#>
    }
    
 이 호출되고 난 이후에, ViewDidLoad가 호출된다. 코드로 만드는것과, 스토리보드로 만드는것의 시점 차이가 명확하다.
 
 
 
 required init?(coder aDecoder: NSCoder) {
        <#code#>
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        <#code#>
    }
    
    override func awakeFromNib() {
        <#code#>
    }

```

각각의 init 시점, 사용 해야하는고 명확하게 찾아서 정리 해놓자.


---


## 예외처리

1. 에러 타입 만들기
-> 프로토콜을 체텍해서 enum 으로 만든다..

2. 에러전달 함수를 만들때 `throws` 를 사용할수 있다.



```swift

1. enum 의 Error 타입을 정의한다
 
enum NumberCheckType:Error {
        case negaTiveNum
        case biggerNumb
        case nonNum
        case noData
    }


2. 오류를 던져줄 함수를 만든다 

func isSmallNum(_ baseNum: Int,_ targetNum: Int?) throws -> Int {
        
        guard let compareNum = targetNum else {
            throw NumberCheckType.noData
        }
        
        if baseNum < 0 || compareNum < 0 {
            throw NumberCheckType.negaTiveNum
        }
        
        if compareNum > baseNum {
            throw NumberCheckType.biggerNumb
        }

        return compareNum


    }


3. 함수로 던져진 오류가 잘 작동하는지 확인한다.

do {
            // let num을 사용해서 바인딩해줌..
            // do, try, catch 조금더 연습해서 정리 해놓자
            var data: Int?
            let num =  try isSmallNum(0, data)
        }catch NumberCheckType.noData {
            
            print("taget에 값을 넣어주세요")
        } catch NumberCheckType.negaTiveNum {
            print(" 타켓 숫자를 더 적게 입력해주세요")
        } catch NumberCheckType.nonNum {
            print("데이터값이 없다?")
        } catch NumberCheckType.biggerNumb {
            print("값이 크다")
        }catch
        {
            print("설마 다른 값이 있겠어?")
        }
    

```

do-try-catch 문이 동작되는 것을 생각 해보면
`try` 한 값이 `throw`를 통해서 `error` 를 던지면 `catch`에서 잡는다고 생각하면 될것 같다. 

`try` 를 실행했는데 무조건 catch로 가는이유는, 
`try`문을 옵셔널 값으로 바꾸어서 사용할수 있는데, 사용상 맥락으로 보면 옵셔널 체이닝이라는 다르다. `try` 자체가, 에러가 발생하는것의 유무에따라서 값이 들어가고 안들어가고 를 판단할수 있음... app이 crush에 대한 방어막으로 사용할수 있을것 같다는 생각이 든다...!

잘 사용하면 guard let 만큼이나 강력하게 사용할수 있다.

---


## 

