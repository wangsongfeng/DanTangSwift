# DanTangSwift
单糖项目 Swift练习


// 10.12日
//1,终于解决 tababrItem图片不显示的问题，，主要Asset 出问题了，删了 ，重新添加一个新的Asset就行了，

//2.Swift cocoapods，主要用的OC 的第三方，所以Swift 要用时 ，要创建桥接文件，brage-header

//3.FDFullscreenPopGesture，，为导航页，滑动跳转的 比较好的第三方 ，，OC 也可以用 ，一直想用的





// 10月14日


//1.主要做了 界面 搭建 ，数据请求，还有 单品界面的 界面搭建，数据请求

// 2.数据请求 类比OC的AF NetWork ing ，Swift 主要为 Alamofire

Alamofire主界调用 request 去做一系列的操作

/**
*    url : 数据接口
*    method ： 分为 .post   .get
*    parameters : 拼接数据字典
*    encoding ：URLEncoding.default
*    headers  ： //请求头
        let requestHeader:HTTPHeaders = [
        "Authorization": "Basic QWxhZGRpbjpvcGVuIHNlc2FtZQ==",
        "Accept": "application/json"
        ];
**/

Alamofire.request(url, method: .get, parameters: params, encoding: URLEncoding.default, headers: requestHeader).responseJSON { (responsed) in

}

//3. SwiftyJSON 的第三方 ，类比OC的MJExtension

直接 JSON（数据）


//4 .. Swift 中的Set get 类比OC 中的 @property（）   -（void）set:()

Swift 中
var view : UIView? {
didSet {
}
}


