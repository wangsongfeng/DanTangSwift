//
//  DTNetWorkTool.swift
//  DanTangSwift
//
//  Created by apple on 2017/10/12.
//  Copyright © 2017年 yangchao. All rights reserved.
//

import UIKit
import SVProgressHUD
import Alamofire
import SwiftyJSON
class DTNetWorkTool: NSObject {

    static let shareNetWorkTool = DTNetWorkTool()
    
    // 获取上部按钮 数据
    func loadHomeTopData(callBack : @escaping (_ DT_Channels : [DTChannel]) -> ()) -> Void {
        let url = BASE_URL + "v2/channels/preset"
        let params = ["gender" : 1, "generation" : 1]
        //请求头
        let requestHeader:HTTPHeaders = [
            "Authorization": "Basic QWxhZGRpbjpvcGVuIHNlc2FtZQ==",
            "Accept": "application/json"
        ];
        Alamofire.request(url, method: .get, parameters: params, encoding: URLEncoding.default, headers: requestHeader).responseJSON { (responsed) in
            
            guard responsed.result.isSuccess else {
                SVProgressHUD.showError(withStatus: "加载失败")
                return
            }
            if let value = responsed.result.value {

                let dict = JSON(value)
                let code = dict["code"].intValue
                let message = dict["message"].stringValue
                guard code == 200 else {
                    SVProgressHUD.showInfo(withStatus: message)
                    return
                }
                SVProgressHUD.dismiss()
                let data = dict["data"].dictionary
                if let channels = data!["channels"]?.arrayObject
                {
                    var dt_channels = [DTChannel]()
                    for channeal in channels {
                        let dt_channeal = DTChannel.init(dict: channeal as! [String : Any])
                        dt_channels.append(dt_channeal)
                    }
                    
                    callBack(dt_channels)
                    
                }
            }
        }
        
    }
    
    //获取首页数据
    
    func loadHomeInfoData(id : Int, callBack: @escaping (_ homeItem : [DTHomeItem])->()) -> Void {
        let url = BASE_URL + "v1/channels/\(id)/items"
        let params = ["gender":1, "generation":1, "limit":20, "offset": 0]
        //请求头
        let requestHeader:HTTPHeaders = [
            "Authorization": "Basic QWxhZGRpbjpvcGVuIHNlc2FtZQ==",
            "Accept": "application/json"
        ];
        Alamofire.request(url, method: .get, parameters: params, encoding: URLEncoding.default, headers: requestHeader).responseJSON { (responseObject) in
            guard responseObject.result.isSuccess else {
                SVProgressHUD.showError(withStatus: "加载失败")
                return
            }
            if let value = responseObject.result.value {
                let dict = JSON(value)
                let code = dict["code"].intValue
                let message = dict["message"].stringValue
                guard code == 200 else {
                    SVProgressHUD.showInfo(withStatus: message)
                    return
                }
                
                let data = dict["data"].dictionary
                
                if let items = data!["items"]?.arrayObject {
                    var homeItems = [DTHomeItem]()
                    for item in items {
                        let homeItem = DTHomeItem.init(dict: item as! [String : Any])
                        homeItems.append(homeItem)
                        
                    }
                    callBack(homeItems)
                }
            
            }
        }
    }
    
    //获取单品数据
    
    func loadProductData(callback : @escaping (_ productModel : [ProductModel]) -> ()) -> Void {
        SVProgressHUD.show(withStatus: "正在加载...")
        let url = BASE_URL + "v2/items"
        let params = ["gender": 1,
                      "generation": 1,
                      "limit": 20,
                      "offset": 0]
        //请求头
        let requestHeader:HTTPHeaders = [
            "Authorization": "Basic QWxhZGRpbjpvcGVuIHNlc2FtZQ==",
            "Accept": "application/json"
        ];
        Alamofire.request(url, method: .get, parameters: params, encoding: URLEncoding.default, headers: requestHeader).responseJSON { (responseObject) in
            guard responseObject.result.isSuccess else {
                SVProgressHUD.showError(withStatus: "加载失败")
                return
            }
            
            if let value = responseObject.result.value {
                let dict = JSON(value)
                let code = dict["code"].intValue
                let message = dict["message"].stringValue
                guard code == 200 else {
                    SVProgressHUD.showInfo(withStatus: message)
                    return
                }
                SVProgressHUD.dismiss()
                
                if let data = dict["data"].dictionary {
                    if let items = data["items"]?.arrayObject {
                        var itemsArray = [ProductModel]()
                        for item in items {
                            let itemDic = item as? [String:Any]
                            if let itemData = itemDic!["data"] {
                                let product = ProductModel.init(dict: itemData as! [String : AnyObject] )
                                itemsArray.append(product)
                                
                            }
                            
                        }
                        callback(itemsArray)
                    }
                    
                }
            }
        }
        
    }
    
    
    //分类界面 专题数据
    func loadCategoryCollect(limit : Int, callBack : @escaping (_ collectionItems : [DTCollections])->()) -> Void {
        SVProgressHUD.show(withStatus: "正在加载...")
        let url = BASE_URL + "v1/collections"
        let params = ["limit": limit,
                      "offset": 0]
        //请求头
        let requestHeader:HTTPHeaders = [
            "Authorization": "Basic QWxhZGRpbjpvcGVuIHNlc2FtZQ==",
            "Accept": "application/json"
        ];
        Alamofire.request(url, method: .get, parameters: params, encoding: URLEncoding.default, headers: requestHeader).responseJSON { (responseObject) in
            guard responseObject.result.isSuccess else {
                SVProgressHUD.showError(withStatus: "加载失败")
                return
            }
            
            if let value = responseObject.value {
                let dict = JSON(value)
                let code = dict["code"].intValue
                let message = dict["message"].stringValue
                guard code == 200 else {
                    SVProgressHUD.showInfo(withStatus: message)
                    return
                }
                
                SVProgressHUD.dismiss()
                if let data  = dict["data"].dictionary {
                    if let collectItem = data["collections"]?.arrayObject
                    {
                        var colectionItems = [DTCollections]()
                        for item in collectItem {
                            let coll = DTCollections.init(dict: item as! [String : Any])
                            colectionItems.append(coll)
                        }
                        callBack(colectionItems)
                    }
                }
            }
        }
    }
    
    
    //分类界面 风格，品类
    func loadCategoryGroup(callBack:@escaping (_ outGroups : [Any])->()) -> Void {
        SVProgressHUD.show(withStatus: "正在加载中...")
        let url = BASE_URL + "v1/channel_groups/all"
        //请求头
        let requestHeader:HTTPHeaders = [
            "Authorization": "Basic QWxhZGRpbjpvcGVuIHNlc2FtZQ==",
            "Accept": "application/json"
        ];
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: requestHeader).responseJSON { (responseObject) in
            guard responseObject.result.isSuccess else {
                SVProgressHUD.show(withStatus: "加载失败...")
                return
            }
            if let value = responseObject.result.value {
                let dict = JSON(value)
                let code = dict["code"].intValue
                let message = dict["message"].stringValue
                guard code == 200 else {
                    SVProgressHUD.show(withStatus: message)
                    return
                }
                
                SVProgressHUD.dismiss()
                if let data = dict["data"].dictionary {
                    let channel_groups = data["channel_groups"]?.arrayObject
                    var outGroups = [Any]()
                    
                    for channel_group in channel_groups! {
                        var inGroups = [CategoryBottomGroup]()
                        let channel_group_dict = channel_group as! [String : Any]
                        let channels = channel_group_dict["channels"] as! [Any]
                        for channel in channels {
                            let  group = CategoryBottomGroup.init(dict: channel as! [String : Any]);                            inGroups.append(group)
                        }
                        outGroups.append(inGroups as Any)
                    }
                    callBack(outGroups)
                }
            }
        }
    }
    
    
    //分类界面 -》下一层列表
    
    func loadCollectPosts(id: Int, finished: @escaping (_ posts: [CategoryCellectPost])->()) -> Void {
        SVProgressHUD.show(withStatus: "正在加载...")
        let url = BASE_URL + "v1/collections/\(id)/posts"
        let params = ["gender": 1,
                      "generation": 1,
                      "limit": 20,
                      "offset": 0]
        //请求头
        let requestHeader:HTTPHeaders = [
            "Authorization": "Basic QWxhZGRpbjpvcGVuIHNlc2FtZQ==",
            "Accept": "application/json"
        ];
        Alamofire.request(url, method: .get, parameters: params, encoding: URLEncoding.default, headers: requestHeader).responseJSON { (responseObject) in
            guard responseObject.result.isSuccess else {
                SVProgressHUD.show(withStatus: "加载失败...")
                return
            }
            if let value = responseObject.result.value {
                let dict = JSON(value)
                let code = dict["code"].intValue
                let message = dict["message"].stringValue
                guard code == 200 else {
                    SVProgressHUD.show(withStatus: message)
                    return
                }
                SVProgressHUD.dismiss()
                if let data = dict["data"].dictionary {
                    if let postsData = data["posts"]?.arrayObject {
                        var posts = [CategoryCellectPost]()
                        
                        for item in postsData {
                            let post = CategoryCellectPost.init(dict: item as! [String : AnyObject])
                            posts.append(post)
                        }
                        finished(posts)
                        
                    }
                }
                
            }
        }
    }
    
     /// 底部 风格品类 -> 列表
    
    func loadStyleOrCategoryInfo(id: Int, finished: @escaping (_ posts:[CategoryCellectPost])->()) {
        SVProgressHUD.show(withStatus: "正在加载...")
        let url = BASE_URL + "v1/channels/\(id)/items"
        let params = ["limit": 20,
                      "offset": 0]
        //请求头
        let requestHeader:HTTPHeaders = [
            "Authorization": "Basic QWxhZGRpbjpvcGVuIHNlc2FtZQ==",
            "Accept": "application/json"
        ];
        Alamofire.request(url, method: .get, parameters: params, encoding: URLEncoding.default, headers: requestHeader).responseJSON { (responseObject) in
            guard responseObject.result.isSuccess else {
                SVProgressHUD.show(withStatus: "加载失败...")
                return
            }
            if let value = responseObject.result.value {
                let dict = JSON(value)
                let code = dict["code"].intValue
                let message = dict["message"].stringValue
                guard code == 200 else {
                    SVProgressHUD.show(withStatus: message)
                    return
                }
                SVProgressHUD.dismiss()
                if let data = dict["data"].dictionary {
                    if let postsData = data["posts"]?.arrayObject {
                        var posts = [CategoryCellectPost]()
                        
                        for item in postsData {
                            let post = CategoryCellectPost.init(dict: item as! [String : AnyObject])
                            posts.append(post)
                        }
                        finished(posts)
                        
                    }
                }
                
            }
        }
    }
    
}
