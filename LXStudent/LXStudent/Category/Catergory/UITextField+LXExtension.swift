
//
//  File.swift
//  LXStudent
//
//  Created by 尚 on 2017/11/6.
//  Copyright © 2017年 cheng.shang. All rights reserved.
//

import Foundation
var tempTextField:UITextField?

extension UITextField {
    
    class func makeTextField() ->UITextField{
        if tempTextField != nil {
            tempTextField = nil
        }
        tempTextField = UITextField()
        return tempTextField!
    }
    
    func makeText(text:String) -> (()->(UITextField)) {
        tempTextField?.text = text
        return { ()->UITextField in
            return tempTextField!
        }
    }
    func makeTextColor(textColor:String) -> (()->(UITextField)) {
        tempTextField?.textColor = UIColor.init(hexString: textColor)
        return { ()->UITextField in
            return tempTextField!
        }
    }
    func makeTextAlignment(aligment:NSTextAlignment) -> (()->(UITextField)) {
        tempTextField?.textAlignment = aligment
        return { ()->UITextField in
            return tempTextField!
        }
    }
    func makePlaceholder(Placeholder:String) -> (()->(UITextField)) {
        tempTextField?.placeholder = placeholder
        return { ()->UITextField in
            return tempTextField!
        }
    }
    func makeTextFont(fontSzie:CGFloat) -> (()->(UITextField)) {
        tempTextField?.font = UIFont.systemFont(ofSize: fontSzie)
        return { ()->UITextField in
            return tempTextField!
        }
    }
}
