//
//  LXHomePageTopView.swift
//  LXStudent
//
//  Created by 尚 on 2017/11/1.
//  Copyright © 2017年 cheng.shang. All rights reserved.
//

import UIKit
import SnapKit

class LXHomePageTopView: UIView {
    
    /// 背景图片
    var topImageView:UIImageView?
    
    /// 遮罩视图
    var bottomImageView:UIImageView?
    
    /// 切换按钮
    var switchbut:UIButton?
    
    /// 班级名称
    var classLabel:UILabel?
    
    /// 地区名称
    var areaLabel:UILabel?
    
    /// 描述名称
    var descLabel:UILabel?
    
    
    /*
     * 底部的视图
     */
    /// 头像图
    var headImageView:UIImageView?
    
    /// 用户名字
    var userNameLabel:UILabel?
    
    /// 分割线
    var separLineView:UIView?
    
    /// 积分分数
//    var scoreLabel:UILabel?
//
//    /// 积分
//    var scoreLabelShow:UILabel?
//
//    /// 领信币分数
//    var receiveScoreLabel:UILabel?
//
//    ///领信币
//    var receiveLabel:UILabel?
//
//    /// 积分按钮
    var scoreBut:UIButton?
//
//    /// 签到按钮
    var SigninBut:UIButton?
//
//    /// 领取按钮
    var receiveBut:UIButton?
//
    /**
     *实例化控件
     */
    func instantiationControls(){
        
        self.bottomImageView = UIImageView.make(withImageName: "mask-layer", contentMode: .scaleAspectFill, maskToBounds: true)
        
        self.topImageView = UIImageView.make(withImageName: "nav-bg", contentMode: .scaleAspectFill, maskToBounds: true, alpha: 1, userInteractionEnabled: true)
        
        self.classLabel = UILabel.make(withTitle: "四年级9班刘雨欣", font: Font15, textColor:"ffffff", numofLine: 1, alignment: .right)
//        self.classLabel?.backgroundColor = UIColor.red
        
        self.areaLabel = UILabel.make(withTitle: "北京市海淀区首都师范大学附中", font: Font12, textColor: "ffffff", numofLine: 1, alignment:.right)
        
        self.descLabel = UILabel.make(withTitle: "描述名称", font: Font12, textColor: "ffffff", numofLine: 1, alignment: .center)
        
//        self.switchbut = UIButton.make(withTitle: "", font: CodeAdaptation().YFLoatChange(size: Font13), textColor: "", norImage: "switch-user", selImage: "")
        
        
        self.switchbut = UIButton.makeBtn().makeBtnNorImage(norImageStr: "switch-user")().makeBtnTextFont(fontSize: Font13)()
        
        
        self.scoreBut = UIButton.makeBtn().makeBtnTextFont(fontSize: Font13)().makeBtnTitle(title: "")().makeTextAlignment(alignment: .left)().makeNormalTextColor(norTextColor: "")()
        
//
        
        /// 底部的
        self.headImageView = UIImageView.make(withImageName: "normal", contentMode: .scaleAspectFill, maskToBounds: true, alpha: 1, userInteractionEnabled: true)
        self.headImageView?.layer.cornerRadius = CodeAdaptation.YFLoatChange(size: 70/2)
        
        self.userNameLabel = UILabel.make(withTitle: "测试人员", font:  Font12, textColor: "ffffff")
        
        self.separLineView = UIView()
        self.separLineView?.backgroundColor = UIColor.init(hexStr: "ffffff")
        
//        self.scoreBut = UIButton.make(withTitle: "")
//        self.scoreBut?.backgroundColor = UIColor.clear
//
//        self.scoreLabel = UILabel.make(withTitle: "30", font: CodeAdaptation().YFLoatChange(size: Font12), textColor: "ffffff")
//
//        self.scoreLabelShow = UILabel.make(withTitle: "积分", font: CodeAdaptation().YFLoatChange(size: Font12), textColor: "ffffff", numofLine: 1, alignment: .center)
//
//        self.SigninBut = UIButton.make(withTitle: "立即签到", font: CodeAdaptation().YFLoatChange(size: Font12), textColor: "ffffff", norImage: "", selImage: "")
//        self.SigninBut?.layer.borderColor = UIColor.white.cgColor
//        self.SigninBut?.layer.cornerRadius = 14
//        self.SigninBut?.layer.masksToBounds = true
//
//        self.receiveScoreLabel = UILabel.make(withTitle: "", font: CodeAdaptation().YFLoatChange(size: Font12), textColor: "ffffff")
//        self.receiveLabel = UILabel.make(withTitle: "", font: Font12, textColor: "ffffff")
//        self.receiveBut = UIButton.make(withTitle: "")
        
        
        self.addSubview(self.descLabel!)
        self.addSubview(self.topImageView!)
        self.addSubview(self.bottomImageView!)
        self.addSubview(self.classLabel!)
        self.addSubview(self.areaLabel!)
        self.addSubview(self.switchbut!)
        
//        self.addSubview(self.scoreLabel!)
        self.addSubview(self.userNameLabel!)
//        self.addSubview(self.scoreLabelShow!)
//        self.addSubview(self.SigninBut!)
//        self.addSubview(self.scoreBut!)
//        self.addSubview(self.receiveScoreLabel!)
//        self.addSubview(self.receiveLabel!)
        self.addSubview(self.separLineView!)
        self.addSubview(self.headImageView!)
//        self.addSubview(self.receiveBut!)
        
        
        /// 布局
        
        self.customLayoutSubViews()
    }
    
    /**
     *添加约束  约束有问题
     */
    func customLayoutSubViews(){
        self.topImageView?.snp.makeConstraints({ (make) in
            make.left.right.width.equalToSuperview()
            make.height.equalTo(CodeAdaptation.YFLoatChange(size: 244))
        })
        
        self.bottomImageView?.snp.makeConstraints({ (make) in
            make.left.right.equalToSuperview()
            make.bottom.equalTo((self.topImageView?.bottom)!)
        })
        
        self.switchbut?.snp.makeConstraints({ (make) in
            make.top.equalTo(self).offset(CodeAdaptation.YFLoatChange(size: 45))
            make.right.equalTo(self).offset(CodeAdaptation.YFLoatChange(size: -15))
            make.height.width.equalTo(CodeAdaptation.YFLoatChange(size: 20))
        })
        
        self.classLabel?.snp.makeConstraints({ (make) in
            make.top.equalTo(self.switchbut!)
            make.right.equalTo(self.switchbut!.snp.left).offset(CodeAdaptation.YFLoatChange(size: -15))
        })
        self.areaLabel?.snp.makeConstraints({ (make) in
            make.top.equalTo(self.classLabel!.snp.bottom).offset(CodeAdaptation.YFLoatChange(size: 12))
            make.right.equalTo(self.classLabel!)
        })
        
        
        
        /// 底部约束
        self.userNameLabel?.snp.makeConstraints({ (make) in
            make.bottom.equalTo(self.snp.bottom).offset(CodeAdaptation.YFLoatChange(size: -15))
            make.left.equalToSuperview()
            make.height.equalTo(CodeAdaptation.YFLoatChange(size: 12))
            make.width.equalTo(UIScreen.main.bounds.width/4)
        })
        
        self.headImageView?.snp.makeConstraints({ (make) in
        make.bottom.equalTo(self.userNameLabel!.snp.top).offset(CodeAdaptation.YFLoatChange(size: -15))
            make.centerX.equalTo(self.userNameLabel!.snp.centerX)
            make.width.height.equalTo(CodeAdaptation.YFLoatChange(size: 70))
        })
        
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.instantiationControls()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
