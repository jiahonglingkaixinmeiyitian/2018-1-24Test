
//
//  LXLoginTextView.swift
//  LXStudent
//
//  Created by 尚 on 2017/11/6.
//  Copyright © 2017年 cheng.shang. All rights reserved.
//

import UIKit


private var placrHolder:String?
private var imageNamed:String?


class LXLoginTextView : UIView {
    @IBOutlet weak var backBut: UIButton!
    
    @IBOutlet weak var leftImageView: UIImageView!
    
    @IBOutlet weak var commonTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = CodeAdaptation.YNFLoatChange(size: 5.0)
        self.layer.masksToBounds = true
        
        self.layer.borderColor = UIColor.init(hexString: "0xeff0f4")?.cgColor
        self.layer.borderWidth = CodeAdaptation.YNFLoatChange(size: 1.0)
        
        self.backBut.backgroundColor = UIColor.clear
        
        self.backBut.isEnabled = false
        
        self.leftImageView.image = UIImage(named:imageNamed!)
        
        let attributeString:NSMutableAttributedString = NSMutableAttributedString(string:placrHolder!, attributes: [NSAttributedStringKey.font:UIFont.systemFont(ofSize: CodeAdaptation.YNFLoatChange(size: size16)),NSAttributedStringKey.foregroundColor:(UIColor.init(hexString: "a4b7bc")!)])
        self.commonTextField.attributedPlaceholder = attributeString
       
    }
    
    class func textView(placeHolderString:String,imageName:String) -> LXLoginTextView {
        
        placrHolder = placeHolderString
        imageNamed = imageName
        return Bundle.main.loadNibNamed("LXLoginTextView", owner: nil, options: nil)?.last as! LXLoginTextView
    }
}
