# 17.9.15(금)

---
## IOS application life cycle, MVC(Model View Controller)

---

## Application Life Cycle 


<p align="center">

![screen](/study/image/app-launch.png)

</p>

Most state transitions are accompanied by a corresponding call to the methods of your app delegate object. These methods are your chance to respond to state changes in an appropriate way. These methods are listed below, along with a summary of how you might use them.

`application:willFinishLaunchingWithOptions:`—This method is your app’s first chance to execute code at launch time. <br>

> app이 Main Loop 에서 첫번째로 호출됩니다.

`application:didFinishLaunchingWithOptions:`—This method allows you to perform any final initialization before your app is displayed to the user.

> 유저에게 보여지기 직전에 호출됩니다.

`applicationDidBecomeActive:`—Lets your app know that it is about to become the foreground app. Use this method for any last minute preparation.

> app이 foreground 에서 유저에게 보여지기 직전에 호출 됩니다. `didFinishLaunchingWithOptions` 보다 이후 시점에 호출됩니다.

`applicationWillResignActive:`—Lets you know that your app is transitioning away from being the foreground app. Use this method to put your app into a quiescent state.

> foreground 다음 Loop 에서 호출됩니다.

`applicationDidEnterBackground:`—Lets you know that your app is now running in the background and may be suspended at any time.

> app이 종료되고, Background 상태에 돌입했을때, 호출됩니다.

`applicationWillEnterForeground:`—Lets you know that your app is moving out of the background and back into the foreground, but that it is not yet active.

> Background -> Foreground 가 될때 호출 됩니다.

`applicationWillTerminate:`—Lets you know that your app is being terminated. This method is not called if your app is suspended.

> 예기치 않게 app 이 죽거나, 종료 되었을때 호출됩니다. 하지만, 호출이 보장되지는 않습니다.

---

## Application Life Cycle 
- Execution States for Apps <br>
	- Not Running : 실행되지 않았거나, 시스템에 의해 종료된 상태
	- Inactive : 실행 중이지만 이벤트를 받고있지 않은 상태. 예를들어, 앱 실행 중 미 리알림 또는 일정 얼럿이 화면에 덮여서 앱이 실질적으로 이벤트를 받지 못하는 상태 등을 뜻합니다.
	- Active : 어플리케이션이 실질적으로 활동하고 있는 상태.
	- Background : 백그라운드 상태에서 실질적인 동작을 하고 있는 상태. 예를들어 백그라운드에서 음악을 실행 하거나, 걸어온 길을 트래킹 하는 등의 동작을 뜻합 니다.
	- Suspended : 백그라운드 상태에서 활동을 멈춘 상태. 빠른 재실행을 위하여 메 모리에 적재된 상태이지만 실질적으로 동작하고 있지는 않습니다. 메모리가 부 족할 때 비로소 시스템이 강제종료하게 됩니다.

---

## Call to the methods of your app delegate object

대부분의 상태변화를 app delegate 객체에 호출되는 메소드를 오버라이드하여 알아챌 수 있습니다.
- application:willFinishLaunchingWithOptions: 어플리케이션이 최초 실행될 때 호출되는 메소드
- application:didFinishLaunchingWithOptions: 어플리케이션이 실행된 직후 사용자의 화면에 보여지기 직전에 호출.
- applicationDidBecomeActive: 어플리케이션이 Active 상태로 전환된 직후 호출.
- applicationWillResignActive: 어플리케이션이 Inactive 상태로 전환되기 직전 호출
- applicationDidEnterBackground: 어플리케이션이 백그라운드 상태로 전환된 직후 호출.
- applicationWillEnterForeground: 어플리케이션이 Active 상태가 되기 직전에, 화면에 보여지기 직전의 시점에 호출.
- applicationWillTerminate: 어플리케이션이 종료되기 직전에 호출.
 		
> 눈으로 확인을 한번 해보자!
---

## MVC 패턴

IOS를 개발하는데 실제로 굉장히 다양한 architectural 패턴들이 존재합니다. 패턴 종류만해도, MVC, MVP, MVC-N, MVVM, VIPER 등등 그 이름을 기억하기도 쉽지 않습니다. 그러나 이 모든 architectural 패턴들은 `프로그램의 유지보수를 쉽게 그리고 단위 테스트를 할 수 있게` 라는 공통된 목표를 가집니다. 각각의 패턴들은 장단점이 있기에 어떤 패턴이 가장 좋다고 하기는 힘듭니다.

<p align="center">

![screen](/study/image/MVC.png)

</p>

<https://medium.com/ios-development-with-swift/mvc-패턴-in-ios-7751911f8ca8>

---

## Reference 
[app life cycle Documents](https://developer.apple.com/library/content/documentation/iPhone/Conceptual/iPhoneOSProgrammingGuide/TheAppLifeCycle/TheAppLifeCycle.html#//apple_ref/doc/uid/TP40007072-CH2-SW1) <br>
[MVC Documents](https://developer.apple.com/library/content/documentation/General/Conceptual/DevPedia-CocoaCore/MVC.html) <br>
[reference: app life cycle](https://developer.apple.com/documentation/uikit/core_app/managing_your_app_s_life_cycle#2934064) <br>
[MVC 패턴설계로 인해서, 어떻게 스파게티 코드를 피하는지에 대한 설명](https://www.youtube.com/watch?v=YrOiuIjLp9k&list=PLAwxTw4SYaPkGKjpeiLWz8ydvFEkmRkBn&index=14)