# 22_10.10 

---

## UIViewController, Segue  


---

## UIViewcontroller

![screen](/study/image/UIView.jpg)

> UIViewController Interface


- UIViewController는 모든 View의 관리, 이벤트 핸들링 UIViewController간의 전환등의 역활을 수행합니다
- 모든 UIViewController는 1개의 RootView를 필수적으로 가지고 있습니다. 
- 화면에 표시되는 모든 View는 RootView의 SubView로 존재합니다.
- Window : 제일먼저 이벤트를 받는건 하드웨어 -> os -> UIapplication -> window
-> window가 두개를 만들때가 잇음. 그때는 어떤 경우냐면, 사용하다가 전화가 올때..? 이럴떄는 window가 두개가 되어서, 전화오는 구간과, 원래 실행되어야 할 구간을 나누어서 설정 해서 보여주게 된다.
- 윈도우가 여러개 있을때 모두다 이벤트를 받을수 없음, `keywindow`라고 설정되어 있는 녀석만 이벤트를 받을수 있음.
- `window?.makeKeyAndVisible()` -> window 를 여러개 만들어 주는 코드입니다. 

> UIViewController 는 RootView를 무조건 가지고 있는데, 우리가 사실 UIViewController에서 view.addsubView 를 할때 `view`는 사실 RootView의 subView이다. 

---

## ViewController의 특징

#### - Child ViewController

예로 스플릿뷰를 들수 있는데, 하나의 ViewController 에서, 1개 이상의 View를 보여주게 하고 싶을때, 각각의 ViewController 로 정의 해도 되지만, 그렇게 하게 되면 코드가 엄청 나게 길어진다. 그런데, Child 를 사용하게 되면, SplitView에 보여지고자 하는 ViewController 들의 rootView를 넣어서 만들어 주게되면, 컨트롤해야하는 코드의 양이 상대적으로 많이 작아진다. 

#### - UserInteraction(사용자 인터렉션)

사용자의 모든 이벤트는 ViewController가 받아서 각 View에 Method와 Delegate 로 처리한다.

#### - Data Marshaling(중계자)

MVC 디자인 패턴, Resource Management(리소스 자원관리)

---

## ViewController 종류


**ViewController 는 쓰임세에 따라서 2개로 분류로 할수 있음**

|General View Controller(컨텐츠들)  | Container View Controller(컨텐츠들을 관리하기 위해서)|
| :--: | :--: |
| UIViewController | UINavigationController |
|	UITableViewController |	 UITabbarController |
| UICollectionViewController | 	UISpliViewcontroller |

---

## UIViewController Instance 생성

UIViewController의 Instance를 생성하는 방법에는 크게 2가지 가 있습다.

1. code로 

```swift
let cx:UIViewController = UIViewController()
```

2. xib파일이 Storyboard에 있을때, Storyboard를 통한 인스턴스 생성 방법

```swift
let storyboard = UIStoryboard(name: “Storyboard이름”, bundle: nil) let vc:UIViewController = storyboard.instantiateViewController(withIdentifier: “StoryboardID")

public init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) -> code 로 인스턴스를 생성 할때

* public init?(coder aDecoder: NSCoder) -> 스토리보드로 만들때 

사실 스토리보드를 통해서 인스턴스를 만들때 와 코드로 인스턴스를 만들때 두 인스턴스는 다르다. 이유는 인스턴스가 만들어지는 방식이 달라서 인데, code로는, 이미 컴파일이 끝난 이후에 컴파일 할때 가지고온 소스들을 가지고 인스턴스를 생성 하는것이고, 
 
스토리 보드를 통해서 만들때 사실 스토리 보드는 `XML`파일로 되어 있다. 이 XML파일로 되어있는 것을 Xcode가 알아 먹을수 있게 NSCoder 를 이용해서 in, decoding 을 통해서 변환후, 인스턴스로 만들어주게된다.
```
---

## Present Modally sample code 

- modally 하게 띄운다는 이야기는, a->b 를 띄운다고 하면, a의 rootView는 현재 살아 있는 상태임. 따라서 따라서 현재 a,b 둘다 띄워져 있는 상태입니다.

---

## 화면을 넘어 가는 방법

- 일반적인 방법

```swift
@IBAction func nextSecondView(_ sender: UIButton) {
		print("nextSecondView 버튼이 눌림")
		let main = SecondViewController()
		present(main, animated: true, completion: nil) 
    }
    
    > 일반적으로 present 해주는 방법이다. 인스턴스로 만들어놓은 ViewController로 이동 한다. 그 이동후, 다시 되돌아 오려면, 버튼을 만들고 
@IBAction func didtapExitButton(_ sender: UIButton) {
		dismiss(animated: true, completion: nil)     
    }

> disMiss 할떄와 pop 할때는 서로 다르다는것을 알고 있어야합니다!
```

- Segue 를 사용하는 방법: Segue를 사용하지 않고, 그냥 위의 방식으로 코드나, 그냥 버튼을 연결 하는 방식으로 구현해도 되지만, Segue는 스토리보드상에서 각 UIViewcontroller간의 관계도를 `시각적으로` 보면서 작업할수 있는 잇점이 있다.

![screen](/study/image/UIView1.jpg)

storyboard 상에서 버튼과, 뷰컨트롤러들을 각각 segue를 시켜줍니다. 이때 segue들도 각각의 인스턴스들인데, 이녀석들을 각각 컨트롤할수 있는 method가 있습니다.

```swift
// 세그웨이 액션을 실행 하기 위한 녀석..?
    // 하나의 뷰 컨트롤러에서 하나의 세그웨이만 만들수 있는것은 아님. 여러가지 세그웨이를 정의 할수 있음.
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        print("shouldPerformSegue")
        if identifier == "SecondSegue" {
            return false
        }else if identifier == "ThirdSegue" {
            return true
        }
        return false
    }
    // identifier의 따라서, 화면전환을 하느냐 안하느냐를 결정 해줄수 있음! 
    // 세그웨이가 호출이 되기 직전에 이녀석
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("perpare")
        performSegue(withIdentifier: "SecondSegue", sender: nil)
    }
```

Segue에 각각의 `identifier` 을 지정 할수 있는데, `identifier`로 Segue 각 각을 구분하고, 컨트롤 해줄수 있습니다.  
아래의 그림은 Segue가 실행되는 그림인데, 그 순서에 따라서 위의 method들이 불리면서, 실행이된다. 

![screen](/study/image/UIView2.jpg)

> SegueWay가 실행이 되었을때, shouldPerformSegue -> prepare 순으로 호출이 되는것을 확인 할수 있다.
---

## Unwind Segue(돌아가기)

Segue 를 통해서 화면전환이 된 이후, 버튼을 선택해서, `control` 버튼과 함께, `Exit`로 가져가서 Unwind 설정을 할수 있다.

> 이때 주의사항으로는 돌아가려고 하는 UIViewController 에 Unwind 함수를 만들어야 한다는 것이다! 

```swift
// 이녀석을 만들어주면, 뒤로 돌아가는 새그웨이를 설정해서 만들어 줄수 있다.
    @IBAction func reverse(_ sender: UIStoryboardSegue) {
        print("reverse")
    }
```

> Unwind 설정을하고 연결이 잘 되었는지 확인 해본다!
---

## Manual Segue(수동 Segue)

Segue의 indentifier를 통해서, 직접 접근하는 방식이다. 이때, 어떤 정보값도 같이 넘겨줄수 있다.

```swift
실행되는 이벤트에, 아래의 코드를 넣어서 확인해보자.
performSegue(withIdentifier: "해당Segue identifier", sender: nil)
```

---