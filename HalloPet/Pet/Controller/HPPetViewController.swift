//
//  HPPetViewController.swift
//  HalloPet
//
//  Created by sawyer3x on 17/4/2.
//  Copyright © 2017年 sawyer3x. All rights reserved.
//

import UIKit

class HPPetViewController: UIViewController {

    ///对外提供的类工厂方法
    class func instance() -> HPPetViewController {
        let vc = HPPetViewController()
        return vc
    }
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        //初始化UI
        setupUI()
        
        //设置导航栏两边按钮
        setupNavBarItem()
        
        //设置一般通知监听
        setupNormalMonitorNotification()

    }

    //初始化UI
    fileprivate func setupUI() {
        //设置标题
        navigationItem.title = "遛宠"
        
        //设置地图的view
        setupMapView()
        
        //设置buttonView
        setupButtonView()
    }
    
    //设置导航栏两边按钮
    fileprivate func setupNavBarItem() {
        let rankBtn = UIButton()
        rankBtn.setImage(UIImage(named: "ranking"), for: UIControlState())
        rankBtn.sizeToFit()
        //TODO: - 左右按钮的功能
        //        conSearchBtn.addTarget(self, action: #selector(SAMStockViewController.searchBtnClick), for: .touchUpInside)
        
        let historyBtn = UIButton()
        historyBtn.setImage(UIImage(named: "history"), for: UIControlState())
        historyBtn.sizeToFit()
        //TODO: - 左右按钮的功能
        //        conSearchBtn.addTarget(self, action: #selector(SAMStockViewController.searchBtnClick), for: .touchUpInside)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: rankBtn)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: historyBtn)
    }
    
    //设置一般通知监听
    fileprivate func setupNormalMonitorNotification() {
        
    }
    
    //设置地图的view
    fileprivate func setupMapView() {
    
    }
    
    //设置buttonView
    fileprivate func setupButtonView() {
        
    }

}
