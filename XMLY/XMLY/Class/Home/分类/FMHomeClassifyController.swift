//
//  FMHomeClassifyController.swift
//  XMLY
//
//  Created by ishop02 on 2020/6/16.
//  Copyright © 2020 happy. All rights reserved.
//

import UIKit
import SwiftyJSON
import HandyJSON

class FMHomeClassifyController: UIViewController {
    
    private let FMCellIdentifier = "FMHomeClassifyCell"

    var classifyModel: [FMClassifyModel]?
    
    lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        let collection = UICollectionView.init(frame: .zero, collectionViewLayout: layout)
        collection.delegate = self
        collection.dataSource = self
        collection.showsVerticalScrollIndicator = false
        collection.register(FMHomeClassifyCell.self, forCellWithReuseIdentifier: FMCellIdentifier)
        collection.backgroundColor = FMDownColor
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        view.addSubview(collectionView)
        self.collectionView.snp.makeConstraints { (make) in
            make.top.left.right.height.equalToSuperview()
        }
        
        // 加载数据
        setupLoadData()
    }
    
    func setupLoadData(){
        FMHomeClassifProvider.request(.classifyList) {result in
            if case let .success(response) = result {
                //解析数据
                let data = try? response.mapJSON()
                let json = JSON(data!)
                if let mappedObject = JSONDeserializer<FMHomeClassifyModel>.deserializeFrom(json: json.description) {
                    self.classifyModel = mappedObject.list
                    self.collectionView.reloadData()
                }
            }
        }
    }
    
}

extension FMHomeClassifyController:UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView:UICollectionView) ->Int {
        return self.classifyModel?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.classifyModel?[section].itemList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell:FMHomeClassifyCell = collectionView.dequeueReusableCell(withReuseIdentifier: FMCellIdentifier, for: indexPath) as! FMHomeClassifyCell
//        cell.titleLabel.text = "\(indexPath.row)"
        cell.itemModel = self.classifyModel?[indexPath.section].itemList![indexPath.row]
        cell.backgroundColor = UIColor.white
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = 4.0
        cell.layer.borderColor = UIColor.init(red: 220/255.0, green: 220/255.0, blue: 220/255.0, alpha: 1).cgColor
        cell.layer.borderWidth = 0.5
        return cell
    }
    
    //每个分区的内边距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
    }
    
    //最小 item 间距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    //最小行间距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    //item 的尺寸
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        print((FMScreenWidth - 7.5) / 3)
        if indexPath.section == 0 || indexPath.section == 1 || indexPath.section == 2 {
            return CGSize.init(width:(FMScreenWidth - 10) / 4,height:40)
        }else {
            return CGSize.init(width:(FMScreenWidth - 7.5) / 3,height:40)
        }
    }
}
