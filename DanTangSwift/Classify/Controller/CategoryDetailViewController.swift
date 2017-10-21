//
//  CategoryDetailViewController.swift
//  DanTangSwift
//
//  Created by apple on 2017/10/22.
//  Copyright © 2017年 yangchao. All rights reserved.
//

import UIKit

class CategoryDetailViewController: UIViewController {

    var type = String()
    var posts = [CategoryCellectPost]()
    var id: Int?
    lazy var mainTableView : UITableView = {
        let tableView = UITableView()
        tableView.frame = CGRect.init(x: 0, y: 64, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height - (64+35))
        tableView.rowHeight=160
        tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib.init(nibName: "CategoryDetailTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
self.view .addSubview(self.mainTableView)
        
        weak var weakSelf = self
        if type == "专题合集" {
            DTNetWorkTool.shareNetWorkTool.loadCollectPosts(id: id!, finished: { (posts) in
                weakSelf?.posts=posts
                weakSelf?.mainTableView.reloadData()
                
            })
        }else if type == "风格品类" {
            DTNetWorkTool.shareNetWorkTool.loadStyleOrCategoryInfo(id: id!, finished: { (posts) in
                weakSelf?.posts=posts
                weakSelf?.mainTableView.reloadData()
            })
        }

    }

}

extension CategoryDetailViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")as! CategoryDetailTableViewCell
        cell.posts = posts[indexPath.row]
        return cell
    }
    
    
}
