# 23_17.10.11(수)

---


## UINavigationController

---

## UIViewController 

#### - window 창부터 UIViewController 새로 만들기. 

```swift
**AppDelegate** 부분!
import UIKit
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
// window = UIWindow(frame: UIScreen.main.bounds) 
   -> window 를 바로 만들면 에러가 나옴. 이유는 현재 Mainstoryboard 끊어놓은 상태임. 그래서 스토리보드 자체를 통해서 UIViewController 를 만들고, 그것을 window에 입혀주어서 실행시켜야 한다 !
   
       // ViewController instance 만들기
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let rootVC: ViewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        rootVC.view.backgroundColor = .red
        // window 의 프레임 사이즈는, Screen 사이즈로 한다! 
        window = UIWindow(frame: UIScreen.main.bounds)
        // window 의 rootView를 위에서 storyboard로 생성한 ViewContorller를 사용했다.
        window?.rootViewController = rootVC
        // window도 여러개가 있는데, 여러개가 잇는데, 그중에 main을 만들수 있음..
        window?.makeKeyAndVisible()
        return true
    }
```

![screen](/study/image/UIViewController-1.jpg)

> 현재 view의 계층 구조 

---

## UINavigationController

#### - code 로 생성 하기

```swift
import UIKit
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // 1. 윈도우 생성
        window = UIWindow(frame: UIScreen.main.bounds)
        // 2. 스토리 보드로 UIViewController instance 생성후 -> rootViewController 생성
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let rootVC: ViewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        // rootVC backgroundColor 작성
        rootVC.view.backgroundColor = .red
        
        // navigationcontroller의 rootview 는 window 위의 rootviewdlek.
        let firstVC = UINavigationController(rootViewController: rootVC)
        
        // UIViewController 를 사용할떄와, ViewController 의 차이
        let secondVC = UIViewController()
        secondVC.view.backgroundColor = .green
        
        // tabbar 인스턴스 생성
        let tabbar = UITabBarController()
        
        // tabbar의 아이템들만 들어가 있음..
        tabbar.viewControllers = [firstVC, secondVC]
        
        // window 에 뷰 컨트롤러가 tabbar 가 된다.
        window?.rootViewController = tabbar
        
        // window도 여러개가 있는데, 여러개가 잇는데, 그중에 main을 만들수 있음..
        window?.makeKeyAndVisible()
        return true
    }
```	

![screen](/study/image/UIViewController-2.jpg)

> 현재계층 구조를 보면, window -> tapbar -> navigation .. 순으로 되어있다.. navi가 제일 아래 일것 같지만, 사실 tapbar 가 더 아래의 계층 구조를 가지게 된다! 

| ![screen](/study/image/UIViewController-3.jpg) | ![screen](/study/image/UIViewController-4.jpg) |

> 아래의 tapbar 선택시 보이는 메뉴 !
---

## UINavigationController

#### - storyboard 로 생성하기 

storyboard 에서 navi 생성 방법은 `storyboard 선택` -> `Editor` -> `Embed in` -> `navigation controller` 선택해서, navi 를 지정 해준다.

> 이렇게 지정하게 되면, 애초에는 UIViewController 가 `시작점(window->UIViewController`) 이 었지만, UINavigationController 가 동작 하려면, 계층구조가 UIViewContorller 보다 window 에 더 가까워야 한다. 그래서 시작점이 NavigationController 가 된다. 


![screen](/study/image/UIViewController-5.jpg)

> 현재의 계층 구조 

1. 뷰 컨트롤러를 3개를 만들어서, First -> Second -> Third 순으로 이동 가능하게 만든다.

2. 마지막 Third Viewcontroller 에서는 home 으로 돌아오는 기능을 추가한다!


- 첫번째 ViewController 부분

```swift
import UIKit
class ViewController: UIViewController {
    var nextBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //현재 navagitionContoller 의 title 설정함.
        self.navigationItem.title = "first"
        // navigationController의 LargeTitle 설정 하는 방법
        self.navigationController?.navigationBar.prefersLargeTitles = true    
        
        //self.navigationItem.rightBarButtonItem
        // 버튼 생성
        nextBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        nextBtn.setTitle("next >", for: .normal)
        nextBtn.setTitleColor(.black, for: .normal)
        nextBtn.setTitle("next>", for: .highlighted)
        nextBtn.setTitleColor(.blue, for: .highlighted)
        
        // 버튼의 기능을, SecondViewController 로 이동하게 연결 시켰다.
        nextBtn.addTarget(self, action: #selector(nextBtnHandler(_:)), for: .touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: nextBtn)
    }
    
    @objc func nextBtnHandler(_ sender: UIButton) {
        print("nextBtnHandler")    
        goToNextVC()
    }
    
    private func goToNextVC() {
        print("gotoNextVC")
        //Storyboard의 id값을 가지고 ViewController 를 불러냈다.
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        
        // navigation 은 stack 방식으로 동작이됨. push, pop 을 이용해서 ViewController를 Push, pop 을 하면서, 원하는 값을 호출 해온다
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}
```

#### - 두번째 ViewController 부분

```swift
import UIKit
class SecondViewController: UIViewController {
    var nextBtn: UIButton!
    var backBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Second"    
        
        // 버튼 생성
        nextBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        nextBtn.setTitle("next >", for: .normal)
        nextBtn.setTitleColor(.black, for: .normal)        
        nextBtn.setTitle("next>", for: .highlighted)
        nextBtn.setTitleColor(.blue, for: .highlighted)
        
        // 버튼의 기능을, SecondViewController 로 이동하게 연결 시켰다.
        nextBtn.addTarget(self, action: #selector(nextBtnHandler(_:)), for: .touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: nextBtn)
        
        // backBtn 생성
        backBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        backBtn.setTitle("< back ", for: .normal)
        backBtn.setTitleColor(.black, for: .normal)
        backBtn.setTitle("< back", for: .highlighted)
        backBtn.setTitleColor(.blue, for: .highlighted)
        
        // 버튼의 기능을, SecondViewController 로 이동하게 연결 시켰다.
        backBtn.addTarget(self, action: #selector(backBtnHandler(_:)), for: .touchUpInside)
        
        // 왼쪽 버튼 올리기.
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backBtn)
    }
    
    @objc func nextBtnHandler(_ sender: UIButton) {   
        goToNextVC()
    }
    
    private func goToNextVC() {
        //Storyboard의 id값을 가지고 ViewController 를 불러냈다.
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "ThirdViewController") as! ThirdViewController
        
        // navigation 은 stack 방식으로 동작이됨. push, pop 을 이용해서 ViewController를 Push, pop 을 하면서, 원하는 값을 호출 해온다
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc func backBtnHandler(_ sender: UIButton) {   
        goToBackVC()
    }
    
    private func goToBackVC() {   
        //let backVC = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
        // navigation 은 stack 방식으로 동작이됨. push, pop 을 이용해서 ViewController를 Push, pop 을 하면서, 원하는 값을 호출 해온다
        self.navigationController?.popViewController(animated: true)
    }
}
```

#### - 세번째 viewController 부분

```swift
import UIKit
class ThirdViewController: UIViewController {
    var backBtn: UIButton!
    var homeBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Third"
        backBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        backBtn.setTitle("< back ", for: .normal)
        backBtn.setTitleColor(.black, for: .normal)
        backBtn.setTitle("< back", for: .highlighted)
        backBtn.setTitleColor(.blue, for: .highlighted)
        
        // 버튼의 기능을, SecondViewController 로 이동하게 연결 시켰다.
        backBtn.addTarget(self, action: #selector(backBtnHandler(_:)), for: .touchUpInside)
                
        homeBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        homeBtn.setTitle("Home", for: .normal)
        homeBtn.setTitleColor(.black, for: .normal)
        homeBtn.setTitle("Home", for: .highlighted)
        homeBtn.setTitleColor(.blue, for: .highlighted)
        
        // 버튼의 기능을, SecondViewController 로 이동하게 연결 시켰다.
        homeBtn.addTarget(self, action: #selector(homeBtnHandler(_:)), for: .touchUpInside)
        
        // 왼쪽 버튼 올리기.
        self.navigationItem.leftBarButtonItems = [UIBarButtonItem(customView: backBtn),UIBarButtonItem(customView: homeBtn)]
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func backBtnHandler(_ sender: UIButton) {
        goToBackVC()
    }
    
    private func goToBackVC() {
        //let backVC = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
        // navigation 은 stack 방식으로 동작이됨. push, pop 을 이용해서 ViewController를 Push, pop 을 하면서, 원하는 값을 호출 해온다
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func homeBtnHandler(_ sender: UIButton) {    
        goToHomeVC()
    }
    
    private func goToHomeVC() {
        
        let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
        // navigation 은 stack 방식으로 동작이됨. push, pop 을 이용해서 ViewController를 Push, pop 을 하면서, 원하는 값을 호출 해온다
        
        
        self.navigationController?.popToRootViewController(animated: true)
    }
}
```

![screen](/study/image/UIViewController-6.jpg)

> 계층 구조를 확인하자! 
>
> 각 First,Second,third ViewController 의 storyboard identifier 는, 각 class 의 이름으로 변환해서, 식별해준다.

---

## NavigationController

- UINavigationController : 가장 많이 쓰인다. 
- UITabbarController : death 가 같거나, 완전이 다른 경우에 사용한다
	- 대게 커스텀해서 사용하는데, 커스텀하기가 생각보다 까다롭다,
- UISplitViewController : child View를 사용하여 구현한다.
- 스토리보드를 이용해서 인스턴스를 만들떄는, NSCoder라는것으로 인해서 인스턴스를 만듭니다
- 스토리보드로 인스턴스를 만들때와, 그냥 코드로 인스턴스를 생성할때 둘은 엄밀하게 다른 녀석들이다.
- TopViewcontroller : stack 의 최상단 <br>
- VisibleViewController : 화면의 최상단.
- 기본적으로 navigation의 toolbar는 히든이다.
- 네비게이션 바 영역에서 아이템들이 화면이 전환될 떄 마다 바뀐다.. 근데 사실은 그렇게 동작이 되는게 아니라, `네비게이션 바` 영역을 지정하고, 거기에 들어가는 값들은 ViewController 에서 각 각 컨트롤 해준다.
- 사실 `main interface`의 `메인 storyboard 에서 windows와, UI를` 불러와서 load 하는데, `tapbar` 는 rootView를 가지지 않아도 된다. 왜냐하면 각각의 viewController가 rootView를 가지고 있기 떄문에, `NavigationController`는, `NavigationController`의 역활만 해주기 때문이다.
- `NavigationController`는 `stack` 방식으로 동작하기 때문에 자료를 Pop 이나 Push 를 한다. 근데 이게 StackFrema에 남아 있는게 아니라, pop 될때 사라진다고 한다. 불러올떄는, 인스턴스 자체를 만들어서 불러오고, 뒤로갈때는, 그냥 날려버리는것 같다.


---
