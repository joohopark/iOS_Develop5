# 35_17-10-24 

---

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
	
	계층 구조 
	|--cocoa touch 프레임 워크
	|----CF : core foundation
	
	프레임워크의 계층 구조 
	|--notificationCenter
	|----
	
	