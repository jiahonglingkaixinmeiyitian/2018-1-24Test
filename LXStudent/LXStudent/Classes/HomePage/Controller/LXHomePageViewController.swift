//
//  LXHomePageViewController.swift
//  linkTrustEducationPlatform
//
//  Created by 尚 on 2017/10/31.
//  Copyright © 2017年 cheng.shang. All rights reserved.
//

import UIKit

let cellIdentify:NSString = "cellID"

class LXHomePageViewController: LXBaseViewController {

    /// 数据处理viewmodel
    var lxhomeViewModel:LXHomePageViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lxhomeViewModel = LXHomePageViewModel()
        self.setUpMainView()
        
    }
    
    
    override func loadData() {
        
    }
    
    /**
     *搭建上部视图
     */
    func setHearderView(){
     _ = self.lxhomeViewModel?.creatTopView(rect:.zero)().addTopView(superView: self.view)()
        
        let sizeH =  (CodeAdaptation.YFLoatChange(size: 224) as CGFloat)
        self.lxhomeViewModel?.lxHomeTopView?.snp.makeConstraints({ (make) in
            make.left.top.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(sizeH)
        })
    }
    
    /**
     *下部视图
     */
    func setMidCenterView(){
        self.lxhomeViewModel?.creatCollectionView(rect:CGRect(x: 0, y: CodeAdaptation.YFLoatChange(size: 224), width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height - 50))().addCollectionView(superView: self.view, backColor: UIColor.white)().settingDelegateDataSourceAndCellString(cellIdentify: cellIdentify as NSString )
        
//        self.lxhomeViewModel?.lxCollectionView?.snp.makeConstraints({ (make) in
//            make.left.equalToSuperview()
//            make.top.equalTo((self.lxhomeViewModel?.lxHomeTopView!.snp.bottom)!)
//            make.width.equalToSuperview()
//            make.height.equalTo(UIScreen.main.bounds.height - CodeAdaptation().FLoatChange(size: 224))
//        })
        
    }
    
    /**
     *搭建界面
     */
    func setUpMainView(){
        self.setHearderView()
        self.setMidCenterView()
    }
    

}
