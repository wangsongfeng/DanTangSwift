//
//  CategoryViewController.swift
//  DanTangSwift
//
//  Created by apple on 2017/10/10.
//  Copyright © 2017年 yangchao. All rights reserved.
//

import UIKit

class CategoryViewController: DTBaseViewController {

    
    //懒加载
    private lazy var scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.frame = CGRect.init(x: 0, y: 0, width: SCREENW, height: SCREENH)
        scrollView.isScrollEnabled = true
        scrollView.backgroundColor = DTGlobalColor()
        return scrollView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named: "Feed_SearchBtn_18x18_"), style: .plain, target: self, action: #selector(categortRightBarBtnItem))
        setupScrollView()
    }
    
    private func setupScrollView() {
        view.addSubview(scrollView)
        let headerViewController = CategoryHeaderViewController()
        addChildViewController(headerViewController)
        let topView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: SCREENW, height: 135))
        scrollView.addSubview(topView)
        
        let headerVC = childViewControllers[0]
        scrollView.addSubview(headerVC.view)
        
    }
    //搜索按钮
    @objc func categortRightBarBtnItem() -> Void {
        print("点击了搜索按钮")
    }
}
