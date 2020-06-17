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
        initUI()
        initLayout()
    }
    
    func initUI() {
        self.addSubview(self.imageView)
        self.addSubview(self.titleLabel)
        backgroundColor = UIColor.white
        layer.masksToBounds = true
        layer.cornerRadius = 4.0
        layer.borderColor = UIColor.init(red: 220/255.0, green: 220/255.0, blue: 220/255.0, alpha: 1).cgColor
        layer.borderWidth = 0.5
    }
    
    func initLayout() {
        self.imageView.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.width.height.equalTo(25)
            make.centerY.equalToSuperview()
        }
        
        self.titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.imageView.snp.right).offset(5)
            make.top.bottom.equalTo(self.imageView)
            make.width.equalToSuperview().offset(-self.imageView.frame.width)
        }
    }
    
    var itemModel:FMItemList? {
        didSet {
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
