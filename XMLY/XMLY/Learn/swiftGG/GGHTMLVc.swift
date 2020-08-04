//
//  GGHTMLVc.swift
//  XMLY
//
//  Created by ishop02 on 2020/7/30.
//  Copyright © 2020 happy. All rights reserved.
//

import UIKit
import WebKit

class GGHTMLVc: UIViewController {

    var path: String?
    
    /// <#Description#>
    lazy var webView: WKWebView = {
        let web = WKWebView.init(frame: view.bounds)
        return web
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.white
        view.addSubview(webView)
    
        let path = Bundle.main.path(forResource: self.path, ofType: "html")
             let url = URL(fileURLWithPath: path!)
             let urlRequest = URLRequest(url: url)
             webView.load(urlRequest)
        
    }
}
