//
//  LXMainNavgationController.swift
//  linkTrustEducationPlatform
//
//  Created by 尚 on 2017/10/31.
//  Copyright © 2017年 cheng.shang. All rights reserved.
//

import UIKit

class LXMainNavgationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        self.settingNavgationBarStyle()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    /**
     *设置导航条的样式
     */
    func settingNavgationBarStyle(){

        self.navigationBar.isTranslucent = false
        
        self.navigationBar.barTintColor = UIColor(hexString: "#2ec5c2")
        
        self.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white,NSAttributedStringKey.font:UIFont.systemFont(ofSize: 17)]
        
        UIApplication.shared.statusBarStyle = .lightContent
        
    }
    
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.viewControllers.count > 0 {
            self.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }
    
}
