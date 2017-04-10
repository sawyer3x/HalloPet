//
//  HPRequestBodyInfo.swift
//  HalloPet
//
//  Created by sawyer3x on 17/4/10.
//  Copyright © 2017年 sawyer3x. All rights reserved.
//

import UIKit

class HPRequestBodyInfo: NSObject {

    var requestCode: Int?

    var requestBodyDic: [String: String]?

    var errorCode: String?

    var errorMsg: String?
    
    ///单例
    static var bodyInfo: HPRequestBodyInfo?
    
    //MARK: - 对外提供单例的类方法
    class func returnRequestBodyInfo() -> HPRequestBodyInfo? {
        let levelStr = bodyInfo?.requestBodyDic?["level"]
        
        if levelStr == HPRequestSuccess {
            bodyInfo?.requestCode = 0
        } else if levelStr == String(HPRequestError) {
            bodyInfo?.requestCode = 1;

            if bodyInfo?.requestBodyDic == nil {
                bodyInfo?.errorCode = bodyInfo?.requestBodyDic?["error_code"]
                bodyInfo?.errorMsg = bodyInfo?.requestBodyDic?["message"]
            }
        }
        return bodyInfo
    }

}
