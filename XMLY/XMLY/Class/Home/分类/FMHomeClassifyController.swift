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
    private let FMHomeClassifyHeaderViewID = "FMHomeClassifyHeaderViewID"
    
    var classifyModel: [FMClassifyModel]?
    
    lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        let collection = UICollectionView.init(frame: .zero, collectionViewLayout: layout)
        collection.delegate = self
        collection.dataSource = self
        collection.showsVerticalScrollIndicator = false
        collection.register(FMHomeClassifyCell.self, forCellWithReuseIdentifier: FMCellIdentifier)
        collection.register(FMHomeClassifyHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: FMHomeClassifyHeaderViewID)
        collection.backgroundColor = FMDownColor
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        initLayout()
        setupLoadData()
    }
    
    func initUI() {
        view.backgroundColor = UIColor.white
        view.addSubview(self.collectionView)
    }
    
    func initLayout() {
        self.collectionView.snp.makeConstraints { (make) in
            make.top.left.right.height.equalToSuperview()
        }
    }
    
    // 加载数据
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
        cell.itemModel = self.classifyModel?[indexPath.section].itemList![indexPath.row]
        return cell
    }
    
    //每个分区的内边距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 2, left: 2, bottom: 10, right: 2)
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
        if indexPath.section == 0 || indexPath.section == 1 || indexPath.section == 2 {
            return CGSize.init(width:(FMScreenWidth - 10) / 4,height:40)
        }else {
            return CGSize.init(width:(FMScreenWidth - 7.5) / 3,height:40)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let heardView: FMHomeClassifyHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: FMHomeClassifyHeaderViewID, for: indexPath) as! FMHomeClassifyHeaderView
            heardView.titleString = self.classifyModel?[indexPath.section].groupName
            return heardView
        }
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 || section == 1 || section == 2 {
            return .zero
        }else {
            return CGSize(width: FMScreenWidth, height: 30)
        }
    }
}
