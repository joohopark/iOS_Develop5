# 34_17-10-23

---

# Optional, AppLifeCycle, Do-Try-catch 문, NavigationViewController


---

## 지금까지 한것들 중에서, 조금 어려웠던 것들을 조금 되짚어 보고 시작 합니다.

- 옵셔널
	- if let
	- guard let
	
- property 
	- 저장
	- 연산
	- 프로퍼티
	
	
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

## init 의 사용, 시점 


```swift


    
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


## notification 

네비게이션 컨트롤러 위에 -> 네비게이션 컨트롤러를 띄워 놓고, dismiss 를 사용해서 왔다 갔다 하면서 구현 한다...?

1. storyboard reference 를 사용해서 segea로 이동하는것 해보기

2. appDelegate에서 navi 화면을 각각 나누어서 적용 해보기

3. MainNavi 에서 작성해서 해보기

---

## navigationViewController 연습하기

#### 1. storyboard 에서 instance 생성 + navigationController 사용해서 화면간 전환 하기

![screen](/study/image/Navi.jpg)

```swift

**MainNavi Class**

override func viewDidAppear(_ animated: Bool) {
        
        if !UserDefaults.standard.bool(forKey: "isLogined") {
            if let presentVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginNavi") {
                
                self.present(presentVC, animated: true, completion: nil)
                
            }


```

> NavigationController 를 두개를 놓고, 엔트리 포인트를, 새로운 `Navi` 라는 클레스를 만들어서, 상속시킨 NavagiationController 에 상속 시켜놓고, `StoryBoard Idintifier` 를 통해서, NavigationController 위에 또다른 NavigationController 를 쌓은 구조를 만들었다. 그 이유는, 로그인을 완성하면 pop을 시켜서, 엔트리포인트로 지정해놓은 Navigation을 사용하기 위해서이다..!
> 
> UserDefaults 는, 로그인 했을때, 자동로그인 처리를 하기 위해서만들어 놓은것입니다. 중요한건, 스토리보드를 통해서 인스턴스 생성 -> present 사용하는것 입니다. 
> 
> `LoginNavi` 라는 storyboard identifier 를 지정한 인스턴스를 띄워주게 처리했습니다.
> 
> 하지만 이 코드를 ViewdidAppear에서 사용하는것은 사실 좋지 않습니다. 이유는 navigation을 사용할때마다 저 코드가 불리기 떄문입니다. 조금더 말끔하게 처리하려면, appDelegate에서 windows 에서 처리하는 방법도 고민해보면 좋을것 같습니다. 
> 

#### 2. segue 의 idenfier 이용해서, NavigationViewContorller 위에 NavigationViewContorller


![screen](/study/image/Navi-1.jpg)

```swift

**MainNavi Class**

if !UserDefaults.standard.bool(forKey: "isLogined") {
            performSegue(withIdentifier: "toLoginSegue", sender: nil)
            
        }


```
> `segue` 의 identifier 로 이동하는 방식으로 실행했습니다.

#### 3. StoryBoard Reference 이용하기

| *  | * | 
| :------------ | :-----------: | 
| ![screen](/study/image/Navi-2.jpg) | ![screen](/study/image/Navi-3.jpg) | 

![screen](/study/image/Navi-4.jpg)

```swift

override func viewDidAppear(_ animated: Bool) {
        
        performSegue(withIdentifier: "otherStoryboard", sender: nil)

```

> 원리는 segue 를 통해서, storyboard reference 를 가리키면, segue를 통해서 다른 storyboard에 연결되어있는 view를 띄워주는 형식이다. 이때 주의 해주어야 할 사항들이있다.
> 
> Storyboard Reference 이용시 설정해주어야 하는것들로는, 
> 
> 1. Storyboard Referece 가 어떤 `StoryBoard` 인지 `StoryBoard Referece`에서 설정 해주어야 한다.
> 
> 2. 해당 StoryBoard의 NavigationViewController의 Class 를, `StoryBoard`의 이름으로 바꾸어 주어야한다. 
> 
> 3. 스토리보드의 시작점(엔트리포인트)을 지정 해주어야 한다.
> 

---

## Reference

[reference: app life cycle ](https://developer.apple.com/documentation/uikit/core_app/managing_your_app_s_life_cycle#2934064)