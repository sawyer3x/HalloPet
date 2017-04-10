//
//  HPBaseNavigationController.swift
//  HalloPet
//
//  Created by sawyer3x on 17/4/2.
//  Copyright © 2017年 sawyer3x. All rights reserved.
//

import UIKit

class HPBaseNavigationController: UINavigationController {

    //MARK: - 类初始化设置initialize
    override class func initialize() {
        let navBar = UINavigationBar.appearance()
        
        //设置主标题属性
        navBar.titleTextAttributes = [NSForegroundColorAttributeName: hexStringToUIColor(hex: "#F0F0F0"), NSFontAttributeName: UIFont.systemFont(ofSize: 18)]
        
        //设置返回按钮颜色
        navBar.tintColor = hexStringToUIColor(hex: "#F0F0F0")
        
        //设置背景图片
        navBar.setBackgroundImage(createImageWithColor(color: hexStringToUIColor(hex: "#FA794B")), for: .default)

    }
    
    //MARK: - 其他方法
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
