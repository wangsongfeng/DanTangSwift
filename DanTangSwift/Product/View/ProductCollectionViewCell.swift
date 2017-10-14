//
//  ProductCollectionViewCell.swift
//  DanTangSwift
//
//  Created by apple on 2017/10/14.
//  Copyright © 2017年 yangchao. All rights reserved.
//

import UIKit
import SDWebImage
class ProductCollectionViewCell: UICollectionViewCell {
    
    var product : ProductModel? {
        didSet {
            let url = product?.cover_image_url
            SDWebImageManager.shared().loadImage(with: NSURL.init(string: url!)! as URL, options: SDWebImageOptions.highPriority, progress: { (receivedSize:Int, expectedSize:Int, targetURL:URL?) in
                
            }) { (image:UIImage?, data:Data?, error:Error? , cacheType:SDImageCacheType, finished:Bool, url:URL?) in
                self.getImageView.image = image
            }
             let title = (product?.favorites_count)!
            likeBtn.setTitle("\(title)", for: .normal)
            titleLable.text = product?.name
            let prices = (product?.price)!
            price.text = "¥" + prices
        }
    }
    
    
    
    @IBOutlet weak var getImageView: UIImageView!
    
    @IBOutlet weak var titleLable: UILabel!
    
    @IBOutlet weak var price: UILabel!
    
    @IBOutlet weak var likeBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()        
    }

}
