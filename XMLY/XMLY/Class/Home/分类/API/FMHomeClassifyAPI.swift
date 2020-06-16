//
//  FMHomeClassifyAPI.swift
//  XMLY
//
//  Created by ishop02 on 2020/6/16.
//  Copyright © 2020 happy. All rights reserved.
//

import Foundation
import Moya
import HandyJSON

let FMHomeClassifProvider = MoyaProvider<FMHomeClassifyAPI>()

public enum FMHomeClassifyAPI {
    case classifyList
}

extension FMHomeClassifyAPI: TargetType {
    // 请求头
    public var headers: [String : String]? {
        return nil
    }
    
    // 服务器地址
    public var baseURL: URL {
        switch self {
        case .classifyList:
            return URL(string: "http://mobile.ximalaya.com")!
        }
    }
    
    // 各个请求的具体路径
    public var path: String {
        switch self {
        case .classifyList:
            return "/mobile/discovery/v5/categories/1532410996452?channel=ios-b1&code=43_310000_3100&device=iPhone&gender=9&version=6.5.3%20HTTP/1.1"
        }
    }
    
    // 请求类型
    public var method: Moya.Method {
        return .get
    }
    
    // 这个就是做单元测试模拟的数据，只会在单元测试文件中有作用
    public var sampleData: Data {
        return "{}".data(using: String.Encoding.utf8)!
    }
    
    // 请求任务事件（这里附带上参数）
    public var task: Task {
        switch self {
        case .classifyList:
            return .requestPlain
        }
    }
        
}

