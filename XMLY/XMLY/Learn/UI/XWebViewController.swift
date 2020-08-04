//
//  XWebViewController.swift
//  XMLY
//
//  Created by ishop02 on 2020/8/4.
//  Copyright © 2020 happy. All rights reserved.
//

import UIKit
import WebKit

class XWebViewController: UIViewController {
    
    lazy var segment: UISegmentedControl = {
        let seg = UISegmentedControl.init(items: ["显示网站","显示HTML","显示本地文件"])
        seg.frame = CGRect.init(x: 0, y: FMNavBarHeight, width: view.bounds.width, height: 40)
        seg.selectedSegmentIndex = 0
        seg.addTarget(self, action: #selector(changeTypeChick), for: UIControl.Event.valueChanged)
        return seg
    }()
    
    lazy var webView: WKWebView = {
        let web = WKWebView.init(frame: CGRect.init(x: 0, y: FMNavBarHeight+40, width: view.bounds.width, height: view.bounds.height - 40 - FMNavBarHeight))
        return web
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = FMDownColor
        view.addSubview(segment)
        view.addSubview(webView)
    }
    
    @objc func changeTypeChick(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        switch index {
        case 0:
            let url = URL.init(string: "https://www.baidu.com")
            let request = URLRequest.init(url: url!)
            webView.load(request)
        case 1:
            let html = "<h1>欢迎来到:<a href='https://www.baidu.com'>Swift学习</a></h1>"
            webView.loadHTMLString(html, baseURL: nil)
        case 2:
            let path = Bundle.main.path(forResource: "商品档案文档", ofType: "html")
            let url = URL.init(fileURLWithPath: path!)
            let requset = URLRequest.init(url: url)
            webView.load(requset)
        default:
            print("出现错误")
        }
    }
}
