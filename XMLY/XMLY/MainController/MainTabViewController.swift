//
//  MainTabViewController.swift
//  XMLY
//
//  Created by ishop02 on 2020/6/15.
//  Copyright © 2020 happy. All rights reserved.
//

import UIKit
import ESTabBarController_swift
import SwiftMessages

class MainTabViewController: ESTabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBarStyle()
    }
    
    func setupTabBarStyle() {
        
        self.delegate = delegate
        title = "Irregularity"
        tabBar.shadowImage = UIImage(named: "transparent")
        shouldHijackHandler = {
            tabbarController, viewController, index in
            if index == 2 {
                return true
            }
            return false
        }
        
        self.didHijackHandler = {
            tabbarController, viewController, index in
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                let warning = MessageView.viewFromNib(layout: .cardView)
                warning.configureTheme(.warning)
                warning.configureDropShadow()
                
                let iconText = ["🤔", "😳", "🙄", "😶"].sm_random()!
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
        let mine = FMMineController()
        
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
        
        self.viewControllers = [homeNav, listenNav, playNav, findNav, mineNav]
        
    }
    
}
