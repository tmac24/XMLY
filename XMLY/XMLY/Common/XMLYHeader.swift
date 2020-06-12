//
//  XMLYHeader.swift
//  XMLY
//
//  Created by ishop02 on 2020/6/12.
//  Copyright © 2020 happy. All rights reserved.
//

import UIKit
import Foundation
import Kingfisher
import SnapKit
import SwiftyJSON
import HandyJSON
import SwiftMessages

let KScreenWidth = UIScreen.main.bounds.width
let KScreenHeight = UIScreen.main.bounds.height

let KButtonColor = UIColor(red: 242/255.0, green: 77/255.0, blue: 51/255.0, alpha: 1)
let KDownColor = UIColor.init(red: 240/255.0, green: 241/255.0, blue: 244/255.0, alpha: 1)

let isIphoneX = KScreenHeight == 812 ? true : false

let KNavBarHeight = isIphoneX ? 88 : 64
let KTarBarHeight = isIphoneX ? 49 + 34 : 49





