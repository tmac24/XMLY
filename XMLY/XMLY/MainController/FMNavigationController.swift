//
//  FMNavigationController.swift
//  XMLY
//
//  Created by ishop02 on 2020/6/15.
//  Copyright © 2020 happy. All rights reserved.
//

import UIKit

class FMNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavBarAppearence()
    }
    
    func setupNavBarAppearence(){
        WRNavigationBar.defaultNavBarTintColor = UIColor.init(red: 245/255.0, green: 245/255.0, blue: 245/255.0, alpha: 1)
        
        // 设置导航栏所有按钮的
        WRNavigationBar.defaultNavBarTintColor = KButtonColor
        WRNavigationBar.defaultNavBarTitleColor = UIColor.black
        
        // 如果需要设置导航栏底部分割线隐藏，可以在这里统一设置
        WRNavigationBar.defaultShadowImageHidden = true
    }
  
}

extension FMNavigationController {
    override func pushViewController(_ viewcontroller: UIViewController, animated: Bool ) {
        if children.count > 0 {
            viewcontroller.hidesBottomBarWhenPushed = true
        }
        super .pushViewController(viewcontroller, animated: animated)
    }
}
