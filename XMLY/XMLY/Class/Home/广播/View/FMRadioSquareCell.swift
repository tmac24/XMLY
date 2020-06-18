//
//  FMRadioSquareCell.swift
//  XMLY
//
//  Created by ishop02 on 2020/6/18.
//  Copyright © 2020 happy. All rights reserved.
//

import UIKit

class FMRadioSquareCell: UICollectionViewCell {
    
    
    @IBOutlet weak var imageV: UIImageView!
    @IBOutlet weak var titleL: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    var radioSquareModel: FMHomeRadioSquareResult? {
        didSet {
            guard let model = radioSquareModel else { return }
            self.titleL.text = model.title
            self.imageV.kf.setImage(with: URL(string: model.icon!))
        }
    }
    
}
