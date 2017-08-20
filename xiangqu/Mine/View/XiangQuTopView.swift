//
//  XiangQuTopView.swift
//  xiangqu
//
//  Created by mrsiu on 2017/7/20.
//  Copyright © 2017年 mrsiu. All rights reserved.
//

import UIKit

class XiangQuTopView: UIView {

    @IBOutlet weak var loginBtn: UIButton!
    class func viewFromXib(frame: CGRect)-> UIView {
        let view =  Bundle.main.loadNibNamed("XiangQuTopView", owner: nil, options: nil)?.last as! UIView
        
        view.frame = frame
        
        return view
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        loginBtn.layer.cornerRadius = 5
        loginBtn.layer.borderWidth = 1
        loginBtn.layer.borderColor = UIColor.white.cgColor
    }

}
