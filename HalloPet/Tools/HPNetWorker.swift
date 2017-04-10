//
//  HPNetWorker.swift
//  HalloPet
//
//  Created by sawyer3x on 17/4/8.
//  Copyright © 2017年 sawyer3x. All rights reserved.
//

import UIKit
import AFNetworking

class HPNetWorker: AFHTTPSessionManager {
    
    ///全局使用的netWorker单例
    fileprivate static var netWorker: HPNetWorker?
    
    //MARK: - 对外提供全局使用的单例的类方法
    class func sharedNetWorker() -> HPNetWorker {
        return netWorker!
    }
    
    //MARK: - 创建全局使用单例的类方法
    class func globalNetWorker(_ baseURLStr: String) -> HPNetWorker{
        if netWorker != nil {
            return netWorker!
        }else {
            let URLStr = String(format: "http://%@", baseURLStr)
            let URL = Foundation.URL(string: URLStr)
            let configuration = URLSessionConfiguration.default
            configuration.timeoutIntervalForResource = 5.0
            configuration.timeoutIntervalForRequest = 5.0
            netWorker = HPNetWorker(baseURL: URL!, sessionConfiguration: configuration)
            return netWorker!
        }
    }
    
    ///登录界面用的netWorker
    fileprivate static var loginNetWorker: HPNetWorker = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForResource = 5.0
        configuration.timeoutIntervalForRequest = 5.0
        return HPNetWorker(sessionConfiguration: configuration)
    }()
    
    //MARK: - 对外提供登录netWorker单例的类方法
    class func sharedLoginNetWorker() -> HPNetWorker {
        return loginNetWorker
    }
    
    ///全局使用的上传图片netWorker单例
    fileprivate static var unloadImageNetWorker: HPNetWorker?
    
    //MARK: - 对外提供全局使用的上传图片netWorker单例的类方法
    class func sharedUnloadImageNetWorker() -> HPNetWorker {
        return unloadImageNetWorker!
    }
    
    //MARK: - 创建全局使用上传图片netWorker单例的类方法
    class func globalUnloadImageNetWorker(_ baseURLStr: String) -> HPNetWorker{
        if unloadImageNetWorker != nil {
            return unloadImageNetWorker!
        }else {
            let URLStr = String(format: "http://%@", baseURLStr)
            let URL = Foundation.URL(string: URLStr)
            let configuration = URLSessionConfiguration.default
            configuration.timeoutIntervalForResource = 10.0
            configuration.timeoutIntervalForRequest = 10.0
            unloadImageNetWorker = HPNetWorker(baseURL: URL!, sessionConfiguration: configuration)
            return unloadImageNetWorker!
        }
    }
    
}
