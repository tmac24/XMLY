//
//  LBFMCustomLabel.swift
//  XMLYFM
//
//  Created by JCSON on 2018/8/21.
//  Copyright © 2018年 liubo. All rights reserved.
//

import UIKit
// label 文字从坐上角开始显示
class LBFMCustomLabel: UILabel {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
        var textRect = super.textRect(forBounds: bounds, limitedToNumberOfLines: numberOfLines)
        textRect.origin.y = bounds.origin.y
        return textRect
    }
    
    override func drawText(in rect: CGRect) {
        let actualRect = self.textRect(forBounds: rect, limitedToNumberOfLines: self.numberOfLines)
        super.drawText(in: actualRect)
    }
}

func isiPhoneXScreen() -> Bool {
        guard #available(iOS 11.0, *) else {
            return false
        }
 
 return UIApplication.shared.windows[0].safeAreaInsets != UIEdgeInsets.zero
}

//封装的日志输出功能（T表示不指定日志信息参数类型）
func FMPrint<T>(_ message:T, file:String = #file, function:String = #function,
           line:Int = #line) {
    #if DEBUG
        //获取文件名
        let fileName = (file as NSString).lastPathComponent
        //打印日志内容
        //print("\(fileName):\(line) \(function) | \(message)")
        print("\(fileName):\(line) \(message)")
    #endif
}
