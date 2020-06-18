//
//  FMRadiosModel.swift
//  XMLY
//
//  Created by ishop02 on 2020/6/18.
//  Copyright © 2020 happy. All rights reserved.
//

import UIKit
import HandyJSON

// 首页广播数据模型
struct FMHomeBroadcastModel : HandyJSON {
    var data:FMHomeRadiosModel?
    var ret: Int = 0
}


struct FMHomeRadiosModel: HandyJSON {
    
    var categories : [FMHomeCategory]!
    var localRadios : [FMHomeLocalRadio]!
    var location : String!
    var radioSquareResults : [FMHomeRadioSquareResult]!
    var topRadios : [FMHomeLocalRadio]!
}

struct FMHomeRadioSquareResult: HandyJSON {
    
    var icon : String?
    var id : Int!
    var title : String?
    var uri : String?
}

struct FMHomeLocalRadio: HandyJSON{

    var coverLarge : String?
    var coverSmall : String!
    var fmUid : Int!
    var id : Int!
    var name : String!
    var playCount : Int!
    var playUrl : FMHomePlayUrl!
    var programId : Int!
    var programName : String?
    var programScheduleId : Int = 0
    var publish : Bool = false
}

struct FMHomePlayUrl: HandyJSON{

    var aac24 : String?
    var aac64 : String?
    var ts24 : String?
    var ts64 : String?
}

struct FMHomeCategory: HandyJSON{
    
    var id : Int!
    var name : String!
}
