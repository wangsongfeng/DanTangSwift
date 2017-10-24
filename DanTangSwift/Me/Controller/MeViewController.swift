//
//  MeViewController.swift
//  DanTangSwift
//
//  Created by apple on 2017/10/10.
//  Copyright © 2017年 yangchao. All rights reserved.
//

import UIKit

class MeViewController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        
    }
    
    private func setupTableView() {
        let tableView = UITableView()
        tableView.frame = view.bounds
        view.addSubview(tableView)
        tableView.separatorStyle = .none
        tableView.delegate = self;
        tableView.dataSource = self
        tableView.tableHeaderView = headerView
    }

    private lazy var headerView : DTMeHeaderView = {
        let headerView = DTMeHeaderView()
        headerView.frame = CGRect.init(x: 0, y: 0, width: SCREENW, height: 200)
       
        return headerView
    }()
    
  
}

extension MeViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init(style: .default, reuseIdentifier: "cell")
        return cell
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offSetY = scrollView.contentOffset.y
        if offSetY < 0 {
            var tempFrame = headerView.bgImageView.frame
            tempFrame.origin.y = offSetY
            tempFrame.size.height = 200 - offSetY
            headerView.bgImageView.frame = tempFrame
            
        }
        
    }

}
