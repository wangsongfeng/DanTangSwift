//
//  CategoryDetailTableViewCell.swift
//  DanTangSwift
//
//  Created by apple on 2017/10/22.
//  Copyright © 2017年 yangchao. All rights reserved.
//

import UIKit
import SDWebImage
class CategoryDetailTableViewCell: UITableViewCell {
    @IBOutlet weak var faverButton: UIButton!
    
    @IBOutlet weak var bgImageView: UIImageView!
    
    @IBOutlet weak var textLable: UILabel!
    
    var posts: CategoryCellectPost? {
        didSet{
            let url = posts?.cover_image_url
            SDWebImageManager.shared().loadImage(with: NSURL.init(string: url!)! as URL, options: SDWebImageOptions.highPriority, progress: { (receivedSize:Int, expectedSize:Int, targetURL:URL?) in
                let pro = Float(receivedSize)/Float(expectedSize)*100
                print("进度..\(pro)%")
            }) { (image:UIImage?, data:Data?, error:Error? , cacheType:SDImageCacheType, finished:Bool, url:URL?) in
                self.bgImageView.image=image
            }
            
            textLable.text = posts?.title
            let title = (posts?.likes_count)!
            
            faverButton.setTitle("\(title)", for: .normal)
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        faverButton.layer.cornerRadius = faverButton.height*0.5
        faverButton.layer.masksToBounds = true
        faverButton.layer.rasterizationScale = UIScreen.main.scale
        faverButton.layer.shouldRasterize=true
        
        bgImageView.layer.cornerRadius = 8
        bgImageView.layer.masksToBounds = true
        bgImageView.layer.shouldRasterize = true
        bgImageView.layer.rasterizationScale = UIScreen.main.scale
    
    
    }
    
}
