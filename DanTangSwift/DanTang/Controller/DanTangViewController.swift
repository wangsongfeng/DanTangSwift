//
//  DanTangViewController.swift
//  DanTangSwift
//
//  Created by apple on 2017/10/10.
//  Copyright © 2017年 yangchao. All rights reserved.
//

import UIKit

class DanTangViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let imageView = UIImageView.init(frame: CGRect.init(x: 0, y: 100, width: 100, height: 100))
        
        imageView.image=UIImage(named: "LaunchImage-700")
//        imageView.isHidden=false
        
        view.addSubview(imageView)
    }

}
