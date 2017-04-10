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
        
        //初始化设置所有tabBarItem正常状态和选中时的颜色
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: hexStringToUIColor(hex: "#FA794B")], for: .selected)
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: hexStringToUIColor(hex: "#343434")], for: UIControlState())
    }
    
    //MARK: - 添加所有控制器
    fileprivate func addAllControllers() {
        //宠物页面
        let petVc = HPBaseNavigationController(rootViewController: HPPetViewController())
        addOneController(petVc, tabImg: UIImage(named: "pet_tabbar")!.withRenderingMode(UIImageRenderingMode.alwaysOriginal), selectedImg: UIImage(named: "pet_tabbar_selected")!.withRenderingMode(UIImageRenderingMode.alwaysOriginal), tabTile: "遛宠")
        
        //好友页面
        let friendsVc = HPBaseNavigationController(rootViewController: HPFriendsViewController())
        addOneController(friendsVc, tabImg: UIImage(named: "friends_tabbar")!.withRenderingMode(UIImageRenderingMode.alwaysOriginal), selectedImg: UIImage(named: "friends_tabbar_selected")!.withRenderingMode(UIImageRenderingMode.alwaysOriginal), tabTile: "好友")
        
        //个人中心
        let mineVc = HPBaseNavigationController(rootViewController: HPMineViewController())
        addOneController(mineVc, tabImg: UIImage(named: "mine_tabbar")!.withRenderingMode(UIImageRenderingMode.alwaysOriginal), selectedImg: UIImage(named: "mine_tabbar_selected")!.withRenderingMode(UIImageRenderingMode.alwaysOriginal), tabTile: "我")
    }
    
    //MARK: - 单独添加一个控制器
    fileprivate func addOneController(_ controller: UIViewController, tabImg: UIImage, selectedImg: UIImage, tabTile: String) {
        addChildViewController(controller)
        controller.tabBarItem = UITabBarItem(title: tabTile, image: tabImg, selectedImage: selectedImg)
    }
    
    //MARK: - 其他方法
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
