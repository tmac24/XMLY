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
    private let FMMineMakeCellID = "FMMineMakeCellID"
    
    lazy var datasource: Array = {
        return [[["icon":"钱数", "title": "分享赚钱"],
                 ["icon":"沙漏", "title": "免流量服务"]],
                [["icon":"扫一扫", "title": "扫一扫"],
                 ["icon":"月亮", "title": "夜间模式"]],
                [["icon":"意见反馈", "title": "帮助与反馈"]]]
    }()
    
    lazy var tableView: UITableView = {
        let tableV = UITableView.init(frame: .zero, style: UITableView.Style.plain)
        tableV.contentInset = UIEdgeInsets(top: CGFloat(-FMNavBarHeight), left: 0, bottom: 0, right: 0)
        tableV.backgroundColor = FMDownColor
        tableV.delegate = self
        tableV.dataSource = self
        tableV.register(UITableViewCell.self, forCellReuseIdentifier: TableViewCellID)
        tableV.register(UINib.init(nibName: "FMMineMakeCell", bundle: nil), forCellReuseIdentifier: FMMineMakeCellID)
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
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return datasource[section-1].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell: FMMineMakeCell = tableView.dequeueReusableCell(withIdentifier: FMMineMakeCellID, for: indexPath) as! FMMineMakeCell
            cell.selectionStyle = .none
            return cell;
        }else {
            let cell = tableView .dequeueReusableCell(withIdentifier: TableViewCellID, for: indexPath)
            let dic:[String: String] = self.datasource[indexPath.section - 1][indexPath.row]
            cell.textLabel?.text = dic["title"]
            cell.imageView?.image = UIImage(named: dic["icon"] ?? "")
            cell.accessoryType = .disclosureIndicator
            cell.selectionStyle = .none
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 100
        }
        return 44
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        footerView.backgroundColor = FMDownColor
        return footerView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 || section == 1 {
            return 10
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
    
    
    
}
