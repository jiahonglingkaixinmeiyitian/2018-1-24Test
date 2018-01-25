//
//  UIImageView+LXExtension.swift
//  LXStudent
//
//  Created by 尚 on 2017/11/6.
//  Copyright © 2017年 cheng.shang. All rights reserved.
//

import UIKit
var tempImageView:UIImageView?
extension UIImageView{
    
    /**
     创建imageview
     */
    class func makeImageView()->UIImageView{
        
        return {()->(UIImageView) in
            if tempImageView != nil {
                tempImageView = nil
            }
            tempImageView = UIImageView()
            return tempImageView!
        }()
    }
    
    /**
     设置图片
     */
    func makeImageViewImage(imageName:String) ->(()->UIImageView) {
        tempImageView?.image = UIImage(named:imageName)
        return { ()->UIImageView in
            return tempImageView!
        }
    }
    /**
     设置圆角
     */
    func makeImageViewCornerRadius(radius:CGFloat,maskTobounds:Bool) ->(()->UIImageView) {
        tempImageView?.layer.cornerRadius = radius
        tempImageView?.layer.masksToBounds = maskTobounds
        return { ()->UIImageView in
            return tempImageView!
        }
    }
    /**
     设置填充模式
     */
    func makeImageViewContenMode(contenMode:UIViewContentMode) ->(()->UIImageView) {
        tempImageView?.contentMode = contentMode
        return { ()->UIImageView in
            return tempImageView!
        }
    }
    /**
     设置是否允许交互
     */
    func makeImageViewUserInterFace(userInterFace:Bool) ->(()->UIImageView) {
        tempImageView?.isUserInteractionEnabled = userInterFace
        return { ()->UIImageView in
            return tempImageView!
        }
    }
    
    
}
