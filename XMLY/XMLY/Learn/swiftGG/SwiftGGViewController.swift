//
//  SwiftGGViewController.swift
//  XMLY
//
//  Created by ishop02 on 2020/7/30.
//  Copyright © 2020 happy. All rights reserved.
//

import UIKit

class SwiftGGViewController: UIViewController {
    private let SwiftGGCellID = "SwiftGGCellID"

    let dataArray = [["title":"基础部分","path":"1.基础部分"],
                     ["title":"基础运算符","path":"商品档案文档"],
                     ["title":"字符串和字符","path":"商品档案文档"],
                     ["title":"集合类型","path":"商品档案文档"],
                     ["title":"控制流","path":"商品档案文档"],
    ]
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "SwiftGG"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: SwiftGGCellID)
        tableView.tableFooterView = UIView.init()
    }
}

extension SwiftGGViewController:UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SwiftGGCellID, for: indexPath)
        cell.textLabel?.text = dataArray[indexPath.row]["title"]
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = GGHTMLVc.init()
        vc.title = dataArray[indexPath.row]["title"]
        vc.path = dataArray[indexPath.row]["path"]
        navigationController?.pushViewController(vc, animated: true)
    }
}
