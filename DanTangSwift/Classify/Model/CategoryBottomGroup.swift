//
//  CategoryBottomGroup.swift
//  DanTangSwift
//
//  Created by apple on 2017/10/21.
//  Copyright © 2017年 yangchao. All rights reserved.
//

import UIKit

class CategoryBottomGroup: NSObject {

    var status: Int?
    var group_id: Int?
    var id: Int?
    var items_count: Int?
    var order: Int?
    var icon_url: String?
    var name: String?
    
    init(dict: [String: Any]) {
        super.init()
        status = dict["status"]as? Int
        group_id = dict["group_id"]as? Int
        items_count = dict["items_count"]as? Int
        id = dict["id"] as? Int
        order = dict["order"] as? Int
        icon_url = dict["icon_url"]as? String
        name = dict["name"]as? String
    }
    
}
