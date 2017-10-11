//
//  DTConst.swift
//  DanTangSwift
//
//  Created by apple on 2017/10/9.
//  Copyright © 2017年 yangchao. All rights reserved.
//

import UIKit

func DTColor(r:CGFloat, g:CGFloat, b:CGFloat ,a:CGFloat) ->UIColor {
    return UIColor.init(red: r / 255.0, green: g/255.0, blue: b/255.0, alpha: a)
}

///红色
func DTGlobalRedColor()-> UIColor {
    return DTColor(r: 245, g: 80, b: 83, a: 1.0)
}
