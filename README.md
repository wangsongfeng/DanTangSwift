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




10.20日

Swift 可选类型是一个 难点 ，，也是一个 容易忽略的 地方 ，，每次书写 ，记得是可选类型 ，要解包



//swift 是一个强类型语言 ，前后 类型 必须一致 ，，所以 swift中不能 赋值 为 nil
//怎样在swift中 赋值 为 nil

// 这就需要用到 可选 类型

//swift中有规定，对象中的任何属性在创建对象时，必须有明确的初始化值

var name = "wang"

//方式1 常规 方法

var name1 : Optional<String> = nil
name1
//  语法糖

var name2 : String? = nil

//个可选类型赋值

name2 = "wang"
//print(name2!)

//可选类型 + ！ ：强制解包
//强制解包为危险操作

if name2 != nil  {
//    print(name2!)
}


if let name2 = name2 {
print(name2)
}


var string1 : String = "This is string"
//string1 = nil  - Swift中, 当声明一个类的属性时, 属性默认也是non-optional的

class MyClass {
var name : String = "Lv"
//    var age : Int     //Swift 中 ，声明属性  必须有初始值

// Swift中引入了可选类型(optional type)来解决这一问题. 它的定义是通过在类型生命后加加一个`?`操作符完成的.

var age : Int?



func findStockCode(company: String) -> String? {
if (company == "Apple") {
return "AAPL"
} else if (company == "Google") {
return "GOOG"
}
return nil
}

}


















