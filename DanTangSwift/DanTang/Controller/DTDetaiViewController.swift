//
//  DTDetaiViewController.swift
//  DanTangSwift
//
//  Created by apple on 2017/10/14.
//  Copyright © 2017年 yangchao. All rights reserved.
//

import UIKit
import SVProgressHUD
class DTDetaiViewController: DTBaseViewController ,UIWebViewDelegate{
    var homeItem : DTHomeItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let webView = UIWebView()
        webView.frame=view.bounds
        webView.scalesPageToFit=true
        webView.dataDetectorTypes = .all
        let url = NSURL.init(string: (homeItem?.content_url)!)
        let request = URLRequest.init(url: url! as URL)
        webView.loadRequest(request)
        webView.delegate=self
        view.addSubview(webView)
        
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        SVProgressHUD.setStatus("正在加载...")
        
        //风火轮：主要用于在执行某个长时间动作时，提示用户耐心等待动作的执行
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    func webViewDidFinishLoad(_ webView: UIWebView) {
        SVProgressHUD.dismiss()
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        return true
    }
}
