//
//  AppDelegate.swift
//  XMLY
//
//  Created by ishop02 on 2020/6/12.
//  Copyright © 2020 happy. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window : UIWindow?
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
                // 1.创建window
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        // 2.设置根控制器
        window?.rootViewController = ViewController()
        // 3.显示window
        window?.makeKeyAndVisible()
        
        return true
    }

}

