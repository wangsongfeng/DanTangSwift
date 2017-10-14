//
//  DTNavigationController.swift
//  DanTangSwift
//
//  Created by apple on 2017/10/9.
//  Copyright © 2017年 yangchao. All rights reserved.
//

// 关于TabBarItem和NavBarItem的属性设置Attributes

//appearance 类似于统一修改的意思

//2使用例子
//
//        let item = UITabBarItem.appearance()
//        item .setTitleTextAttributes([NSAttributedStringKey.font: UIFont.systemFont(ofSize: 20), [NSAttributedStringKey.foregroundColor : UIColor.red]], for:UIControlState.normal)

//3 常规的属性没有一一验证

//1.NSKernAttributeName: @10 调整字句 kerning 字句调整
//2.NSFontAttributeName : [UIFont systemFontOfSize:_fontSize] 设置字体

// 3.NSForegroundColorAttributeName :[UIColor redColor] 设置文字颜色
// 4.NSParagraphStyleAttributeName : paragraph 设置段落样式
// 5.

//        NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
//        paragraph.alignment = NSTextAlignmentCenter;
//6.NSBackgroundColorAttributeName: [UIColor blackColor] 设置背景颜色
//7.NSStrokeColorAttributeName设置文字描边颜色，需要和NSStrokeWidthAttributeName设置描边宽度，这样就能使文字空心.

// NSStrokeWidthAttributeName这个属性所对应的值是一个 NSNumber 对象(小数)。该值改变描边宽度（相对于字体size 的百分比）。默认为 0，即不改变。正数只改变描边宽度。负数同时改变文字的描边和填充宽度。例如，对于常见的空心字，这个值通常为3.0。

//同时设置了空心的两个属性，并且NSStrokeWidthAttributeName属性设置为整数，文字前景色就无效果了


import UIKit

class DTNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let navBar = UINavigationBar.appearance()
        navBar.barTintColor=DTGlobalRedColor()
        navBar.tintColor=UIColor.white
//        navBar.titleTextAttributes =  [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont.systemFont(ofSize: 20)]

    }

    override  func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed=true
          viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "checkUserType_backward_9x15_"), style: .plain, target: self, action: #selector(navigationClick))
            
        }
        super.pushViewController(viewController, animated: true)
        
    }
    
    @objc func navigationClick() {
        popViewController(animated: true)
    }

}
