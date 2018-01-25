//
//  LXLoginViewModel.swift
//  LXStudent
//
//  Created by 尚 on 2017/11/3.
//  Copyright © 2017年 cheng.shang. All rights reserved.
//

import UIKit

class LXLoginViewModel: LXBaseViewModel {
    
    /// loginView
    var lxloginView:LXLoginView?
    
    func makeLoginView(superView:UIView){
        self.lxloginView = LXLoginView()
        superView.addSubview(self.lxloginView!)
    }
}
