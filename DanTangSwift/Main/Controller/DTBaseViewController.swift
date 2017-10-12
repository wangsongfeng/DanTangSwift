//
//  DTBaseViewController.swift
//  DanTangSwift
//
//  Created by apple on 2017/10/12.
//  Copyright © 2017年 yangchao. All rights reserved.
//

import UIKit
import SVProgressHUD
import FDFullscreenPopGesture
class DTBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = DTGlobalColor()
       navigationController?.fd_prefersNavigationBarHidden = true
        
        
    }

   

}
