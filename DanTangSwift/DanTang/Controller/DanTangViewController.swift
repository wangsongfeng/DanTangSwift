//
//  DanTangViewController.swift
//  DanTangSwift
//
//  Created by apple on 2017/10/10.
//  Copyright © 2017年 yangchao. All rights reserved.
//

import UIKit

class DanTangViewController: DTBaseViewController ,UIScrollViewDelegate{

    //标签
    weak var titlesView = UIView()
    //底部红色指示器
    weak var indicatorView = UIView()
    //滑动ScrollView
    weak var contentView = UIScrollView()
    //当前选中的按钮
    weak var selectedBtn = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNav()
        weak var weakSelf = self
        DTNetWorkTool.shareNetWorkTool.loadHomeTopData { (dt_channels) in
            
            for channel in dt_channels {
                let controller = DanTangTopicController()
                controller.title = channel.name!
                controller.type = channel.id!
                weakSelf?.addChildViewController(controller)
                
            }
       
            weakSelf?.setupTitlesView()
            weakSelf?.setupContentview()
      }
        
    }
    //设置标题栏
    func setupTitlesView() -> Void {
        //顶部背景
        let bgView = UIView()
        bgView.frame=CGRect.init(x: 0, y: 64, width: view.width, height: 35)
        view.addSubview(bgView)
        
        //标签
        let titlesView = UIView()
        titlesView.backgroundColor=DTGlobalColor()
        titlesView.frame=CGRect.init(x: 0, y: 0, width: view.width-35, height: 35)
        bgView.addSubview(titlesView)
        self.titlesView=titlesView
        
        //底部红色指示器
        let indicatorView = UIView()
        indicatorView.backgroundColor=DTGlobalRedColor()
        indicatorView.height=2.0
        indicatorView.y=35-2.0
        indicatorView.tag = -1
        self.indicatorView=indicatorView
        
        //最右边的选择按钮
        let arrowButton = UIButton()
        arrowButton.frame=CGRect.init(x: view.width-35, y: 0, width: 35, height: 35)
        arrowButton.setImage(UIImage.init(named: "arrow_index_down_8x4_"), for: .normal)
        arrowButton.addTarget(self, action: #selector(arrowButtonClick), for: .touchUpInside)
        arrowButton.backgroundColor=DTGlobalColor()
        bgView.addSubview(arrowButton)
        
        
        //开始设置按钮
        let count = childViewControllers.count
        let width = (view.width-35)/CGFloat(count)
        let height = 35.0
        for index in 0..<count {
            let button = UIButton()
            button.width=width
            button.height=CGFloat(height)
            button.x = CGFloat(index)*width
            button.y=0
            button.tag=index
            let vc = childViewControllers[index]
            button.setTitle(vc.title, for: .normal)
            button.setTitleColor(UIColor.gray, for: .normal)
            button.setTitleColor(DTGlobalRedColor(), for: .disabled)
            button.titleLabel?.font=UIFont.systemFont(ofSize: 14)
            button.addTarget(self, action: #selector(titlesClick), for: .touchUpInside)
            titlesView.addSubview(button)
            
            if index == 0 {
                button.isEnabled = false
                selectedBtn = button
                button.titleLabel?.sizeToFit()
                indicatorView.width = (button.titleLabel?.width)!
                indicatorView.centerX = button.centerX
            }
        }
        titlesView.addSubview(indicatorView)
    }
    
    
    //  标题按钮点击
    @objc func titlesClick(button : UIButton) -> Void {
        //修改按钮的状态
            selectedBtn?.isEnabled=true
        button.isEnabled = false
        selectedBtn = button
        //标签动画
        UIView.animate(withDuration: 0.25) {
            self.indicatorView?.width = (self.selectedBtn?.titleLabel?.width)!
            self.indicatorView?.centerX = (self.selectedBtn?.centerX)!
        }
    }
    
    //设置ScrollView
    func setupContentview() -> Void {
        automaticallyAdjustsScrollViewInsets = false
        let contentView = UIScrollView()
        contentView.frame = CGRect.init(x: 0, y: 0, width: view.width, height: view.height)
        contentView.delegate=self
        contentView.contentSize = CGSize.init(width: contentView.width * CGFloat(childViewControllers.count), height: 0)
        contentView.isPagingEnabled = true
        view.insertSubview(contentView, at: 0)
        self.contentView = contentView
        scrollViewDidEndScrollingAnimation(contentView)
    }
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        let index = Int(scrollView.contentOffset.x / scrollView.width)
        
        let vc = childViewControllers[index]
        vc.view.x=scrollView.contentOffset.x
        vc.view.y = 0
        vc.view.height = scrollView.height
        scrollView.addSubview(vc.view)
        
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        scrollViewDidEndScrollingAnimation(scrollView)
        let index = Int(scrollView.contentOffset.x / scrollView.width)
        
        let button = titlesView?.subviews[index] as! UIButton
        
        titlesClick(button: button)
        
    }
    //设置导航栏
    
    func setupNav() {
        view.backgroundColor = UIColor.white
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named: "Feed_SearchBtn_18x18_"), style: .plain, target: self, action: #selector(dantangRightBBClick))
    }
    
    @objc func dantangRightBBClick() -> Void {
        print("点击了")
    }
    
    /// 箭头按钮点击
    @objc func arrowButtonClick(button: UIButton) {
        UIView.animate(withDuration: 0.3) {
            button.imageView?.transform = button.imageView!.transform.rotated(by: CGFloat(M_PI))
        }
    }
}
