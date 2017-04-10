//
//  HPLoginViewController.swift
//  HalloPet
//
//  Created by sawyer3x on 17/4/2.
//  Copyright © 2017年 sawyer3x. All rights reserved.
//

import UIKit

///用于读写 服务器地址 的Key
private let severAddStrKey = "/api/v01/user/login"
///用于读写 用户名 的Key
private let userNameStrKey = "userNameStrKey"
///用于读写 密码 的Key
private let passWordStrKey = "passWordStrKey"
///登录界面用到动画的基础时长
private let animationDuration = 0.7

class HPLoginViewController: UIViewController {
   
    //MARK: - 属性
    ///用户名
    fileprivate var userNameStr: String?
    ///密码
    fileprivate var pwdStr: String?
    
    //MARK: - xib链接属性

    @IBOutlet weak var phoneTF: UITextField!
    @IBOutlet weak var pwdTF: UITextField!
    @IBOutlet weak var dogImgV: UIImageView!
    @IBOutlet weak var loginBtn: UIButton!
    
    //MARK: - 其他方法
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    override func loadView() {
        view = Bundle.main.loadNibNamed("HPLoginViewController", owner: self, options: nil)![0] as! UIView
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        //初始化设置UI
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - 初始化设置UI
    fileprivate func setupUI() {
        
        //设置按钮圆角
        loginBtn.layer.cornerRadius = 4
        loginBtn.layer.borderWidth = 1
        loginBtn.layer.borderColor = hexStringToUIColor(hex: "C0C0C0").cgColor
        
        //设置用户名 密码框的代理 并进行监听
//        phoneTF.addTarget(self, action: #selector(HPLoginController.checkBtnState(_:)), for: .editingChanged)
//        PwdTF.addTarget(self, action: #selector(HPLoginController.checkBtnState(_:)), for: .editingChanged)
//        serverAddTF.addTarget(self, action: #selector(HPLoginController.checkBtnState(_:)), for: .editingChanged)
    }
    
    //MARK: - 界面交互点击事件处理
    //登录按钮点击
    @IBAction func loginBtnClick(_ sender: UIButton) {
        self.endEditing()
        
        userNameStr = phoneTF.text
        pwdStr = pwdTF.text
        
        //等待一秒后向服务器发送登录请求
        DispatchQueue.global().asyncAfter(deadline: DispatchTime.now() + Double(Int64(1000000000 * animationDuration)) / Double(NSEC_PER_SEC)) {
//            self.loginRequest(userName: self.phoneTF.text!, passWord: self.pwdTF.text!)
        }
    }
//    @IBAction func loginBtnClick(_ sender: AnyObject) {
//        
//        //记录用户名和密码
//        userNameStr = userNameTF.text
//        PWDStr = PwdTF.text
//        
//        UIView.animate(withDuration: 0.4, animations: {
//            
//            //退出编辑状态
//            self.endEditing()
//        }, completion: { (_) in
//            //执行动画
//            self.loginAnim()
//        })
//    }
    
    //点击界面退出编辑状态
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        endEditing()
    }
    
    //MARK: - 结束界面编辑状态
    fileprivate func endEditing() {
        view.endEditing(false)
    }
    
    //MARK: - 发送用户登录请求
    fileprivate func loginRequest(phone: String, password: String, cid: String, appType: String) {
        
        //创建请求路径，请求参数
        let URLStr = String(format: "http://%@/handleLogin.ashx", severAddStrKey)
        let parameters = ["phone": phone, "password": password, "cid": cid, "appType": appType]
        
        //发送请求
        HPNetWorker.sharedLoginNetWorker().get(URLStr, parameters: parameters, progress: nil, success: {[weak self] (Task, json) in
            //判断返回数据状态
            let Json = json as! [String: AnyObject]
            let requestBodyInfo = Json["data"]! as! [String: String]
            let accessToken = requestBodyInfo["access_token"]
//            NSString *accessToken = [dicResultEntiy valueForKey:@"access_token"];

//            if status["status"]! == "fail" { //用户名或者密码错误
                
//                self!.showLoginDefeatInfo("用户名或者密码错误")
//            } else { //登录成功
            
//                //模型化数据
//                let arr = Json["body"] as! [[String: String]]
//                let dict = arr[0]
//                let id = dict["id"]
//                let employeeID = dict["employeeID"]
//                let appPower = dict["appPower"]
//                let deptID = dict["deptID"]
//                let model = HPUserAuth.auth(id, employeeID: employeeID, appPower: appPower, deptID: deptID)
//                model.userName = self!.userNameTF.text
//                
//                //执行登录成功后续操作
//                //存储登录数据
//                UserDefaults.standard.set(self.severAddStr, forKey: severAddStrKey)
//                if self.remNameBtn.isSelected == true {
//                    UserDefaults.standard.set(self.userNameStr, forKey: userNameStrKey)
//                }else {
//                    UserDefaults.standard.set(nil, forKey: userNameStrKey)
//                }
//                if self.remPwdBtn.isSelected == true {
//                    UserDefaults.standard.set(self.PWDStr, forKey: passWordStrKey)
//                }else {
//                    UserDefaults.standard.set(nil, forKey: passWordStrKey)
//                }
//                UserDefaults.standard.synchronize()
//                
//                //创建全局使用的netWorker单例
//                let _ = HPNetWorker.globalNetWorker(self.severAddStr!)
//                
//                //创建全局使用的上传图片netWorker单例
//                let _ = HPNetWorker.globalUnloadImageNetWorker(self.severAddStr!)
//                
//                //发出登录成功的通知
//                NotificationCenter.default.post(name: Notification.Name(rawValue: LoginSuccessNotification), object: nil, userInfo: nil)
//            }
        }) {[weak self] (Task, Error) in
            self!.showLoginDefeatInfo("请检查网络")
        }
    }
    
    //MARK: - 登录出现错误时候提示的消息
    fileprivate func showLoginDefeatInfo(_ title: String!) {
        //展示错误信息
        let _ = HPHUD.showMessage(title, superView: view, hideDelay: animationDuration * 2, animated: true)
    }

}
