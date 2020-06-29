//
//  HttpDatas.swift
//  XMLY
//
//  Created by ishop02 on 2020/6/29.
//  Copyright © 2020 happy. All rights reserved.
//

import UIKit
import Alamofire

//创建一个单例
let httpShareInstance = HttpDatas()

//数据请求方法
enum MethodType {
    case get
    case post
}

class HttpDatas: NSObject {

    //单例
    class var shareInstance: HttpDatas {
        return httpShareInstance
    }
}

//网络请求写在类扩展里面
extension HttpDatas {
    
    /// 网络请求通用版
    /// - Parameters:
    ///   - type: 数据请求方式
    ///   - URLString: 请求路径
    ///   - paramaters: 参数
    ///   - finishCallBack: 把请求数据回调block
    func requestDatas(_ type: MethodType, URLString: String, paramaters:[String: Any]?, finishCallBack: @escaping (_ response: Any) -> ()) {
        
       //获取请求类型
        let method = type == .get ? HTTPMethod.get : HTTPMethod.post
        Alamofire.request(URLString, method: method, parameters: paramaters, encoding: URLEncoding.default, headers: nil).responseJSON { responseJson in
            
            //判断请求是否成功
            guard responseJson.result.value != nil else {
                print(responseJson.result.error!)
                return
            }
            
            //获取结果
            guard responseJson.result.isSuccess else {
                return
            }
            
            //成功就把请求的数据回调过去
            if let value = responseJson.result.value {
                finishCallBack(value)
            }
        }
    }
}
