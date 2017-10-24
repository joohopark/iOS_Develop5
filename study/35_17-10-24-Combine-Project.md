# 35_17-10-24 

---

## MiniProject-Creat-LoginPage

- LogOut 기능 구현 

| 1  | 2 | 3         |
| :------------ | :-----------: | -------------------: |
| ![screen](/study/image/mini-project.jpg) | ![screen](/study/image/mini-project-1.jpg) | ![screen](/study/image/mini-project-2.jpg) |



## 셋팅

선생님은, 각각의 cell에 type를 부여해서, customCell 에서 설정해줌.. 

나는 section 별로 cell에 조건을 주어서 설정했지만, 이렇게 하는것보다 customCell에서 각각 타입에 대해서, 각 row별로 값이 던져 주어도 나쁘지 않을거 같다는 생각이 든다.


- 각각 색션과 로우에 대한 타입값을 함수로 던져 주고, 

그 던져지는 type에 따라서 어떤 행동을 하겠다고 정의해주고 사용해주는게 조금더 정리하기 편하다고 얘기함..

**로그아웃 실행시**

알럿띄우고, ok, 
			cancle 유무에 따라서 dismiss, 로그아웃 변수 false 설정 해주어야함
			
			
			

```swift

appDelegate 에서 window 창을 통해서, 해당 스토리보드의 엔트리 포인트로 가는 방법

**appDelegate**부

class AppDelegate: UIResponder, UIApplicationDelegate {
var window: UIWindow?
    
    class var sharedInstance: AppDelegate? {
        return UIApplication.shared.delegate as? AppDelegate
    }

    func showLoginVC() {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        self.window?.rootViewController = mainStoryboard.instantiateInitialViewController()
    }
}

 -> 작성후, 해당 코드가 실행된곳을 실글턴으로 사용해서, 엔트리 포인트로 들어가는 방법을 사용함.
 AppDelegate.sharedInstance?.showLoginVC()



```

---

해당 액션 코드에서, 엔트리 포인트 스토리보드로 가는 방법

```swift

(UIApplication.shared.delegate as?AppDelegate)?.window?.rootViewController = self.storyboard?.instantiateInitialViewController()

```


---

## Notification

ViewController 와 ViewController 간의 데이터를 주고 받을때도 사용한다.

notification 은 2가지가 중요하다, noti가 오는지 관찰하는 자, noti를 보내는 자 두 부분이 중요하다.


노티피케이션 구조 :
	1. objectA: 노티피케이션 옵저빙 등록
	2. objectB: 어떤 액션을 실행 -> 노티피케이션 센터에 행동을 post함.
	3. objectB 액션 -> 노티피케이션 옵져빙을 등록한 객체에, 노티를 보냄.

	
	푸쉬, 로컬, : 외부(실제 메세지등..)
	그냥 노티 : 로컬
	
	로컬, 푸쉬의 노티피케이션은 사실 현상은 똑같은데, app 내부에서냐, app 외부에서냐의 따라서 달라짐 
	로컬 노티의 역활: 알람 설정시, 알람시간이 지났을때, 화면이 켜지게 하는것은 로컬 노티의 역활
	
	OS 의 역활은 app을 키는것 까지만함. 그 이후에 app이 켜지면서 app 내부의 설계된 
	
	계층 구조 
	|--cocoa touch 프레임 워크
	|----CF : core foundation
	
	프레임워크의 계층 구조 
	|--notificationCenter
	|----CFnotificationCenter
	
	단으로 계층 구조가 나뉘어져 있다.
	
	
	서버가 -> 에플 서버 요청 -> 각 app에게 푸쉬 노틸 -> os가 그 텍스만큼 받음 -> app 런치 -> 그 옵션안에 app 텍스트가 들어가 잇으면 -> app 내부에서 처리할수 있음.
	
	
---

notificationCenter에 등록 하는 시점이랑, 등록이 되어지는 곳의 인스턴스가 생성되고 재사용될때, 의도와 다르게 notificationCenter에 옵져빙하는 갯수가 여러개가 될수 있다.

반드시 옵져빙을 add 했을때, 인스턴스가 사라질때 remove 해주어야 한다.

가장 적절하게 해주는 방법은 인스턴스가 죽는 deinit 되는 부분에 옵져빙 remove 해주는게 좋음..

- selecetor는 mothod 이고, closure 는 일급 객체로 사용되는 방식이 다름. 결국에는 둘다 함수로서 사용하는데, 사용이 되어지는 방식이 다르다.

	- selecetor 는 mothod로 사용이 되어지고, 사용되는 방식이 mothod로, 사용하려고하는 함수의 idenetifier를 찾아가서 실행이 된다.

	- closure 는 closure 그 자체로, 실행되는 조건(first class) 으로 closure 자체로서 실행이 되는 방식이다..!

---

## notification


- 예제 

ViewContorller 가 3개 -> ViewController 2개는 observing 등록을 해놓고, 마지막 ViewController 에서, post를 하면 -> 옵져빙 등록이 되어져 있는 ViewController에 object를 보낸다. 

```swift

**MainViewController**


import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLB: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 옵져빙 등록 
        NotificationCenter.default.addObserver(forName: Notification.Name.init("TestNoti"), object: nil, queue: nil) { (noti) in
            
            // noti.object가 날라왔을때, 그 조건에 따라서 실행이됨.
            if let text = noti.object as? String {
                self.mainLB.text = text
            }
            // notification에 대한 실행
            
            print(noti.object)
            print(noti.userInfo)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

**SecondViewController**


import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var secondLB: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        NotificationCenter.default.addObserver(forName: Notification.Name.init("TestNoti"), object: nil, queue: nil) { (noti) in
            
            if let text = noti.object as? String {
                self.secondLB.text = text
            }
            // notification에 대한 실행
            
            print(noti.object)
            print(noti.userInfo)
        }
    }
        

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // 노티피케이션에 옵져빙 등록
        
        
        
    }
   

}


**ThirdViewController**



import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var thirdTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // 여기서 noti 를 post
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

// 버튼을 눌렀을때, 아래의 코드가 실행되게함..(viewdidLoad 에서 하려고했는데, 행동이 되는 시점들 명확하게 생각하고 코드를 작성하자
    @IBAction func thirdBtnAction(_ sender: UIButton) {
        NotificationCenter.default.post(name: Notification.Name.init("TestNoti"), object: thirdTF.text, userInfo: ["noti":"info"])
    }
    

}


```

noti 랑, delegate랑 같이 호출 되어서 사용되어 진다고 생각하면 좋을것 같다..!

--- 

## 코드 확장 