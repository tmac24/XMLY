//
//  FMHomeClassifyCell.swift
//  XMLY
//
//  Created by ishop02 on 2020/6/16.
//  Copyright © 2020 happy. All rights reserved.
//

import UIKit

class FMHomeClassifyCell: UICollectionViewCell {
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        self.addSubview(self.imageView)
        self.imageView.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.width.height.equalTo(25)
            make.centerY.equalToSuperview()
        }
        
        self.addSubview(self.titleLabel)
        self.titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.imageView.snp.right).offset(5)
            make.top.bottom.equalTo(self.imageView)
            make.width.equalToSuperview().offset(-self.imageView.frame.width)
        }
    }
    
    var itemModel:FMItemList? {
        didSet {
            self.titleLabel.text = "safa"
            guard let model = itemModel else { return }
            if model.itemType == 1 {// 如果是第一个item,是有图片显示的，并且字体偏小
                self.titleLabel.text = model.itemDetail?.keywordName
            }else{
                self.titleLabel.text = model.itemDetail?.title
                self.imageView.kf.setImage(with: URL(string: model.coverPath!))
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
