//
//  CategoryButton.swift
//  DanTangSwift
//
//  Created by apple on 2017/10/22.
//  Copyright © 2017年 yangchao. All rights reserved.
//

import UIKit
import SDWebImage
class CategoryButton: UIButton {

    var group: CategoryBottomGroup?{
        didSet{
            let url = group?.icon_url
            SDWebImageManager.shared().loadImage(with: NSURL.init(string: url!)! as URL, options: SDWebImageOptions.highPriority, progress: { (receivedSize:Int, expectedSize:Int, targetURL:URL?) in
             
            }) { (image:UIImage?, data:Data?, error:Error? , cacheType:SDImageCacheType, finished:Bool, url:URL?) in
                self.imageView?.image=image
            }
            
            titleLabel?.text = group?.name
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        titleLabel?.textAlignment = .center

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // 调整图片
        imageView?.x = 10
        imageView?.y = 0
        imageView?.width = self.width - 20
        imageView?.height = imageView!.width
        // 调整文字
        titleLabel?.x = 0
        titleLabel?.y = imageView!.height
        titleLabel?.width = self.width
        titleLabel?.height = self.height - self.titleLabel!.y
    
    }
}
