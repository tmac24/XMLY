//
//  FMHomeClassifyHeaderView.swift
//  XMLY
//
//  Created by ishop02 on 2020/6/17.
//  Copyright © 2020 happy. All rights reserved.
//

import UIKit

class FMHomeClassifyHeaderView: UICollectionReusableView {
    lazy var view: UIView = {
        let view = UIView()
        view.backgroundColor = FMButtonColor
        return view
    }()
    lazy var titleL: UILabel = {
        let titleL = UILabel()
        titleL.textColor = UIColor.gray
        return titleL
    }()
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        initUI()
        initLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initUI() {
        self.addSubview(self.view)
        self.addSubview(self.titleL)
    }
    
    func initLayout() {
        self.view.snp.makeConstraints { (make) in
            make.top.equalTo(6)
            make.left.equalTo(10)
            make.width.equalTo(4)
            make.bottom.equalTo(-6)
        }
        self.titleL.snp.makeConstraints { (make) in
            make.left.equalTo(self.view.snp.right).offset(10)
            make.right.equalTo(-10)
            make.top.bottom.equalToSuperview()
        }
    }
    
    var titleString: String? {
        didSet {
            guard let str = titleString else { return }
            self.titleL.text = str
        }
    }
}
    
