//
//  FMRadioCategoriesCell.swift
//  XMLY
//
//  Created by ishop02 on 2020/6/18.
//  Copyright © 2020 happy. All rights reserved.
//

import UIKit

class FMRadioCategoriesCell: UICollectionViewCell {

    @IBOutlet weak var titleL: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var itemModel:FMHomeCategory? {
        didSet {
            guard let model = itemModel else { return }
            self.titleL.text = model.name
            if model.name == "展开 >>" || model.name == "收起 <<"  {
                self.titleL.textColor = UIColor.orange
            }else {
                self.titleL.textColor = UIColor.black
            }
        }
    }

}
