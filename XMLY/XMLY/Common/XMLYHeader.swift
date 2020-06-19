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


let FMScreenWidth = UIScreen.main.bounds.size.width
let FMScreenHeight = UIScreen.main.bounds.size.height

let FMButtonColor = UIColor(red: 242/255.0, green: 77/255.0, blue: 51/255.0, alpha: 1)
let FMDownColor = UIColor.init(red: 240/255.0, green: 241/255.0, blue: 244/255.0, alpha: 1)

let isIphoneX = isiPhoneXScreen()

let FMNavBarHeight : CGFloat = isIphoneX ? 88 : 64
let FMTarBarHeight : CGFloat = isIphoneX ? 49 + 34 : 49


let colorArray = [UIColor(red: 61/255.0, green: 209/255.0, blue: 200/255.0, alpha: 1),
                  UIColor(red: 204/255.0, green: 202/255.0, blue: 149/255.0, alpha: 1),
                  UIColor(red: 246/255.0, green: 196/255.0, blue: 221/255.0, alpha: 1),
                  UIColor(red: 242/255.0, green: 77/255.0, blue: 51/255.0, alpha: 1)
                 ]

let colorArray2 = [UIColor(red: 81/255.0, green: 209/255.0, blue: 200/255.0, alpha: 1),
                   UIColor(red: 224/255.0, green: 202/255.0, blue: 135/255.0, alpha: 1),
                   UIColor(red: 216/255.0, green: 206/255.0, blue: 221/255.0, alpha: 1),
                   UIColor(red: 252/255.0, green: 47/255.0, blue: 51/255.0, alpha: 1)
                 ]




