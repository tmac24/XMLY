//
//  FMHomeController.swift
//  XMLY
//
//  Created by ishop02 on 2020/6/15.
//  Copyright © 2020 happy. All rights reserved.
//

import UIKit
import DNSPageView

class FMHomeController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupPageStyle()
    }
    
    func setupPageStyle() {
        let style = DNSPageStyle()
        style.isTitleViewScrollEnabled = false
        style.isTitleScaleEnabled = true
        style.isShowBottomLine = true
        style.titleSelectedColor = UIColor.black
        style.titleColor = UIColor.gray
        style.bottomLineColor = FMButtonColor
        style.bottomLineHeight = 2
        
        let titles = ["推荐","分类","会员","直播","广播"]
        let viewControllers:[UIViewController] = [FMHomeClassifyController(),FMHomeClassifyController(),FMHomeRecommendController(),FMHomeRecommendController(),FMHomeRecommendController()]
        for vc in viewControllers{
            self.addChild(vc)
        }
        let pageView = DNSPageView(frame: CGRect(x: 0, y: FMNavBarHeight+20, width: FMScreenWidth, height: FMScreenHeight - FMNavBarHeight - FMTarBarHeight - 44 - 8), style: style, titles: titles, childViewControllers: viewControllers)
        
        view.addSubview(pageView)
        
    }
    
}
