//
//  FMHomeClassifyModel.swift
//  XMLY
//
//  Created by ishop02 on 2020/6/16.
//  Copyright © 2020 happy. All rights reserved.
//

import UIKit
import HandyJSON

struct FMHomeClassifyModel: HandyJSON {
    var list:[FMClassifyModel]?
    var msg:String?
    var code:String?
    var ret:Int = 0
}

struct FMClassifyModel: HandyJSON {
    var groupName: String?
    var displayStyleType: Int = 0
    var itemList:[FMItemList]?
}

struct FMItemList: HandyJSON {
    var itemType: Int = 0
    var coverPath: String?
    var isDisplayCornerMark: Bool = false
    var itemDetail: FMItemDetail?
}

struct FMItemDetail: HandyJSON {
    var categoryId: Int = 0
    var name: String?
    var title: String?
    var categoryType: Int = 0
    var moduleType: Int = 0
    var filterSupported: Bool = false
    var keywordId: Int = 0
    var keywordName: String?
}

