//
//  UILabel+LXExtension.swift
//  LXStudent
//
//  Created by 尚 on 2017/11/4.
//  Copyright © 2017年 cheng.shang. All rights reserved.
//

import UIKit

var label:UILabel?
extension UILabel {
   
    /**
     设置title的文字
     */
    func makeLabelTitle(title:String) -> (()->(UILabel)) {
        return { () -> (UILabel) in
            
            label?.text = title
            return self
        }
    }
    /**
     设置字体
     */
    func makeLabelFont(fontSize:CGFloat) -> (()->(UILabel)) {
        return { () -> (UILabel) in
            
            label?.font = UIFont.systemFont(ofSize: fontSize)
            return self
        }
    }
    /**
     设置文字居中样式
     */
    func makeLabelTextAlignment(alignment:NSTextAlignment) -> (()->(UILabel)) {
        label?.textAlignment = alignment
        return { () -> (UILabel) in
            return self
        }
    }
    /**
     设置行数
     */
    func makeLabelNumofLine(lines:NSInteger) -> (()->(UILabel)) {
        label?.numberOfLines = lines
        return { () -> (UILabel) in
            return self
        }
    }
    /**
     设置label的字体颜色
     */
    func makeLabelTextColor(hexStr:String) -> (()->(UILabel)) {
        label?.textColor = UIColor.init(hexString: hexStr)
        return { () -> (UILabel) in
            return self
        }
    }
    
    
    /**
     创建label,首次必须调用,需要清空
     */
    class func makeLabel() ->(UILabel){
        if label != nil {
            label = nil
        }
        label = UILabel()
        return { ()->UILabel in
            return label!
            }()
    }
    
    

}
