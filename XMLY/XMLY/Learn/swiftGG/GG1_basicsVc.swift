//
//  GG1_basicsVc.swift
//  XMLY
//
//  Created by ishop02 on 2020/7/30.
//  Copyright © 2020 happy. All rights reserved.
//

import UIKit
import WebKit

class GG1_basicsVc: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.white
        
//        let textView = UITextView.init(frame: CGRect(x: 0, y: 0, width: view.bounds.size.width, height: view.bounds.size.height))
//        textView.text = "Swift 还增加了可选（Optional）类型，用于处理值缺失的情况。可选表示 “那儿有一个值，并且它等于 x ” 或者 “那儿没有值” 。可选有点像在 Objective-C 中使用 nil ，但是它可以用在任何类型上，不仅仅是类。可选类型比 Objective-C 中的 nil 指针更加安全也更具表现力，它是 Swift 许多强大特性的重要组成部分。\n\n Swift 是一门类型安全的语言，这意味着 Swift 可以让你清楚地知道值的类型。如果你的代码需要一个 String ，类型安全会阻止你不小心传入一个 Int 。同样的，如果你的代码需要一个 String，类型安全会阻止你意外传入一个可选的 String 。类型安全可以帮助你在开发阶段尽早发现并修正错误。"
//        textView.font = UIFont.systemFont(ofSize: 16)
//        view.addSubview(textView);
        
        let webView = WKWebView.init(frame: view.bounds)
        view.addSubview(webView)
        
//        let url = URL.init(string: "http://www.baidu.com")
//        let request = URLRequest.init(url: url!)
//        webView.load(request)
        
//        let html = "<h1>欢迎来到:<a href='https://www.jianshu.com/u/5ab366f0368f'>Swift学习</a></h1>"
//             webView.loadHTMLString(html, baseURL: nil)
        
        let path = Bundle.main.path(forResource: "商品档案文档", ofType: "html")
             let url = URL(fileURLWithPath: path!)
             let urlRequest = URLRequest(url: url)
             webView.load(urlRequest)
        
    }
}
