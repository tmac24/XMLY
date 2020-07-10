//
//  People.swift
//  XMLY
//
//  Created by ishop02 on 2020/6/28.
//  Copyright © 2020 happy. All rights reserved.
//

import UIKit

//let netModelShareInstance = People()

class People: NSObject {
    // 定义属性
    // 存储属性
    var age : Int = 0
    var name : String?
    var soreDict = [String : Any]()
    var colorArray : NSArray?
    
        // 自定义构造函数,会覆盖init()函数
        init(name : String, age : Int) {
            self.name = name
            self.age = age
        }
    
    
//    //单例
//    class var shareInstance: People {
//        return netModelShareInstance
//    }
    

//    func initPeole(pname: String, page: Int, psoreDict: [String : Any], pcolorArray: NSArray ) -> Any {
//        let p = People.shareInstance
//        p.age = page
//        p.name = pname
//        p.soreDict = psoreDict
//        p.colorArray = pcolorArray
//        return p
//    }
    
}


