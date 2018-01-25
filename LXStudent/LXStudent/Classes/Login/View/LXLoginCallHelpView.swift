//
//  LXLoginCallHelpView.swift
//  LXStudent
//
//  Created by 尚 on 2017/11/7.
//  Copyright © 2017年 cheng.shang. All rights reserved.
//

import UIKit


class LXLoginCallHelpView: UIView {
    
    @IBOutlet weak var callBut: UIButton!
    
    @IBOutlet weak var helpBut: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.callBut.titleLabel?.font = UIFont.systemFont(ofSize: CodeAdaptation.YNFLoatChange(size: 13))
        self.callBut.titleLabel?.textAlignment = .center
        self.callBut.setTitleColor(UIColor.init(hexString: "8f9ca4"), for: .normal)
        
        self.helpBut.titleLabel?.font = UIFont.systemFont(ofSize: CodeAdaptation.YNFLoatChange(size: 13))
        self.helpBut.titleLabel?.textAlignment = .center
        self.helpBut.setTitleColor(UIColor.init(hexString: "8f9ca4"), for: .normal)
        let str = (buildVersion as? String)!
        let str1 = NSString.init(format: "%@%@", "帮助中心?  ",str) as String
        self.helpBut .setTitle(str1, for: .normal)
        
    }
    
    class func loginCallHelpView() -> LXLoginCallHelpView{
        return Bundle.main.loadNibNamed("LXLoginCallHelpView", owner: nil, options: nil)?.last as! LXLoginCallHelpView
    }
}
