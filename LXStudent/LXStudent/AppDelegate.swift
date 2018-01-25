//
//  AppDelegate.swift
//  LXStudent
//
//  Created by 尚 on 2017/10/31.
//  Copyright © 2017年 cheng.shang. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    
    
    
    var autoSizeScaleX:CGFloat? // 宽度比
    var autoSizeScaleY:CGFloat? //高度比 tabbar navagation 都有
    var autoSizeScaleYN:CGFloat? //高度比 tabbar有
    var autoSizeScaleYT:CGFloat? //高度比 navagation有
    var autoSizeScaleYNONT:CGFloat? //高度比 tabbar navagation 都没有
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        self.window?.backgroundColor = UIColor.white
    
        self.showMainController()
        
        self.window?.makeKeyAndVisible()
        
        return true
    }
    
    func showMainController(){

        self.window?.rootViewController = LXLoginViewController()

    }
    
    /**
     *屏幕适配
     */
    func CodeAdaptation() {
        self.autoSizeScaleX = UIScreen.main.bounds.size.width/375
        self.autoSizeScaleY = (UIScreen.main.bounds.size.height-64-49)/(667-64-49)
        self.autoSizeScaleYN = (UIScreen.main.bounds.size.height-49)/(667-49)
        self.autoSizeScaleYT = (UIScreen.main.bounds.size.height-64)/(667-64)
        self.autoSizeScaleYNONT = (UIScreen.main.bounds.size.height)/667
        
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

