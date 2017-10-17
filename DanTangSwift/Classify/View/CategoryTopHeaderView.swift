//
//  CategoryTopHeaderView.swift
//  DanTangSwift
//
//  Created by apple on 2017/10/17.
//  Copyright © 2017年 yangchao. All rights reserved.
//

import UIKit

protocol CategoryTopHeaderViewDelegate : NSObjectProtocol {
    func topViewDidClickWithButton(button : UIButton)
}
class CategoryTopHeaderView: UIView {

    weak var delegate : CategoryTopHeaderViewDelegate?
    
    @IBAction func CheckAll(_ sender: Any) {
        delegate?.topViewDidClickWithButton(button: sender as! UIButton)
    }
}
