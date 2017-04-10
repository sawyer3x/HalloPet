//
//  HPConstant.swift
//  HalloPet
//
//  Created by sawyer3x on 17/4/2.
//  Copyright © 2017年 sawyer3x. All rights reserved.
//

import UIKit

//MARK: - 网络请求等定义
// 状态
let HPServiceResponseCode = "level"
// 返回数据DataKey
let HPServiceResponseData = "data"

// 网络成功失败标示
let HPRequestSuccess = "success"
let HPRequestError = "error"
let HPViewMgs = "网络不给力，请稍后重试"

enum HPServiceStatus : Int {
    case HPServiceStatusNormal = 0                            // 正常返回
    case HPServiceStatusBusinessError = 1                     // 业务错误
    //    HPServiceStatusLogicError = 2                        // 內部逻辑错误，如出现此处错误 应联系后台
    //    HPServiceStatusAuthorizeError = 10                   // 未授权
    //    HPServiceStatusAccessDeniedError = 11                // 访问拒绝(非法访问, 比如非手机客户端访问)
    //    HPServiceStatusVersionLowerError = 20                // 版本过低
    case HPServiceStatusDataEmpty = 300                       // 接口数据为空
    case HPServiceStatusJSONDataError                         // 接口数据JSON格式错误
    case HPServiceStatusNotModified = 304                     // 304 数据无修改
    case HPServiceStatusOther                                  // 其他错误
}

//经纬度存储
let HPLongitudeState = "mylongitude"
let HPLatitudeState = "mylatitude"
let HPUserCity = "mycity"

//MARK: - 自定义的通知
///用户登录成功发出的通知
let LoginSuccessNotification = "LoginSuccessNotification"
///用户在新建订单时成功选择客户时发出的通知
let YZHCustomerViewControllerDidSelectCustomerNotification = "YZHCustomerViewControllerDidSelectCustomerNotification"
///用户在新建订单时从库存界面成功获取到购物车数据模型发出的通知
let YZHProductOperationViewGetShoppingCarListModelNotification = "YZHProductOperationViewGetShoppingCarListModelNotification"
///用户在二维码扫描界面成功获取到信息跳转发出的通知
let YZHQRCodeViewGetProductNameNotification = "YZHQRCodeViewGetProductNameNotification"
///产品库存详情控制器dismiss成功后发出的通知
let YZHStockDetailControllerDismissSuccessNotification = "YZHStockDetailControllerDismissSuccessNotification"
///产品库存条件搜索控制器dismiss成功后发出的通知
let YZHStockConSearchControllerDismissSuccessNotification = "YZHStockConSearchControllerDismissSuccessNotification"
///产品库存条件搜索语音识别成功后发出的通知
let YZHStockConSearchControllerSpeechSuccessNotification = "YZHStockConSearchControllerSpeechSuccessNotification"
///长按产品库存Cell库存警告图片发出的通知
let YZHStockProductCellLongPressWarnningImageNotification = "YZHStockProductCellLongPressWarnningImageNotification"


let ScreenW = UIScreen.main.bounds.width
let ScreenH = UIScreen.main.bounds.height

let KeyWindow = UIApplication.shared.keyWindow

let mainColor = UIColor(red: 250 / 255.0, green: 121 / 255.0, blue: 75 / 255.0, alpha: 1.0)
let mainColor_green = UIColor(red: 140 / 255.0, green: 213 / 255.0, blue: 82 / 255.0, alpha: 1.0)
let customGrayColor = UIColor(red: 84 / 255.0, green: 84 / 255.0, blue: 84 / 255.0, alpha: 1.0)
let customBlueColor = UIColor(red: 52 / 255.0, green: 152 / 255.0, blue: 219 / 255.0, alpha: 1.0)
let customBGWhiteColor = UIColor(red: 241 / 255.0, green: 240 / 255.0, blue: 255 / 255.0, alpha: 1.0)


let randomColor = UIColor(red: (CGFloat(arc4random_uniform(255)) / CGFloat(255.0)), green: (CGFloat(arc4random_uniform(255)) / CGFloat(255.0)), blue: (CGFloat(arc4random_uniform(255)) / CGFloat(255.0)), alpha: 1.0)

///hexString转UIColor
func hexStringToUIColor(hex:String) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    
    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }
    
    if ((cString.characters.count) != 6) {
        return UIColor.gray
    }
    
    var rgbValue:UInt32 = 0
    Scanner(string: cString).scanHexInt32(&rgbValue)
    
    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}

/**
 *  纯色生成图片
 *
 *  @param color 颜色
 *
 *  @return 图片
 */
func createImageWithColor(color: UIColor) -> UIImage {
    let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
    UIGraphicsBeginImageContext(rect.size)
    let context: CGContext = UIGraphicsGetCurrentContext()!
    context.setFillColor(color.cgColor)
    context.fill(rect)
    let theImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return theImage!
}

