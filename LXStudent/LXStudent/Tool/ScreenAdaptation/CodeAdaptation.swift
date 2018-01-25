//
//  CodeAdaptation.swift
//  LXStudent
//
//  Created by 尚 on 2017/11/2.
//  Copyright © 2017年 cheng.shang. All rights reserved.
//

import UIKit

let myAppDelegate:AppDelegate = UIApplication.shared.delegate! as! AppDelegate


class CodeAdaptation: NSObject {
    
    class func CGRectMakeAdapter(rect:CGRect) -> CGRect {
        myAppDelegate.CodeAdaptation()
        var tempRect:CGRect?
        tempRect?.origin.x = rect.origin.x * myAppDelegate.autoSizeScaleX!
        tempRect?.origin.y = rect.origin.y * myAppDelegate.autoSizeScaleY!
        tempRect?.size.width = rect.size.width * myAppDelegate.autoSizeScaleX!
        tempRect?.size.height = rect.size.height * myAppDelegate.autoSizeScaleY!
        
        return tempRect!
    }
    
    /**
     宽度的比例
     */
    class func FLoatChange(size:CGFloat) -> CGFloat {
        myAppDelegate.CodeAdaptation()
        var news:CGFloat?
        news = size * myAppDelegate.autoSizeScaleX!
        return news!
    }
    /**
     高度的比例
     */
    class func YFLoatChange(size:CGFloat) -> CGFloat {
        myAppDelegate.CodeAdaptation()
        var news:CGFloat?
        news = size * myAppDelegate.autoSizeScaleY!
        return news!
    }
    /**
     有导航栏的高度比
     */
    class func YNFLoatChange(size:CGFloat) -> CGFloat {
        myAppDelegate.CodeAdaptation()
        var news:CGFloat?
        news = size * myAppDelegate.autoSizeScaleYN!
        return news!
    }
    /**
     有tabbar的高度比
     */
    class func YTFLoatChange(size:CGFloat) -> CGFloat {
        myAppDelegate.CodeAdaptation()
        var news:CGFloat?
        news = size * myAppDelegate.autoSizeScaleYT!
        return news!
    }
    /**
     都没有的高度比\
     */
    class func YNONTFLoatChange(size:CGFloat) -> CGFloat {
        myAppDelegate.CodeAdaptation()
        var news:CGFloat?
        news = size * myAppDelegate.autoSizeScaleYNONT!
        return news!
    }
    
}
