
import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // 유저에게 noti를 사용할건데 허용할것인가 권한 요청 해주어야함
        requesetNotiFication()
        // badgeNumber 을 컨트롤 하는 함수.
        UIApplication.shared.applicationIconBadgeNumber = 200
        
        
        
        return true
    }
    
    private func requesetNotiFication() {
        // UN은 User Notification 의 약자
        UNUserNotificationCenter.current().requestAuthorization(options: [UNAuthorizationOptions.alert, .sound, .badge]) { (grant, error) in // 유저가 허용했느냐 안했느냐는 bool 값, error 값을 error 으로
            print("grant is \(grant), error is \(error)")
            
            //유저가 grant에 true 가 들어오면, 디바이스 토큰을 받기위해서, 서버에서 token 을 요청 해주어야함.
            
            DispatchQueue.main.async {
                // 아래의 녀석은 DisPatchQueue Main 에서 실행을 시켜주어야 함. 이유는 얼마전에 생긴 thread Checker 이라는 녀석이 체크해서 알려줌.
                UIApplication.shared.registerForRemoteNotifications()
            }
            // app 이 동작중일때 noti를 받기 위해서 사용함
            UNUserNotificationCenter.current().delegate = self
            
            // notiAction 은 사용자의 인터렉션을 받을수 있는 action임
            // 아래에 action button 을 넣어서 어떤 로직을 추가 해줄수 있음.
            let action = UNNotificationAction(identifier: "action",
                                              title: "확인",
                                              options: .destructive)
            let action2 = UNTextInputNotificationAction(identifier: "action2",
                                                        title: "텍스트전송",
                                                        options: UNNotificationActionOptions.foreground)
            let category = UNNotificationCategory(identifier: "category1",
                                                  actions: [action,action2],
                                                  intentIdentifiers: [],
                                                  options: [.customDismissAction])
            // 여러개의 category 들을 넣을수 있는데, 우리는 한가지만 카테고리 안에 넣어서 실습해봄.
            UNUserNotificationCenter.current().setNotificationCategories([category])
        }
    }
    
    // 디바이스 토큰을 보내주는 메소드
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        print(deviceToken)
        
        let tokenParts = deviceToken.map { (data) -> String in
            return String(format: "%02.2hhx", data)
        }
        let token = tokenParts.joined()
        print("token is \(token)")
    }
    
    // 토큰을 받지 못했을때, 아래의 메소드가 호출됨, 제대로 받지 못했을때, 어떤 액션을 취해줄것인지에 대한것을 이부분에서 적용함,
    //    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
    //        <#code#>
    //    }
}


// background 일때, 아닐때
extension AppDelegate: UNUserNotificationCenterDelegate {
    
    // app 이 동작중일때 noti를 받기 위해서 사용함
    // 동작되는 부분을 completionhandler 에 어떤 부분을 넣어서 보낼지 결정해서 보내줌
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .badge, .sound])
    }
    
    // app이 background 일때는
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        print("responser is \(response)")
    }
}

