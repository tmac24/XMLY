//
//  AppDelegate.swift
//  XMLY
//
//  Created by ishop02 on 2020/6/12.
//  Copyright © 2020 happy. All rights reserved.
//

import UIKit
import ESTabBarController_swift
import SwiftMessages

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window : UIWindow?
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
                // 1.创建window
        let tabbar = self.setupTabBarStyle(delegate: self as? UITabBarControllerDelegate)

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        // 2.设置根控制器
        window?.rootViewController = tabbar
        // 3.显示window
        window?.makeKeyAndVisible()
        
        return true
    }
    
    /// 1.加载tabbar样式
    ///
    /// - Parameter delegate: 代理
    /// - Returns: ESTabBarController
    func setupTabBarStyle(delegate: UITabBarControllerDelegate?) -> ESTabBarController {
        let tabBarController = ESTabBarController()
        tabBarController.delegate = delegate
        tabBarController.title = "Irregularity"
        tabBarController.tabBar.shadowImage = UIImage(named: "transparent")
        tabBarController.shouldHijackHandler = {
            tabbarController, viewController, index in
            if index == 2 {
                return true
            }
            return false
        }
        tabBarController.didHijackHandler = {
            [weak tabBarController] tabbarController, viewController, index in
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                let warning = MessageView.viewFromNib(layout: .cardView)
                warning.configureTheme(.warning)
                warning.configureDropShadow()
                
//                let iconText = ["🤔", "😳", "🙄", "😶"].sm_random()!
                let iconText = "🤔"
                warning.configureContent(title: "Warning", body: "暂时没有此功能", iconText: iconText)
                warning.button?.isHidden = true
                var warningConfig = SwiftMessages.defaultConfig
                warningConfig.presentationContext = .window(windowLevel: UIWindow.Level.statusBar)
                SwiftMessages.show(config: warningConfig, view: warning)
                //                let vc = FMPlayController()
                //                tabBarController?.present(vc, animated: true, completion: nil)
            }
        }
        
        let home = FMHomeController()
        let listen = FMHomeController()
        let play = FMHomeController()
        let find = FMHomeController()
        let mine = FMHomeController()
        
        home.tabBarItem = ESTabBarItem.init(FMIrregularityBasicContentView(), title: "首页", image: UIImage(named: "home"), selectedImage: UIImage(named: "home_1"))
        listen.tabBarItem = ESTabBarItem.init(FMIrregularityBasicContentView(), title: "我听", image: UIImage(named: "find"), selectedImage: UIImage(named: "find_1"))
        play.tabBarItem = ESTabBarItem.init(FMIrregularityBasicContentView(), title: nil, image: UIImage(named: "tab_play"), selectedImage: UIImage(named: "tab_play"))
        find.tabBarItem = ESTabBarItem.init(FMIrregularityBasicContentView(), title: "发现", image: UIImage(named: "favor"), selectedImage: UIImage(named: "favor_1"))
        mine.tabBarItem = ESTabBarItem.init(FMIrregularityBasicContentView(), title: "我的", image: UIImage(named: "me"), selectedImage: UIImage(named: "me_1"))
        let homeNav = FMNavigationController.init(rootViewController: home)
        let listenNav = FMNavigationController.init(rootViewController: listen)
        let playNav = FMNavigationController.init(rootViewController: play)
        let findNav = FMNavigationController.init(rootViewController: find)
        let mineNav = FMNavigationController.init(rootViewController: mine)
        home.title = "首页"
        listen.title = "我听"
        play.title = "播放"
        find.title = "发现"
        mine.title = "我的"
        
        tabBarController.viewControllers = [homeNav, listenNav, playNav, findNav, mineNav]
        return tabBarController
    }

    


}

