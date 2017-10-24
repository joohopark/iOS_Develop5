# 35_17-10-24 

---

## MiniProject-Creat-LoginPage, Notification

#### - LogOut 기능 구현 

| 1.  | 2. | 3. |
| :------------: | :-----------: | :-------------------: |
| ![screen](/study/image/mini-project.jpg) | ![screen](/study/image/mini-project-1.jpg) | ![screen](/study/image/mini-project-2.jpg) |

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

#### - 해당 액션 코드에서, 엔트리 포인트 스토리보드로 가는 방법

```swift

(UIApplication.shared.delegate as?AppDelegate)?.window?.rootViewController = self.storyboard?.instantiateInitialViewController()

```

> 여러가지 방법이 있지만, 위에서는 AppDelegate에서 실행해서, rootView자체를 mainStoryboard의 엔트리 포인트로 지정해서 실행 해주었다..!
>
> LogOut 을 할때 주의 해야 할점이, present Modaly -> dismiss 를 사용해야 하고, Push -> pop 을 사용해서 다음뷰 -> 이전뷰로 올수 있다. 


---

## Notification

ViewController 와 ViewController 간의 데이터를 주고 받을때도 사용한다.
notification 은 2가지가 중요하다, noti가 오는지 관찰하는 자, noti를 보내는 자 두 부분이 중요하다.


노티피케이션 구조 :
	1. objectA: 노티피케이션 옵저빙 등록
	2. objectB: 어떤 액션을 실행 -> 노티피케이션 센터에 행동을 post함.
	3. objectB 액션 -> 노티피케이션 옵져빙을 등록한 객체에, 노티를 보냄.

	
푸쉬, 로컬 노티피케이션 : 외부(app이 동작 상태가 아닐때..?, 혹은 동작 상태일때, app에 어떤 '띵똥' 알람을 줄수 있다.)
그냥 노티피케이션 : 로컬(app 내부에서 ViewController간의 데이터를 주고 받을떄 유용하다.)
	
로컬, 푸쉬의 노티피케이션은 사실 현상은 똑같은데, app 내부에서냐, app 외부에서냐의 따라서 달라짐 
로컬 노티의 역활: 알람 설정시, 알람시간이 지났을때, 화면이 켜지게 하는것은 로컬 노티의 역활
	
OS 의 역활은 app을 키는것 까지만함. 그 이후에 app이 켜지면서 app 내부의 설계된 
	

#### - 계층 구조 

	|--cocoa touch 프레임 워크<br>
	|----CF : core foundation<br>
	
	프레임워크의 계층 구조 <br>
	|--notificationCenter <br>
	|----CFnotificationCenter <br>
	
	단으로 계층 구조가 나뉘어져 있다. <br>
	

#### - 노티키케이션 작동 순서

**app 내부에서 -> 에플 서버로 요청(핑) -> 각 app에게 푸쉬 노틸 -> os가 그 텍스만큼 받음 -> app 런치 -> 그 옵션안에 app 텍스트가 들어가 잇으면 -> app 내부에서 처리할수 있음.**

#### - Selector VS Clousre 

- Selector <br>
	- Selector 은 `method` 이다. 내부적으로 작동 방식을 보면, Selector를 사용할때 실행하고자 하는 함수의 `identifier`를 찾아가서 그 함수를 동작하는 방식으로 작동이 된다. <br>
	
- Closure
	- Closure 는 Closure 그 자체이다. closure의 실행조건(first Class) 에 부합 하는 조건으로 실행이 되어 진다.

> 결론적으로 Selector, Closure 모두 어떤 코드의 블럭단위(?) 인 함수인데, 사용되어 지는 형태는 비슷하지만, 내부적으로 동작하는 방식이 서로 완전히 다르다.
	
	
---

## Notification 예제 

#### - 실행전

| 1.  | 2. | 3. |
| :------------: | :-----------: | :-------------------: |
| ![screen](/study/image/mini-project-3.jpg) | ![screen](/study/image/mini-project-4.jpg) | ![screen](/study/image/mini-project-5.jpg) |

#### - 실행후

| 1.  | 2. | 
| :------------: | :-----------: | 
| ![screen](/study/image/mini-project-6.jpg) | ![screen](/study/image/mini-project-7.jpg) | 


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
    

// 버튼을 눌렀을때, 아래의 코드가 실행되게함..(viewdidLoad 에서 하려고했는데, 행동이 되는 시점들 명확하게 생각하고 코드를 작성하자)
    @IBAction func thirdBtnAction(_ sender: UIButton) {
        NotificationCenter.default.post(name: Notification.Name.init("TestNoti"), object: thirdTF.text, userInfo: ["noti":"info"])
    }
    

}


```

> `ThirdViewController` 에서 fextField 에 값을 넣고, 버튼을 누르면, `ViewController`, `SecondViewController`에 있는 레이블 text값으로 지정이 된다.
> 
> `Viewcontroller` `SecondViewController` 에 옵져빙 등록을 해놓고, `ThirdViewController`에 있는 버튼을 눌러서, 옵져빙이 등록되어 있는곳에 `noti` 를 보내고. 그 값을 핸들링해서, 원하는 값으로 변형해서 사용하는 방식으로 사용 되었다..!
> 

---

## Notification 응용 

- LogOut 부분을 Notification 적용 하여 사용해보자.

```swift


**LogOut Viewcontroller 부분**

func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        if indexPath[0] == 0 {
            
            if indexPath.row == 2 {
                let alertVC = UIAlertController(title: "Logout", message: "로그아웃 하시겠습니다?", preferredStyle: .alert)
                
                let okAction = UIAlertAction(title: "OK", style: .default, handler: { (X) in
                    
                    
                    UserDefaults.standard.set(false, forKey: "isLogined")
                    
                    // 이 동작이 실행되면 Navi에서 어떤 행동을 할수있도록 `post` 했다.
                    NotificationCenter.default.post(name: Notification.Name.init("logoutNoti"), object: nil, userInfo: ["noti":"info"])                    
                })
                
                let cancleAction = UIAlertAction(title: "Cancle", style: .default, handler: { (X) in
                    
                    print("cancle Logout")
                    
                })
                
                alertVC.addAction(okAction)
                alertVC.addAction(cancleAction)
                
                self.present(alertVC, animated: true, completion: nil)
                
                
            }
            
            
**Navi 부분**          

import UIKit

class MainNavi: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()


        // notification 을 추가해서, Logout 을 하게되면, 불러오게 하려고 하는것 같음
        
        NotificationCenter.default.addObserver(forName: Notification.Name.init("logoutNoti"), object: nil, queue: nil) { (noti) in
            print("login 페이지 띄우기")
             (UIApplication.shared.delegate as? AppDelegate)?.window?.rootViewController = self.storyboard?.instantiateInitialViewController()
        }
    }

    
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear")
        
        if !UserDefaults.standard.bool(forKey: "isLogined") {
            //showLoginPage()
            
            performSegue(withIdentifier: "LoginSegue", sender: nil)
            
            
        }
        
        
    }

	// 얘기치 못한 오류를 방지하기 위해서, class 의 인스턴스가 사라질때, 옵져빙에 등록해두었던것을 삭제 해준다. 
    deinit {
        // 인스턴스가 사라질때, 내가 가지고 있는 모든 옵져버의 add 된것을 없애라.
        NotificationCenter.default.removeObserver(self)
    }
    

}

```

> 옵져빙을 사용할때 주의 해야 하는것은, 옵져빙 등록은 `싱글턴 패턴` 이기때문에, 해당 ViewController의 인스턴스가 소멸되어도, 옵져빙 등록이 되어있다. 그래서 반드시, 인스턴스가 소멸될때, 옵져빙을 지워 주어야 한다. 기능상으로는 두번 불려서 오버라이드 하기 떄문에 큰 문제는 없지만.. 얘기치 못한 오류를 발생시킬 확률이 있으므로, 옵져빙을 등록한 인스턴스가 해제 될때, 옵져빙 등록도 지워주는게 좋다..!
> 




---
