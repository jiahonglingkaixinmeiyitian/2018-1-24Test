//
//  LXLoginViewController.swift
//  LXStudent
//
//  Created by 尚 on 2017/11/3.
//  Copyright © 2017年 cheng.shang. All rights reserved.
//

import UIKit

class LXLoginViewController: LXBaseViewController {
    
    ///登录的viewmodel
    var lxLoginViewModel:LXLoginViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lxLoginViewModel = LXLoginViewModel()
        
        self.makeMainView()
    }
    
    /**
     重写不显示table
     */
    override func makeTabelView() {
        
    }

    func makeMainView() {
        self.lxLoginViewModel?.makeLoginView(superView:self.view)
        
        self.lxLoginViewModel?.lxloginView?.snp.makeConstraints({ (make) in
            make.edges.equalToSuperview()
        })
    }


}
