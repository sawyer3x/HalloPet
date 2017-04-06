//
//  HPMainTabBarControllerViewController.swift
//  HalloPet
//
//  Created by sawyer3x on 17/4/2.
//  Copyright © 2017年 sawyer3x. All rights reserved.
//

import UIKit

class HPMainTabBarControllerViewController: UITabBarController {

    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        //初始化UI
        setupUI()
        
        //添加所有控制器
        addAllControllers()
    }

    //MARK: - 初始化UI
    fileprivate func setupUI() {
        //初始化设置背景图片
        let tabBar = UITabBar.appearance()
        tabBar.backgroundImage = UIImage(named: "tabbarBackgroundColorImage")
    }
    
    //MARK: - 添加所有控制器
    fileprivate func addAllControllers() {
        //宠物页面
//        let petVC = HPPetViewController(rootViewController: )
        //好友页面
        
        //个人中心
    }
}
