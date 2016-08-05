//
//  AppDelegate.swift
//  WeTalk
//
//  Created by heyong on 16/8/1.
//  Copyright © 2016年 heyong. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, RCIMUserInfoDataSource {

    var window: UIWindow?
    
    func getUserInfoWithUserId(userId: String!, completion: ((RCUserInfo!) -> Void)!) {
        let userInfo = RCUserInfo()
        userInfo.userId = userId
        
        switch userId {
        case "neohe":
            userInfo.name = "Neo"
            userInfo.portraitUri = "http://s.cn.bing.net/th?id=OJ.JX7nPQ7fl5mJjg&w=160&h=215&c=8&pid=MSNJVFeeds"
        default:
            print("nobody!")
        }
        
        return completion(userInfo)
    }

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        // 获取保存的 token
        // let tokenCache = NSUserDefaults.standardUserDefaults().objectForKey("kDeviceToken") as? String
        
        // 初始化 appKey
        RCIM.sharedRCIM().initWithAppKey("6tnym1brnnyw7")
        
        // 设置用户信息提供者为自己 AppDelegate
        RCIM.sharedRCIM().userInfoDataSource = self
        
        // 用 token 测试连接
        RCIM.sharedRCIM().connectWithToken("izLOwqJUsMJjr0ZTgc39cFdhuKXa9Cy0nmSKu+xhhDlHkpmsM1f/VboZ+Xef8wDF2DslI2+c+9Q3zQBoraGFSw==", success: { (_) in
            print("Connect Succeed")
            
            let currentUser = RCUserInfo(userId: "neohe", name: "Neo", portrait: nil)
            RCIMClient.sharedRCIMClient().currentUserInfo = currentUser
            
            }, error: { (_) in
                print("Connect Failed")
            }) { 
                print("Token Error")
        }
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
}
