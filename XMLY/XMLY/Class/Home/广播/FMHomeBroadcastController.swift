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

class FMHomeBroadcastController: UIViewController {

    private let FMtestId = "FMtestId"
    private let FMRadioSquareCellID = "FMRadioSquareCellID"
    private let FMRadioCategoriesCellID = "FMRadioCategoriesCellID"
    
    var radioSquareArray: [FMHomeRadioSquareResult]?
    var categoriesArray : [FMHomeCategory]?
    
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
        collectV.backgroundColor = FMDownColor
        return collectV
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupLayout()
        setupRequest()
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
        FMHomeBroadcastAPIProvider.request(.homeBroadcastList) { result in
            if case let .success(response) = result {
                let data = try? response.mapJSON()
                let json = JSON(data!)
                if let mappedObject = JSONDeserializer<FMHomeBroadcastModel>.deserializeFrom(json: json.description) {
                    self.radioSquareArray = mappedObject.data?.radioSquareResults
                    self.categoriesArray = mappedObject.data?.categories
                    self.categoriesArray?.insert(self.foldModel, at: 7)
                    self.categoriesArray?.append(self.coverModel)
                    self.categoriesArray?.append(self.unFoldModel)
                    self.collectView.reloadData()
                }
            }
        }
    }
}

extension FMHomeBroadcastController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return self.radioSquareArray?.count ?? 0
        }else {
            if self.isUnfold {
                return self.categoriesArray?.count ?? 0
            }else {
                let num = self.categoriesArray?.count ?? 0
                return num / 2
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell: FMRadioSquareCell = collectionView.dequeueReusableCell(withReuseIdentifier: FMRadioSquareCellID, for: indexPath) as! FMRadioSquareCell
            cell.radioSquareModel = self.radioSquareArray?[indexPath.row]
            return cell
        }else {
            let cell:FMRadioCategoriesCell = collectionView.dequeueReusableCell(withReuseIdentifier: FMRadioCategoriesCellID, for: indexPath) as! FMRadioCategoriesCell
            cell.itemModel = self.categoriesArray?[indexPath.row]
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 1 {
//            if indexPath.row == 7 || indexPath.row == 15{
//                self.isUnfold = !self.isUnfold
//                print(self.isUnfold)
//                if self.isUnfold {
//                    self.categoriesArray?.remove(at: 7)
//                }else {
//                    self.categoriesArray?.insert(self.foldModel, at: 7)
//                }
//                self.collectView.reloadData()
//            }
            
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
    
    //item 的尺寸
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize.init(width:FMScreenWidth / 5,height:90)
        }else {
            return CGSize.init(width: (FMScreenWidth - 6) / 4, height: 50)
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
    
    
}
