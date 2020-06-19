//
//  FMMineHeaderView.swift
//  XMLY
//
//  Created by ishop02 on 2020/6/19.
//  Copyright © 2020 happy. All rights reserved.
//

import UIKit

class FMMineHeaderView: UIView {

    //头像
    private lazy var imageView: UIImageView = {
        let imageV = UIImageView.init(image: UIImage(named: "tom"))
        return imageV
    }()
    
    //昵称
    lazy var nickName: UILabel = {
        let nickL = UILabel()
        nickL.text = "神奈川丶解夏"
        return nickL
    }()
    
    //粉丝
    lazy var fans: UILabel = {
        let fansL = UILabel()
        fansL.text = "粉丝  100万"
        fansL.textColor = UIColor.gray
        fansL.font = UIFont.systemFont(ofSize: 15)
        return fansL
    }()
    
    // 关注
     private lazy var attentionL:UILabel = {
         let label = UILabel()
         label.text = "关注  7"
         label.textColor = UIColor.gray
         label.font = UIFont.systemFont(ofSize: 15)
         return label
     }()
     
     // 解锁
     private lazy var clearLabel:UILabel = {
         let label = UILabel()
         label.text = "已听9分钟，满3小时解锁>"
         label.textColor = UIColor.gray
         label.font = UIFont.systemFont(ofSize: 15)
         label.textAlignment = NSTextAlignment.center
         return label
     }()
     
     
     // shopView
     private lazy var shopView:UIView = {
         let view = UIView()
         view.backgroundColor = UIColor.white
         return view
     }()
     
    // shopView上细线
    private lazy var lineView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        setupLayout()
        setUpShopView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupUI() {
        self.backgroundColor = UIColor.white
        self.addSubview(self.imageView)
        self.addSubview(self.nickName)
        self.addSubview(self.fans)
        self.addSubview(self.attentionL)
        self.addSubview(self.clearLabel)
        self.addSubview(self.shopView)
        self.shopView.addSubview(self.lineView)
    }
    
    func setupLayout() {
        self.imageView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(80)
            make.width.height.equalTo(80)
        }
        
        self.nickName.snp.makeConstraints { make in
            make.left.equalTo(self.imageView.snp.right).offset(10)
            make.top.equalTo(self.imageView.snp.top).offset(10)
            make.width.equalTo(300)
            make.height.equalTo(20)
        }
        
        self.fans.snp.makeConstraints { (make) in
            make.left.equalTo(self.nickName)
            make.bottom.equalTo(self.imageView.snp.bottom).offset(-10)
            make.width.equalTo(100)
            make.height.equalTo(20)
        }
        
        self.attentionL.snp.makeConstraints { (make) in
            make.left.equalTo(self.fans.snp.right).offset(10)
            make.bottom.height.width.equalTo(self.fans)
        }
        
        self.clearLabel.layer.borderColor = UIColor.gray.cgColor
        self.clearLabel.layer.borderWidth = 0.5
        self.clearLabel.layer.masksToBounds = true
        self.clearLabel.layer.cornerRadius = 13
        self.clearLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.imageView)
            make.bottom.equalToSuperview().offset(-110)
            make.height.equalTo(26)
            make.width.equalTo(220)
        }
        
        self.shopView.snp.makeConstraints { (make) in
            make.right.left.bottom.equalToSuperview()
            make.height.equalTo(100)
        }
        
        self.lineView.snp.makeConstraints { (make) in
            make.right.left.top.equalToSuperview()
            make.height.equalTo(0.5)
        }
    }
    
    func setUpShopView() {
        let margin:CGFloat = FMScreenWidth / 10
        let titleArray = ["已购","优惠券","喜点","直播喜钻","我的钱包"]
//        FMPrint(titleArray)
        let dataArray = ["10","2","88","66","钱包"]
        for index in 0..<titleArray.count {
            let button = UIButton.init(frame: CGRect(x: margin*CGFloat(index)*2+margin/2, y: 10, width: margin, height: margin))
            if index == 4 {
                button.setImage(UIImage(named: dataArray[index]), for: UIControl.State.normal)
            }else {
                button.setTitle(dataArray[index], for: UIControl.State.normal)
                button.setTitleColor(UIColor.black, for: UIControl.State.normal)
                button.titleLabel?.font = UIFont.systemFont(ofSize: 25)
            }
            self.shopView.addSubview(button)
            
            let titleL = UILabel()
            titleL.textAlignment = .center
            titleL.text = titleArray[index]
            titleL.textColor = UIColor.gray
            titleL.font = UIFont.systemFont(ofSize: 15)
            self.shopView.addSubview(titleL)
            
            titleL.snp.makeConstraints { make in
                make.centerX.equalTo(button)
                make.width.equalTo(margin+30)
                make.top.equalTo(button.snp.bottom).offset(10)
            }
            
            button.tag = index
            button.addTarget(self, action: #selector(gridBtnClick(button:)), for: UIControl.Event.touchUpInside)
        }
    }
    
    @objc func gridBtnClick(button:UIButton) {
        FMPrint(button.tag)
    }

}
