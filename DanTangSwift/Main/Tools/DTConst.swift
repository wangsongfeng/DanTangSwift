//
//  DTConst.swift
//  DanTangSwift
//
//  Created by apple on 2017/10/9.
//  Copyright © 2017年 yangchao. All rights reserved.
//

import UIKit

/// 服务器地址
let BASE_URL = "http://api.dantangapp.com/"
/// 屏幕的宽
let SCREENW = UIScreen.main.bounds.size.width
/// 屏幕的高
let SCREENH = UIScreen.main.bounds.size.height

func DTColor(r:CGFloat, g:CGFloat, b:CGFloat ,a:CGFloat) ->UIColor {
    return UIColor.init(red: r / 255.0, green: g/255.0, blue: b/255.0, alpha: a)
}

///红色
func DTGlobalRedColor()-> UIColor {
    return DTColor(r: 245, g: 80, b: 83, a: 1.0)
}

//背景灰色
func DTGlobalColor()-> UIColor {
    return DTColor(r: 240, g: 240, b: 240, a: 1.0)
}
