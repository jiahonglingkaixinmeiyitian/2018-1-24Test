//
//  LXMainTabBarController.swift
//  linkTrustEducationPlatform
//
//  Created by 尚 on 2017/10/31.
//  Copyright © 2017年 cheng.shang. All rights reserved.
//

import UIKit

class LXMainTabBarController: UITabBarController {
    
    var tempArray:NSMutableArray?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        ["title":"首页","norImageName":"home-nor","selImageName":"home-sel","className":LXHomePageViewController()],
        let temparray = [
            ["title":"通讯录","norImageName":"address-book-nor","selImageName":"address-book-sel","className":LXAddressBookViewController()],
            ["title":"消息","norImageName":"session-nor","selImageName":"session-sel","className":LXMessageViewController()],
            ["title":"我的","norImageName":"my-nor","selImageName":"my-sel","className":LXMineViewController()]
        ]
        
        let homeVC = LXHomePageViewController()
        homeVC.title = "首页"
        homeVC.tabBarItem.image = UIImage(named:"home-nor")?.withRenderingMode(.alwaysOriginal)
        homeVC.tabBarItem.selectedImage = UIImage(named:"selImageName")?.withRenderingMode(.alwaysOriginal)
    homeVC.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor:UIColor.gray,NSAttributedStringKey.font:UIFont.systemFont(ofSize: 12)], for: .normal)
    homeVC.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor:UIColor.init(hexStr: "#2ec5c2"),NSAttributedStringKey.font:UIFont.systemFont(ofSize: 12)], for: .selected)
        
        
        self.tempArray = NSMutableArray()
        
        for temDict in temparray {
            let vc = self.settingChild(tempDict: temDict as NSDictionary)
            self.tempArray?.add(vc)
        }
        
        self.tempArray?.insert(homeVC, at: 0)
        self.viewControllers = (self.tempArray as! [UIViewController])
    }
    
    
    /**
     * 创建子控制器
     *
     */
    func settingChild(tempDict:NSDictionary) -> LXMainNavgationController {
        
        let vc = tempDict.object(forKey: "className") as! UIViewController
        
        let main = LXMainNavgationController(rootViewController: vc)
        
        vc.title = tempDict.object(forKey: "title") as? String
        
        vc.tabBarItem.image = UIImage(named:((tempDict.object(forKey: "norImageName") as! NSString) as String))?.withRenderingMode(.alwaysOriginal)
        
        let im = UIImage(named:((tempDict.object(forKey: "selImageName") as! String) as String))?.withRenderingMode(.alwaysOriginal)
        
        vc.tabBarItem.selectedImage = im
   
    vc.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor:UIColor.gray,NSAttributedStringKey.font:UIFont.systemFont(ofSize: 12)], for: .normal)
    vc.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor:UIColor.init(hexStr: "#2ec5c2"),NSAttributedStringKey.font:UIFont.systemFont(ofSize: 12)], for: .selected)
        
        return main
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
    }
    
    
}
