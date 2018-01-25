//
//  LXLoginView.swift
//  LXStudent
//
//  Created by 尚 on 2017/11/3.
//  Copyright © 2017年 cheng.shang. All rights reserved.
//

import UIKit

import ReactiveSwift
import Result
import enum Result.NoError

class LXLoginView: UIView {
    
    /// top图片
    var topImageView:UIImageView?
    
    ///descLabel
    var descLabel:UILabel?
    
    /// 地区选择
    var areaBut:UIButton?
    
    /// 地区图片
    var areaImageView:UIImageView?
    
    ///地区名字
    var areaLabel:UILabel?
    
    ///地区右侧按钮
    var selectBut:UIButton?
    
    var userNameTextView:LXLoginTextView?
    
    var pwdTextView:LXLoginTextView?
    
    /// 忘记密码按钮
    var forgetBut:UIButton?
    
    /// 登录按钮
    var loginBut:UIButton?
    
    /// 注册按钮
    var registBut:UIButton?
    
    var callHelpView:LXLoginCallHelpView?
    

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.instantiationView()
        self.dealButClickEvent()
        
        
        ///设置登录按钮的禁用
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /**
     处理按钮点击事件
     */
    func dealButClickEvent() {
        
    }
    
    /**
     实例化
     */
    func instantiationView(){
        
        self.topImageView = UIImageView.makeImageView().makeImageViewImage(imageName: "login_logolx")().makeImageViewContenMode(contenMode: .scaleAspectFill)()
        
        self.descLabel = UILabel.makeLabel().makeLabelTitle(title: "云易教")().makeLabelFont(fontSize: CodeAdaptation.YNFLoatChange(size: size19))().makeLabelTextColor(hexStr: "2e4045")().makeLabelTextAlignment(alignment: .center)()
        
        self.areaBut = UIButton.makeBtn()
        self.areaBut?.layer.borderColor = UIColor.init(hexString: "0xeff0f4")?.cgColor
        self.areaBut?.layer.borderWidth = CodeAdaptation.YNFLoatChange(size: 1.0)
        self.areaBut?.layer.cornerRadius = CodeAdaptation.YNFLoatChange(size: 5.0)
        self.areaBut?.layer.masksToBounds = true
        
        self.areaImageView = UIImageView.makeImageView().makeImageViewImage(imageName: "icon_click")().makeImageViewContenMode(contenMode: .center)()
        self.areaLabel = UILabel.makeLabel().makeLabelTitle(title: "请选择地区")().makeLabelFont(fontSize: CodeAdaptation.YNFLoatChange(size: size16))().makeLabelTextColor(hexStr: "b2c2c6")().makeLabelTextAlignment(alignment: .left)()
        self.selectBut = UIButton.makeBtn().makeBtnNorImage(norImageStr: "down")()
        
        self.userNameTextView = LXLoginTextView.textView(placeHolderString: "请输入用户名", imageName: "Profile_Default")
        self.pwdTextView = LXLoginTextView.textView(placeHolderString: "请输入密码", imageName: "login_Password_d")
        
        self.forgetBut = UIButton.makeBtn().makeBtnTitle(title: "忘记密码?")().makeBtnTextFont(fontSize: CodeAdaptation.YNFLoatChange(size: size14))().makeNormalTextColor(norTextColor: "2ec5c2")().makeTextAlignment(alignment: .left)()
        
        self.loginBut = UIButton.makeBtn().makeBtnTitle(title: "登录")().makeNormalTextColor(norTextColor: "ffffff")().makeBtnTextFont(fontSize: CodeAdaptation.YNFLoatChange(size: size18))()
        self.loginBut?.layer.cornerRadius = CodeAdaptation.YNFLoatChange(size: 6)
        self.loginBut?.layer.masksToBounds = true
        self.loginBut?.backgroundColor = UIColor.init(hexString: "2ec5c2")
        
        self.registBut = UIButton.makeBtn().makeBtnTitle(title: "注册")().makeBtnTextFont(fontSize: CodeAdaptation.YNFLoatChange(size: size18))().makeNormalTextColor(norTextColor: "2ec5c2")()
        self.registBut?.layer.cornerRadius = CodeAdaptation.YNFLoatChange(size: 6)
        self.registBut?.layer.masksToBounds = true
        self.registBut?.backgroundColor = UIColor.init(hexString: "f8fdfe")
        self.registBut?.layer.borderWidth = 1
        self.registBut?.layer.borderColor = UIColor.init(hexString: "f0f1f5")?.cgColor
    
        self.callHelpView = LXLoginCallHelpView.loginCallHelpView()
        
        self.addSubview(self.topImageView!)
        self.addSubview(self.descLabel!)
        self.addSubview(self.areaBut!)
        self.areaBut?.addSubview(self.areaImageView!)
        self.areaBut?.addSubview(self.areaLabel!)
        self.areaBut?.addSubview(self.selectBut!)
        self.addSubview(self.userNameTextView!)
        self.addSubview(self.pwdTextView!)
        self.addSubview(self.forgetBut!)
        self.addSubview(self.loginBut!)
        self.addSubview(self.registBut!)
        self.addSubview(self.callHelpView!)
        
        self.layoutSubViewsForLoginView()
    }
    
    func layoutSubViewsForLoginView() {
        self.topImageView?.snp.makeConstraints({ (make) in
            make.top.equalTo(self.snp.top).offset(CodeAdaptation.YNFLoatChange(size: 75))
            make.centerX.equalToSuperview()
            make.width.equalTo(CodeAdaptation.YNFLoatChange(size: 76))
            make.height.equalTo(CodeAdaptation.YNFLoatChange(size: 81))
        })
        
        self.descLabel?.snp.makeConstraints({ (make) in
            make.centerX.equalTo((self.topImageView?.snp.centerX)!)
            make.top.equalTo((self.topImageView?.snp.bottom)!).offset(CodeAdaptation.YNFLoatChange(size: 20))
        })
        
        self.areaBut?.snp.makeConstraints({ (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.descLabel!.snp.bottom).offset(CodeAdaptation.YNFLoatChange(size: 38))
            make.left.equalTo(self.snp.left).offset(CodeAdaptation.YNFLoatChange(size: 20))
            make.right.equalTo(self.snp.right).offset(CodeAdaptation.YNFLoatChange(size: -20))
            make.height.equalTo(CodeAdaptation.YNFLoatChange(size: 49))
            
        })
        
        self.areaImageView?.snp.makeConstraints({ (make) in
            make.centerY.equalToSuperview()
            make.width.equalTo(CodeAdaptation.YNFLoatChange(size: size16))
            make.height.equalTo(CodeAdaptation.YNFLoatChange(size: size13))
            make.left.equalTo(self.areaBut!.snp.left).offset(14)
        })
        
        self.areaLabel?.snp.makeConstraints({ (make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(self.areaImageView!.snp.right).offset(9)
            make.right.equalTo(self.areaBut!.snp.right).offset(CodeAdaptation.YNFLoatChange(size: -30))
        })
        
        self.selectBut?.snp.makeConstraints({ (make) in
            make.centerY.equalToSuperview()
            make.right.equalTo(self.areaBut!.snp.right).offset(CodeAdaptation.YNFLoatChange(size: -10))
            make.width.equalTo(CodeAdaptation.YNFLoatChange(size: 10))
            make.height.equalTo(CodeAdaptation.YNFLoatChange(size: 6))
        })
        
        self.userNameTextView?.snp.makeConstraints({ (make) in
            make.top.equalTo(self.areaBut!.snp.bottom).offset(CodeAdaptation.YNFLoatChange(size: 10))
            make.left.right.height.equalTo(self.areaBut!)
            
        })
        self.pwdTextView?.snp.makeConstraints({ (make) in
            make.top.equalTo(self.userNameTextView!.snp.bottom).offset(CodeAdaptation.YNFLoatChange(size: 10))
            make.left.right.height.equalTo(self.areaBut!)
            
        })
        
        self.forgetBut?.snp.makeConstraints({ (make) in
            make.right.equalTo(self.pwdTextView!.snp.right)
            make.top.equalTo(self.pwdTextView!.snp.bottom).offset(CodeAdaptation.YNFLoatChange(size: 10))
        })
    
        self.loginBut?.snp.makeConstraints({ (make) in
            make.top.equalTo(self.forgetBut!.snp.bottom).offset(CodeAdaptation.YNFLoatChange(size: 37))
            make.left.equalTo(self.snp.left).offset(CodeAdaptation.YNFLoatChange(size: 30))

               make.height.equalTo(CodeAdaptation.YNFLoatChange(size: 44))
            make.right.equalTo(self.snp.right).offset(CodeAdaptation.YNFLoatChange(size: -30))
        })
        
        self.registBut?.snp.makeConstraints({ (make) in
        make.top.equalTo(self.loginBut!.snp.bottom).offset(CodeAdaptation.YNFLoatChange(size: 20))
            make.width.height.left.equalTo(self.loginBut!)
        })
        
        
        self.callHelpView?.snp.makeConstraints({ (make) in
            
            make.centerX.equalToSuperview()
            make.bottom.equalTo(self.snp.bottom).offset(CodeAdaptation.YFLoatChange(size: -20))
            make.width.equalTo(CodeAdaptation.YNFLoatChange(size: 180))
            make.height.equalTo(CodeAdaptation.YNFLoatChange(size: 20))
        })
        
    }
    
}
