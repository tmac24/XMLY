//
//  FMHomeRadiosCell.swift
//  XMLY
//
//  Created by ishop02 on 2020/6/18.
//  Copyright © 2020 happy. All rights reserved.
//

import UIKit

class FMHomeRadiosCell: UICollectionViewCell {

    @IBOutlet weak var numL: UILabel!
    @IBOutlet weak var subTitleL: UILabel!
    @IBOutlet weak var titleL: UILabel!
    @IBOutlet weak var imageV: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    var itemModel:FMHomeLocalRadio? {
        didSet {
            guard let model = itemModel else { return }

            self.imageV.kf.setImage(with: URL(string: model.coverLarge!))
            self.titleL.text = model.name
            let programName = model.programName ?? ""
            self.subTitleL.text = String(format: "正在直播:%@", programName)
            
            var numString:String?
            if model.playCount > 100000000 {
                numString = String(format: "%.1f亿", Double(model.playCount) / 100000000)
            } else if model.playCount > 10000 {
                numString = String(format: "%.1f万", Double(model.playCount) / 10000)
            } else {
                numString = "\(String(describing: model.playCount))"
            }
            self.numL.text = numString
        }
    }
    

}
