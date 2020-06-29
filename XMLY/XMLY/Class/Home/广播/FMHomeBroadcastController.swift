//
//  FMHomeBroadcastController.swift
//  XMLY
//
//  Created by ishop02 on 2020/6/17.
//  Copyright © 2020 happy. All rights reserved.
//

import UIKit
import HandyJSON
import SwiftyJSON
import SVProgressHUD

class FMHomeBroadcastController: UIViewController {

    private let FMtestId = "FMtestId"
    private let FMRadioSquareCellID = "FMRadioSquareCellID"
    private let FMRadioCategoriesCellID = "FMRadioCategoriesCellID"
    private let FMHomeRadiosCellID = "FMHomeRadiosCellID"
    private let FMRadioHeaderViewID = "FMRadioHeaderViewID"
    
    var radioSquareArray: [FMHomeRadioSquareResult]?
    var categoriesArray: [FMHomeCategory]?
    var localRadioArray: [FMHomeLocalRadio]?
    var topRadiosArray: [FMHomeLocalRadio]?
    
    
    var isUnfold: Bool = false
    //电台模型展示，收起，正常状态
    let foldModel = FMHomeCategory.init(id: 10000, name: "展开 >>")
    let unFoldModel = FMHomeCategory.init(id: 10000, name: "收起 <<")
    let coverModel = FMHomeCategory.init(id: 10000, name:" ")

    
    lazy var collectView: UICollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let collectV = UICollectionView.init(frame: .zero, collectionViewLayout: layout)
        collectV.showsVerticalScrollIndicator = false
        collectV.delegate = self
        collectV.dataSource = self
        collectV.register(UINib(nibName: "FMRadioSquareCell", bundle: nil), forCellWithReuseIdentifier: FMRadioSquareCellID)
        collectV.register(UINib(nibName: "FMRadioCategoriesCell", bundle: nil), forCellWithReuseIdentifier: FMRadioCategoriesCellID)
        collectV.register(UINib(nibName: "FMHomeRadiosCell", bundle: nil), forCellWithReuseIdentifier: FMHomeRadiosCellID)
        collectV.register(UINib(nibName: "FMRadioHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: FMRadioHeaderViewID)
        collectV.backgroundColor = FMDownColor
        
        collectV.uHead = URefreshHeader{ [weak self] in self?.setupRequest() }

        return collectV
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupLayout()
        self.collectView.uHead.beginRefreshing()
//        setupRequest()
    }
    
    func setupUI() {
        view.backgroundColor = UIColor.white
        view.addSubview(self.collectView)
    }

    func setupLayout() {
        self.collectView.snp.makeConstraints { (make) in
            make.right.left.top.bottom.equalToSuperview()
        }
    }
    
    func setupRequest() {
        HttpDatas.shareInstance.requestDatas(.get, URLString: "http://live.ximalaya.com/live-web/v5/homepage", paramaters: nil) { response in
            let json = JSON(response)
            if let object = FMHomeBroadcastModel.deserialize(from: json.description) {
                self.radioSquareArray = object.data?.radioSquareResults
                self.categoriesArray = object.data?.categories
                if self.isUnfold == false {
                    self.categoriesArray?.insert(self.foldModel, at: 7)
                }
                self.categoriesArray?.append(self.coverModel)
                self.categoriesArray?.append(self.unFoldModel)
                self.localRadioArray = object.data?.localRadios
                self.topRadiosArray = object.data?.topRadios
                self.collectView.reloadData()
                self.collectView.uHead.endRefreshing()
            }
        }
        
        
//        FMHomeBroadcastAPIProvider.request(.homeBroadcastList) { result in
//            if case let .success(response) = result {
//                let data = try? response.mapJSON()
//                let json = JSON(data!)
//                if let object = FMHomeBroadcastModel.deserialize(from: json.description) {
//                    self.radioSquareArray = object.data?.radioSquareResults
//                    self.categoriesArray = object.data?.categories
//                    if self.isUnfold == false {
//                        self.categoriesArray?.insert(self.foldModel, at: 7)
//                    }
//                    self.categoriesArray?.append(self.coverModel)
//                    self.categoriesArray?.append(self.unFoldModel)
//                    self.localRadioArray = object.data?.localRadios
//                    self.topRadiosArray = object.data?.topRadios
//                    self.collectView.reloadData()
//                    self.collectView.uHead.endRefreshing()
//                }
//            }
//        }
    }
}

extension FMHomeBroadcastController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return self.radioSquareArray?.count ?? 0
        }else if section == 1 {
            if self.isUnfold {
                return self.categoriesArray?.count ?? 0
            }else {
                let num = self.categoriesArray?.count ?? 0
                return num / 2
            }
        }else if section == 2 {
            return self.localRadioArray?.count ?? 0
        }
        else {
            return self.topRadiosArray?.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell: FMRadioSquareCell = collectionView.dequeueReusableCell(withReuseIdentifier: FMRadioSquareCellID, for: indexPath) as! FMRadioSquareCell
            cell.radioSquareModel = self.radioSquareArray?[indexPath.row]
            return cell
        }else if indexPath.section == 1 {
            let cell:FMRadioCategoriesCell = collectionView.dequeueReusableCell(withReuseIdentifier: FMRadioCategoriesCellID, for: indexPath) as! FMRadioCategoriesCell
            cell.itemModel = self.categoriesArray?[indexPath.row]
            return cell
        }else if indexPath.section == 2 {
            let cell:FMHomeRadiosCell = collectionView.dequeueReusableCell(withReuseIdentifier: FMHomeRadiosCellID, for: indexPath) as! FMHomeRadiosCell
            cell.itemModel = self.localRadioArray?[indexPath.row]
            return cell
        }
        else {
            let cell:FMHomeRadiosCell = collectionView.dequeueReusableCell(withReuseIdentifier: FMHomeRadiosCellID, for: indexPath) as! FMHomeRadiosCell
            cell.itemModel = self.topRadiosArray?[indexPath.row]
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            if indexPath.row == 7 && self.isUnfold == false {
                self.isUnfold = !self.isUnfold
                self.categoriesArray?.remove(at: 7)
                self.collectView.reloadData()
            }
            if indexPath.row == 15 && self.isUnfold == true {
                self.isUnfold = !self.isUnfold
                self.categoriesArray?.insert(self.foldModel, at: 7)
                self.collectView.reloadData()
            }
        }
    }
    
    //每个分区的内边距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 1 || section == 0 {
            return .zero
        }
        return UIEdgeInsets(top: 2, left: 0, bottom: 10, right: 0)
    }
    
    //item 的尺寸
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize.init(width:FMScreenWidth / 5,height: 90)
        } else if indexPath.section == 1 {
            return CGSize.init(width: (FMScreenWidth - 6) / 4, height: 45)
        }
        else {
            return CGSize.init(width: FMScreenWidth, height: 120)
        }
    }
    
    //最小 item 间距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }else {
            return 2
        }
    }
    
    //最小行间距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }else {
            return 2
        }
    }
    
     //header footer View
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headV: FMRadioHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: FMRadioHeaderViewID, for: indexPath) as! FMRadioHeaderView
        if indexPath.section == 2 {
            headV.titleL.text = "本地"
        }else {
            headV.titleL.text = "广播"
        }
        return headV
    }
    
    //header footer 宽高
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 2 || section == 3 {
            return CGSize.init(width: FMScreenWidth, height: 50)
        }else {
            return .zero
        }
    }
}
