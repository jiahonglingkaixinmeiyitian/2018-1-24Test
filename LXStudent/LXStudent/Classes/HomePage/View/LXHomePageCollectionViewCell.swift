//
//  LXHomePageCollectionViewCell.swift
//  LXStudent
//
//  Created by 尚 on 2017/11/2.
//  Copyright © 2017年 cheng.shang. All rights reserved.
//

import UIKit

class LXHomePageCollectionViewCell: UICollectionViewCell {
    
    var topImageView:UIImageView?
    
    var descLabel:UILabel?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.makeCollectionCellMainView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func makeCollectionCellMainView(){
//        self.topImageView = UIImageView.make(withImageName: "class", contentMode: .scaleAspectFit, maskToBounds: true)
        self.descLabel = UILabel.make(withTitle: "班级", font:  Font13, textColor: "2e4045")
        
        self.topImageView = UIImageView.makeImageView().makeImageViewImage(imageName: "class")().makeImageViewContenMode(contenMode: .scaleAspectFit)().makeImageViewCornerRadius(radius: 0, maskTobounds: true)()
        
        self.contentView.addSubview(self.topImageView!)
        self.contentView.addSubview(self.descLabel!)
        
        self.topImageView?.snp.makeConstraints({ (make) in
            make.top.equalTo(self.snp.top).offset(CodeAdaptation.YFLoatChange(size: 22))
//            make.left.equalTo(self.snp.left).offset(CodeAdaptation().YFLoatChange(size: 32))
            make.centerX.equalToSuperview()
            make.width.equalTo(CodeAdaptation.YFLoatChange(size: 63))
            make.height.equalTo(CodeAdaptation.YFLoatChange(size: 63))
        })
        
        self.descLabel?.snp.makeConstraints({ (make) in
            make.centerX.equalTo(self.topImageView!.snp.centerX)
            make.top.equalTo(self.topImageView!.snp.bottom).offset(CodeAdaptation.YFLoatChange(size: 15))
            make.width.equalTo(CodeAdaptation.YFLoatChange(size: 100))
            make.height.equalTo(CodeAdaptation.YFLoatChange(size: 15))
        })
    }
}
