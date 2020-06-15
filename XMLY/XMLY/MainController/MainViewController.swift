//
//  MainViewController.swift
//  WB_swift
//
//  Created by ishop02 on 2020/5/22.
//  Copyright © 2020 happy. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        //iOS7以后只需要设置tintColor, 那么图片和文字都会按照tintColor渲染
        tabBar.tintColor = UIColor.orange
        
        addChildViewControllers()
        
        class Person : NSObject {
            var name : String? {
                // 可以给newValue自定义名称
                willSet (new){ // 属性即将改变,还未改变时会调用的方法
                    // 在该方法中有一个默认的系统属性newValue,用于存储新值
                    print(name as Any)
                    print("sfa\(new!)")
                }
                // 可以给oldValue自定义名称
                didSet (old) { // 属性值已经改变了,会调用的方法
                    // 在该方法中有一个默认的系统属性oldValue,用于存储旧值
                    print(name!)
                    print(old as Any)
                }
            }
            var age : Int = 0
            var height : Double = 0.0
        }

//        let p : Person = Person()

        // 在赋值时,监听该属性的改变
        // 在OC中是通过重写set方法
        // 在swift中,可以给属性添加监听器
//        p.name = "why"

        //p.name = "yz"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tabBar.addSubview(composeButton)
        
        let rect = composeButton.frame
        let width = tabBar.bounds.width/CGFloat(children.count)
        composeButton.frame = CGRect(x: 2*width, y: 0, width: width, height: rect.height)
    }
    
    // 添加所有子控制器
    func addChildViewControllers()
    {
        addChildVC(childVc: HomeVC(),title: "首页",imageName: "tabbar_home")
        addChildVC(childVc: HomeVC(), title: "消息", imageName: "tabbar_message_center")
        addChildVC(childVc: HomeVC(), title: "", imageName: "")
        addChildVC(childVc: HomeVC(), title: "发现", imageName: "tabbar_discover")
        addChildVC(childVc: HomeVC(), title: "我", imageName: "tabbar_profile")
    }
    
    // 添加一个子控制器
    func addChildVC(childVc:UIViewController, title:String, imageName:String){
        // 1.2设置子控制的相关属性
        childVc.title = title
        childVc.tabBarItem.image = UIImage(named: imageName)
        childVc.tabBarItem.selectedImage = UIImage(named: imageName + "_highlighted")
        // 1.3包装一个导航控制器
        let nav = UINavigationController(rootViewController: childVc)
        // 1.4将子控制器添加到UITabBarController中
        addChild(nav)
    }
    
    //点击 + 号
    @objc func compseBtnClick(){
        print("compseBtnClick")
    }
    
    //懒加载 +号按钮
    private lazy var composeButton: UIButton = {
        () -> UIButton
        in
        let button = UIButton()
        button.setImage(UIImage(named: "tabbar_compose_icon_add"), for: UIControl.State.normal)
        button.setImage(UIImage(named: "tabbar_compose_icon_add_highlighted"), for: UIControl.State.highlighted)
        button.setBackgroundImage(UIImage(named: "tabbar_compose_button"), for: UIControl.State.normal)
        button.setBackgroundImage(UIImage(named: "tabbar_compose_button_highlighted"), for: UIControl.State.highlighted)
        button.addTarget(self, action: #selector(self.compseBtnClick), for: UIControl.Event.touchUpInside)
        button.sizeToFit()
        
        return button
    }()
    
}
