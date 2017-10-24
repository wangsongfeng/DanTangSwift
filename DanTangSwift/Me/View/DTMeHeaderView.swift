//
//  DTMeHeaderView.swift
//  DanTangSwift
//
//  Created by apple on 2017/10/23.
//  Copyright © 2017年 yangchao. All rights reserved.
//

import UIKit
import SnapKit
class DTMeHeaderView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        addSubview(bgImageView)
        addSubview(messagebutton)
        addSubview(settingButton)
        addSubview(iconButton)
        addSubview(nameLable)
        
        //布局
        bgImageView.snp.makeConstraints { (make) in
            make.left.bottom.right.equalTo(self)
            make.top.equalTo(-20)
        }
        
        settingButton.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize.init(width: 44, height: 44))
            make.right.equalTo(self)
            make.top.equalTo(0)
        }
        
        messagebutton.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize.init(width: 44, height: 44))
            make.left.equalTo(self)
            make.top.equalTo(settingButton.snp.top)
        }
        
        iconButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(SCREENW*0.5)
            make.size.equalTo(CGSize.init(width: 75, height: 75))
            make.bottom.equalTo(nameLable.snp.top).offset(-10)
        }
        
        nameLable.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.snp.bottom).offset(-3*10)
            make.left.right.equalTo(self)
            make.height.equalTo(20)
        }
        
    }
    
    //懒加载背景图片
     lazy var bgImageView : UIImageView = {
       let bgImageView = UIImageView()
        bgImageView.contentMode = .scaleAspectFill
        bgImageView.image = UIImage.init(named: "Me_ProfileBackground")
        return bgImageView
    }()
    //懒加载左上角消息按钮
     lazy var messagebutton : UIButton = {
       let messagebutton = UIButton()
        messagebutton.setImage(UIImage.init(named: "Me_message_20x20_"), for: .normal)
        return messagebutton
    }()
    //懒加载右上角 设置按钮
     lazy var settingButton : UIButton = {
       let settingButton = UIButton()
        settingButton.setImage(UIImage.init(named: "Me_settings_20x20_"), for: .normal)
        return settingButton
    }()
    
    //懒加载头像按钮
    
     lazy var iconButton : UIButton = {
       let iconButton = UIButton()
        iconButton.setBackgroundImage(UIImage.init(named: "Me_AvatarPlaceholder_75x75_"), for: .normal)
        iconButton.layer.cornerRadius = iconButton.width * 0.5
        iconButton.layer.masksToBounds = true
        return iconButton
    }()
    
    //懒加载 昵称
     lazy var nameLable : UILabel = {
        let nameLable = UILabel()
        nameLable.text = "王松锋"
        nameLable.textColor = UIColor.white
        nameLable.font = UIFont.systemFont(ofSize: 15.0)
        nameLable.textAlignment = .center
        return nameLable
    }()
    
}
