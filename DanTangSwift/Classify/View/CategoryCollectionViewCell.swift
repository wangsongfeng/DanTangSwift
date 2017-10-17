//
//  CategoryCollectionViewCell.swift
//  DanTangSwift
//
//  Created by apple on 2017/10/17.
//  Copyright © 2017年 yangchao. All rights reserved.
//

import UIKit
import SDWebImage
class CategoryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageViewCell: UIImageView!
    
    var collionItem : DTCollections? {
        didSet{
            let url = collionItem?.banner_image_url
            SDWebImageManager.shared().loadImage(with: NSURL.init(string: url!)! as URL, options: SDWebImageOptions.highPriority, progress: { (receivedSize:Int, expectedSize:Int, targetURL:URL?) in
                let pro = Float(receivedSize)/Float(expectedSize)*100
                print("进度..\(pro)%")
            }) { (image:UIImage?, data:Data?, error:Error? , cacheType:SDImageCacheType, finished:Bool, url:URL?) in
                self.imageViewCell.image=image
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
