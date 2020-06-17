//
//  FMHomeBroadcastController.swift
//  XMLY
//
//  Created by ishop02 on 2020/6/17.
//  Copyright © 2020 happy. All rights reserved.
//

import UIKit

class FMHomeBroadcastController: UIViewController {

    private let FMtestId = "FMtestId"
    
    lazy var collectView: UICollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let collectV = UICollectionView.init(frame: .zero, collectionViewLayout: layout)
        collectV.showsVerticalScrollIndicator = false
        collectV.delegate = self
        collectV.dataSource = self
        collectV.register(UICollectionViewCell.self, forCellWithReuseIdentifier: FMtestId)
        collectV.backgroundColor = FMDownColor
        return collectV
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupLayout()
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
}

extension FMHomeBroadcastController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FMtestId, for: indexPath)
        cell.backgroundColor = UIColor.blue
        return cell
    }
    
    //item 的尺寸
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width:(FMScreenWidth - 10) / 4,height:40)
    }
    
}
