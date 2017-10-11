//
//  AppDelegate.swift
//  10.11
//
//  Created by MIN JUN JU on 2017. 10. 11..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // 시작을 모두 끊음. 그리고 여기서 시작함.
        // 원래는, self.view.fram... 했는데, 여기서는 application, delegate 만 실행이 되니까, view가 존재 하지 않음. 따라서 Screen 자체를 가지고 온다.
        
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        // ViewController instance 를 만들기
        // 1. ViewController Story를 통해서 가져와야해서, StroyBoard 를 먼저 만든다
        // ->
        
        /*let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let rootVC: ViewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController*/
        
        
            /*=================
             이렇게도 사용이 가능한데 느리다..?
             =================*/
        
        let rootVC = UIViewController()
        rootVC.view.backgroundColor = .red
        
        let firstVC = UINavigationController(rootViewController: rootVC)
        
        // UIViewController 를 사용할떄와, ViewController 의 차이 
        let secondVC = UIViewController()
        secondVC.view.backgroundColor = .green
        

        
        
        let tabbar = UITabBarController()
        
        // tabbar의 아이템들만 들어가 있음..
        tabbar.viewControllers = [firstVC, secondVC]
        
        
        // window 에 뷰 컨트롤러와
        window?.rootViewController = tabbar
        
        // window도 여러개가 있는데, 여러개가 잇는데, 그중에 main을 만들수 있음..
        window?.makeKeyAndVisible()
        
    
        
        
        
        
        
        
        
        
        
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

