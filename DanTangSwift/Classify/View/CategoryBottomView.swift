//
//  CategoryBottomView.swift
//  DanTangSwift
//
//  Created by apple on 2017/10/21.
//  Copyright © 2017年 yangchao. All rights reserved.
//

import UIKit
import SDWebImage

protocol CategoryBottomViewDelegate : NSObjectProtocol {
    func bottomViewBtnClick(button : UIButton)
}

class CategoryBottomView: UIView {

    weak var delegate : CategoryBottomViewDelegate?
    
    var outGroups = [Any]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        weak var weakSelf = self
        DTNetWorkTool.shareNetWorkTool.loadCategoryGroup { (outGroups) in
            weakSelf?.outGroups=outGroups
            weakSelf?.setUI()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        let topGroups = outGroups[0]as! NSArray
        let bottomGroups = outGroups[1]as! NSArray
        print(topGroups.count)
        //风格
        let topView = UIView()
        topView.width = SCREENW
        topView.backgroundColor=DTGlobalColor()
        addSubview(topView)
        let styleLable = setupLable(title: "风格")
        topView.addSubview(styleLable)
        
        for index in 0..<topGroups.count {
            let group = topGroups[index]as! CategoryBottomGroup
            let button = setupButtom(index: index, group: group)
            topView.addSubview(button)
            if index == topGroups.count-1 {
                topView.height = button.frame.maxY + 10.0
            }
        }
        
        //品类
        let bottomView = UIView()
        bottomView.width = SCREENW
        bottomView.y = topView.frame.maxY + 10.0
        bottomView.backgroundColor=DTGlobalColor()
        addSubview(bottomView)
        let styleLable1 = setupLable(title: "品类")
        bottomView.addSubview(styleLable1)
        
        for index in 0..<bottomGroups.count {
            let group = bottomGroups[index]as! CategoryBottomGroup
            let button = setupButtom(index: index, group: group)
            bottomView.addSubview(button)
            if index == topGroups.count-1 {
                bottomView.height = button.frame.maxY + 10.0
            }
        }
        
    }
   
}

extension CategoryBottomView {
    private func setupLable(title: String) -> UILabel {
        let styleLable = UILabel.init(frame: CGRect.init(x: 10, y: 0, width: SCREENW-10, height: 40))
        styleLable.text = title
        styleLable.textColor = DTColor(r: 0, g: 0, b: 0, a: 0.6)
        styleLable.font = UIFont.systemFont(ofSize: 16)
        return styleLable
    }
    
    private func setupButtom(index: Int, group: CategoryBottomGroup) -> CategoryButton {
        let buttonW: CGFloat = SCREENW/4
        let buttonH: CGFloat = buttonW
        let styleLableH: CGFloat = 40
        
        let button = CategoryButton()
        button.group = group
        button.width = buttonW
        button.height = buttonH
        button.x = buttonW * CGFloat(index % 4)
        button.y = buttonH * CGFloat(index / 4) + styleLableH
        if index > 3 {
            button.y = buttonH * CGFloat(index / 4) + styleLableH + 10.0
        }
        SDWebImageManager.shared().loadImage(with: NSURL.init(string:group.icon_url!)! as URL, options: SDWebImageOptions.highPriority, progress: { (receivedSize:Int, expectedSize:Int, targetURL:URL?) in
            
        }) { (image:UIImage?, data:Data?, error:Error? , cacheType:SDImageCacheType, finished:Bool, url:URL?) in
            button .setImage(image, for: .normal)
        }
        
        button.setTitle(group.name, for: .normal)
        button.tag = group.id!
        button.titleLabel?.font=UIFont.systemFont(ofSize: 15)
        button.addTarget(self, action: #selector(groupBtnClick), for: .touchUpInside)
        button.setTitleColor(DTColor(r: 0, g: 0, b: 0, a: 0.6), for: .normal)
        return button
    }
}
extension CategoryBottomView {
    @objc func groupBtnClick(button : UIButton) -> Void {
        delegate?.bottomViewBtnClick(button: button)
    }
}
