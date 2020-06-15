//
//  MainTabViewController.swift
//  XMLY
//
//  Created by ishop02 on 2020/6/15.
//  Copyright © 2020 happy. All rights reserved.
//

import UIKit
import ESTabBarController_swift

class MainTabViewController: ESTabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBarStyle()
    }
    
    func setupTabBarStyle() {
        let tabBarController = ESTabBarController()
        
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
        
//        return tabBarController
    }
    
}
