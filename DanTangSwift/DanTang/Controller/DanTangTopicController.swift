//
//  DanTangTopicController.swift
//  DanTangSwift
//
//  Created by apple on 2017/10/13.
//  Copyright © 2017年 yangchao. All rights reserved.
//

import UIKit

class DanTangTopicController: UIViewController ,UITableViewDelegate , UITableViewDataSource,DTHomeProviteDelegate{

    var type = Int()
    var item = [DTHomeItem]()
    
    lazy var mainTableView : UITableView = {
        let tableView = UITableView()
        tableView.frame = CGRect.init(x: 0, y: 64+35, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height - (64+35))
        tableView.rowHeight=160
        tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib.init(nibName: "DTHomeTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(self.mainTableView)
        
        self.mainTableView.backgroundColor=DTGlobalColor()
        weak var weakSelf = self
        DTNetWorkTool.shareNetWorkTool.loadHomeInfoData(id: type) { (homeItems) in
            weakSelf?.item = homeItems
            weakSelf?.mainTableView.reloadData()
        }
        
    }
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return item.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let homeCell = tableView.dequeueReusableCell(withIdentifier: "cell") as? DTHomeTableViewCell
        homeCell?.homeItem=item[indexPath.row]
        homeCell?.delegate=self
        return homeCell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let Controller = DTDetaiViewController()
        Controller.homeItem = item[indexPath.row]
        Controller.title = "攻略详情"
        navigationController?.pushViewController(Controller, animated: true)
        
    }
    
    func homeCellDidProviteButton(button: UIButton) {
        print("点击了喜欢按钮，登陆")
    }
  
}
