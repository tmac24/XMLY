//
//  FMMineMakeCell.swift
//  XMLY
//
//  Created by ishop02 on 2020/6/19.
//  Copyright © 2020 happy. All rights reserved.
//

import UIKit

class FMMineMakeCell: UITableViewCell {
    
let margin:CGFloat = FMScreenWidth / 8
    
    @IBOutlet weak var maiButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let waveView = FMCVLayerView(frame: CGRect(x: margin/2 + 15, y: 10, width: margin, height: margin))
        waveView.center = maiButton.center
        // 因为我的VC是XIB  所以将图层添加在到按钮之下 一般用法就直接addSubview就可以了
        self.addSubview(waveView)
        waveView.starAnimation()  // 开始动画
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
}
