//
//  UIOverviewViewContrller.swift
//  XMLY
//
//  Created by ishop02 on 2020/8/4.
//  Copyright © 2020 happy. All rights reserved.
//

import UIKit

class UIOverviewViewContrller: UIViewController, UITableViewDelegate, UITableViewDataSource {
    private let OverviewViewcellID = "OverviewViewcellID"
    
    lazy var datasource: Array = {
        return [["title":"webView","vc":XWebViewController()],
                ["title":"基础运算符","vc":GGHTMLVc()],
                ["title":"字符串和字符","vc":GGHTMLVc()],
                ["title":"集合类型","vc":GGHTMLVc()],
                ["title":"控制流","vc":GGHTMLVc()],]
    }()

    lazy var tableView: UITableView = {
        let table = UITableView.init(frame: view.bounds, style: UITableView.Style.plain)
        table.backgroundColor = FMDownColor
        table.delegate = self
        table.dataSource = self
        table.tableFooterView = UIView.init()
        table.register(UITableViewCell.self, forCellReuseIdentifier: OverviewViewcellID)
        return table
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(tableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: OverviewViewcellID, for: indexPath)
        let dic = datasource[indexPath.row]
        cell.textLabel?.text = dic["title"] as? String
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let dic = datasource[indexPath.row]
        let vc = dic["vc"] as! UIViewController
        vc.title = dic["title"] as? String
        navigationController?.pushViewController(vc, animated: true)
    }
}
