//
//  AppDelegate.swift
//  testUIViewController
//
//  Created by MIN JUN JU on 2017. 10. 12..
//  Copyright © 2017년 MIN JUN JU. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
    /*
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
        window?.makeKeyAndVisible() */
        
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

