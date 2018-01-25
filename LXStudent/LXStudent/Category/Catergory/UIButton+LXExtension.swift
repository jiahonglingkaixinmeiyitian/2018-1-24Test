//
//  UIButton+LXExtension.swift
//  LXStudent
//
//  Created by 尚 on 2017/11/3.
//  Copyright © 2017年 cheng.shang. All rights reserved.
//

import Foundation


var btn:UIButton?

extension UIButton{
    

    /**
     设置按钮的title
     */
    func makeBtnTitle(title:String) ->(()->(UIButton)) {
        
        return {()->(UIButton) in
            btn?.setTitle(title, for: .normal)
            return btn!
        }
    }

    /**
     设置按钮的字体
     */
    func makeBtnTextFont(fontSize:CGFloat) ->(()->(UIButton)) {
        
        return {()->(UIButton) in
            btn?.titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
            return btn!
        }
    }

    /**
     设置按钮的normal的image
     */
    func makeBtnNorImage(norImageStr:String) -> (()->(UIButton)) {
        
        return {()->(UIButton) in
            btn?.setImage(UIImage(named:norImageStr), for: .normal)
            return btn!
        }
    }
    /**
     设置按钮选择的image
     */
    func makeSelImageName(selImageStr:String) -> (()->(UIButton)) {
        
        return { () ->(UIButton) in
            btn?.setImage(UIImage(named:selImageStr), for: .selected)
            return btn!
        }
    }

    /**
     设置按钮的normal的textcolor
     */
    func makeNormalTextColor(norTextColor:String) -> (()->(UIButton)) {
        
        return { () ->(UIButton) in
            btn?.setTitleColor(UIColor.init(hexString: norTextColor), for: .normal)
            return btn!
        }
    }

    /**
     设置按钮的选中的字体颜色
     */
    func makeSelectTextColor(selectTextColor:String) -> (()->(UIButton)) {
        
        return { () ->(UIButton) in
            btn?.setTitleColor(UIColor.init(hexString: selectTextColor), for: .selected)
            return btn!
        }
    }
    /**
     设置文字的剧中样式
     */
    func makeTextAlignment(alignment:NSTextAlignment) -> (()->(UIButton)) {
        
        return { () ->(UIButton) in
            btn?.titleLabel?.textAlignment = alignment
            return btn!
        }
    }
    
    
    /**
     创建按钮
     */
    class func makeBtn() ->UIButton {
        return {()->UIButton in
            if btn != nil {
                btn = nil
            }
            btn = UIButton()
            return btn!
            }()
    }
    
    //判断是否存在but
    class func isHasBut(){
        if btn != nil{
            
        }else{
           _ = self.makeBtn()
        }
    }
    
    /**
     设置按钮的title/// 默认第一次进入的时候清空....
     */
    class func makeBtnTitle(ofTitle title:String) ->UIButton {
        return {()->UIButton in
            self.isHasBut()
            btn?.setTitle(title, for: .normal)
            return btn!
            }()
    }
    /**
     设置按钮字体大小
     */
    class func makeBtnTextFont(ofFont fontSize:CGFloat) ->UIButton {
        return {()->UIButton in
            self.isHasBut()
            btn?.titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
            return btn!
            }()
    }
    /**
     设置按钮normal的字体颜色
     */
    class func makeBtnNormalTextColor(ofnorColor hexStr:String) ->UIButton {
        self.isHasBut()
        return {()->UIButton in
            btn?.setTitleColor(UIColor.init(hexString: hexStr), for: .normal)
            return btn!
            }()
    }
    /**
     设置按钮选中的字体颜色
     */
    class func makeBtnSelectTextColor(ofSelColor hexStr:String) ->UIButton {
        self.isHasBut()
        return {()->UIButton in
            btn?.setTitleColor(UIColor.init(hexString: hexStr), for: .selected)
            return btn!
            }()
    }
    /**
     设置按钮normal的图片
     */
    class func makeBtnNormalImage(ofNormalImage imageName:String) ->UIButton {
        self.isHasBut()
        return {()->UIButton in
            btn?.setImage(UIImage(named:imageName), for: .normal)
            return btn!
            }()
    }
    /**
     设置按钮选中的图片
     */
    class func makeBtnSelImageName(ofSelIamgeName imageName:String) ->UIButton {
        self.isHasBut()
        return {()->UIButton in
            btn?.setImage(UIImage(named:imageName), for: .selected)
            return btn!
            }()
    }
    /**
     设置按钮文本对齐模式
     */
    class func makeTextAlignment(ofTextAlignment textAlignment:NSTextAlignment) -> UIButton {
        self.isHasBut()
        return { ()->(UIButton) in
            btn?.titleLabel?.textAlignment = textAlignment
            return btn!
            }()
    }
    
    
}
