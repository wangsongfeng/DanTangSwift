//
//  DTChannel.swift
//  DanTangSwift
//
//  Created by apple on 2017/10/12.
//  Copyright © 2017年 yangchao. All rights reserved.
//

import UIKit

class DTChannel: NSObject {

    var editable : Bool?
    var id : Int?
    var name : String?

    init(dict : [String:Any]) {
        id = dict["id"] as?Int
        name=dict["name"]as?String
        editable = dict["editable"]as?Bool
        
        
    }
}
