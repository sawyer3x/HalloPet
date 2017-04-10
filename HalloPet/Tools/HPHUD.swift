//
//  HPHUD.swift
//  HalloPet
//
//  Created by sawyer3x on 17/4/8.
//  Copyright © 2017年 sawyer3x. All rights reserved.
//

import UIKit
import MBProgressHUD

class HPHUD: MBProgressHUD {

    //MARK: - 对外提供的类方法，提示文字信息
    class func showMessage(_ message: String, superView: UIView, hideDelay: TimeInterval, animated: Bool) -> HPHUD? {
        let hud = showAdded(to: superView, animated: animated)
        hud?.mode = MBProgressHUDMode.text;
        hud?.labelText = NSLocalizedString(message, comment: "HUD message title")
        hud?.hide(true, afterDelay: hideDelay)
        hud?.backgroundColor = UIColor.init(white: 0, alpha: 0.1)
        return hud
    }

}
