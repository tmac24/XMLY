//
//  FMMineController.swift
//  XMLY
//
//  Created by ishop02 on 2020/6/19.
//  Copyright © 2020 happy. All rights reserved.
//

import UIKit

class FMMineController: UIViewController {
    private let TableViewCellID = "TableViewCellID"

    lazy var tableView: UITableView = {
        let tableV = UITableView.init(frame: .zero, style: UITableView.Style.plain)
        tableV.contentInset = UIEdgeInsets(top: CGFloat(-FMNavBarHeight), left: 0, bottom: 0, right: 0)
        tableV.backgroundColor = FMDownColor
        tableV.delegate = self
        tableV.dataSource = self
        tableV.register(UITableViewCell.self, forCellReuseIdentifier: TableViewCellID)
        tableV.tableFooterView = UIView.init()
        tableV.tableHeaderView = headerView
        return tableV
    }()
    
    lazy var headerView: FMMineHeaderView = {
        let view = FMMineHeaderView.init(frame: CGRect(x: 0, y: 0, width: FMScreenWidth, height: 300))
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupLayout()
    }
    
    func setupUI() {
        navBarBarTintColor = UIColor.init(red: 247/255.0, green: 247/255.0, blue: 247/255.0, alpha: 1.0)
        navBarBackgroundAlpha = 0
        
        view.backgroundColor = UIColor.white
        view.addSubview(self.tableView)
    }
    
    func setupLayout() {
        self.tableView.snp.makeConstraints { make in
            make.left.top.bottom.right.equalToSuperview()
        }
    }

}

extension FMMineController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView .dequeueReusableCell(withIdentifier: TableViewCellID, for: indexPath)
        cell.textLabel?.text = "cell--\(indexPath.row)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
}
