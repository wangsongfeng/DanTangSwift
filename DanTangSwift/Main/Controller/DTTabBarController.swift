//
//  DTTabBarController.swift
//  DanTangSwift
//
//  Created by apple on 2017/10/10.
//  Copyright © 2017年 yangchao. All rights reserved.
//

import UIKit

class DTTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let tabBar = UITabBar.appearance()
        tabBar.tintColor=DTColor(r: 245, g: 90, b: 93, a: 1.0)
        addChildViewControllers()
       
    }
    
    private func addChildViewControllers () {

        addChildViewControllers(controller: DanTangViewController(), title: "单糖", imageName: "TabBar_home_23x23_")
        addChildViewControllers(controller: ProductViewController(), title: "单品", imageName: "TabBar_gift_23x23_")
        addChildViewControllers(controller: CategoryViewController(), title: "分类", imageName: "TabBar_category_23x23_")
        addChildViewControllers(controller: MeViewController(), title: "我的", imageName: "TabBar_me_boy_23x23_")
    }
    private func addChildViewControllers(controller : UIViewController, title : String, imageName : String) {
        var imageT = UIImage.init(named: imageName)
        imageT=imageT?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        
        controller.tabBarItem.image = imageT
        
        var selectedimage = UIImage.init(named: imageName + "selected")
        selectedimage=selectedimage?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        controller.tabBarItem.selectedImage = selectedimage
        controller.title=title
        let nav = DTNavigationController.init(rootViewController: controller)
        addChildViewController(nav)
    }
}
