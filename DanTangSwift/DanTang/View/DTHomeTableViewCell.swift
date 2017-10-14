//
//  DTHomeTableViewCell.swift
//  DanTangSwift
//
//  Created by apple on 2017/10/14.
//  Copyright © 2017年 yangchao. All rights reserved.
//

import UIKit
import SDWebImage

protocol DTHomeProviteDelegate {
    func homeCellDidProviteButton(button : UIButton)
}

class DTHomeTableViewCell: UITableViewCell {
    
    var delegate : DTHomeProviteDelegate?
    
    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var forverButton: UIButton!
    @IBOutlet weak var titleLables: UILabel!
    
    var homeItem: DTHomeItem? {
        didSet {
            let url = homeItem?.cover_image_url
            SDWebImageManager.shared().loadImage(with: NSURL.init(string: url!)! as URL, options: SDWebImageOptions.highPriority, progress: { (receivedSize:Int, expectedSize:Int, targetURL:URL?) in
                let pro = Float(receivedSize)/Float(expectedSize)*100
                print("进度..\(pro)%")
            }) { (image:UIImage?, data:Data?, error:Error? , cacheType:SDImageCacheType, finished:Bool, url:URL?) in
                self.bgImageView.image=image
            }
            
            titleLables.text = homeItem?.title
            let title = (homeItem?.likes_count)!
            
            forverButton.setTitle("\(title)", for: .normal)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        forverButton.layer.cornerRadius = forverButton.height*0.5
        forverButton.layer.masksToBounds = true
        forverButton.layer.rasterizationScale = UIScreen.main.scale
        forverButton.layer.shouldRasterize=true
        
        bgImageView.layer.cornerRadius = 8
        bgImageView.layer.masksToBounds = true
        bgImageView.layer.shouldRasterize = true
        bgImageView.layer.rasterizationScale = UIScreen.main.scale
    }


    @IBAction func btnClick(_ sender: UIButton) {
        
        delegate?.homeCellDidProviteButton(button: sender)
    }
    
}
