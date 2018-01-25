//
//  LXHomePageViewModel.swift
//  LXStudent
//
//  Created by 尚 on 2017/11/1.
//  Copyright © 2017年 cheng.shang. All rights reserved.
//

import UIKit


class LXCollectionViewLayout:UICollectionViewFlowLayout{
    
    override func prepare() {
        
        let xFloat = CodeAdaptation.FLoatChange(size: 123)
        let yFloat = CodeAdaptation.YFLoatChange(size: 126)
        self.itemSize = CGSize(width: xFloat, height: yFloat)
        self.minimumLineSpacing = 0.5
        self.minimumInteritemSpacing = 0.5
    }
}


class LXHomePageViewModel: LXBaseViewModel,UICollectionViewDelegate,UICollectionViewDataSource {
    
    /// 顶部视图
    var lxHomeTopView:LXHomePageTopView?
    /// 下部展示列表
    var lxCollectionView:UICollectionView?
    /// 数据
    var dataList:NSMutableArray?
    
    
    override init() {
        super.init()
        self.dataList = NSMutableArray()
    }
    
    
    
    /**
     加载数据
     */
    
    func creatTopView(rect:CGRect)->(()->(LXHomePageViewModel)){
        return {()->(LXHomePageViewModel) in
            self.lxHomeTopView = LXHomePageTopView(frame: rect)
            return self
        }
    }
    
    func addTopView(superView:UIView) -> (()->(LXHomePageViewModel)) {
        return { () ->(LXHomePageViewModel) in
            superView.addSubview(self.lxHomeTopView!)
            return self
        }
    }
    
    
    func creatCollectionView(rect:CGRect) ->(()->(LXHomePageViewModel)) {
        return { ()->(LXHomePageViewModel) in
            self.lxCollectionView = UICollectionView(frame: rect, collectionViewLayout: LXCollectionViewLayout())
            return self
        }
    }
    
    func addCollectionView(superView:UIView,backColor:UIColor) ->(()->(LXHomePageViewModel)) {
        return { () -> (LXHomePageViewModel) in
            superView.addSubview(self.lxCollectionView!)
            self.lxCollectionView?.backgroundColor = backColor
            return self
        }
    }
    
    func settingDelegateDataSourceAndCellString(cellIdentify:NSString){
        self.lxCollectionView?.delegate = self
        self.lxCollectionView?.dataSource = self
        self.lxCollectionView?.isScrollEnabled = false
        self.lxCollectionView?.layer.cornerRadius = 16
        self.lxCollectionView?.layer.masksToBounds = true
        self.lxCollectionView?.layer.borderWidth = 1

        self.lxCollectionView?.register(LXHomePageCollectionViewCell.self, forCellWithReuseIdentifier: cellIdentify as String)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let lxHomePageCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentify as String, for: indexPath)

//        lxHomePageCell.backgroundColor = UIColor.blue
        return lxHomePageCell
    }
}

