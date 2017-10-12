//
//  DanTangViewController.swift
//  DanTangSwift
//
//  Created by apple on 2017/10/10.
//  Copyright © 2017年 yangchao. All rights reserved.
//

import UIKit

class DanTangViewController: DTBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let viewController = RegiseViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
        
        
    }
}
