//
//  XiangQuZhuanTiReuseView.swift
//  xiangqu
//
//  Created by mrsiu on 2017/7/31.
//  Copyright © 2017年 mrsiu. All rights reserved.
//

import UIKit

class XiangQuZhuanTiReuseView: UIView {

        
        
        @IBOutlet weak var imageV: UIImageView!
        
        class func loadFromNib() -> XiangQuZhuanTiReuseView {
            let nibView = Bundle.main.loadNibNamed("XiangQuZhuanTiReuseView", owner: nil, options: nil)
            guard let view = nibView?.first as? XiangQuZhuanTiReuseView else {
                return XiangQuZhuanTiReuseView()
            }
            return view
        }
        
        var zhuanTiModel:XiangQuZhuanTiModel? {
            didSet {
                guard let zhuanTiModel = zhuanTiModel else {
                    return
                }
                let url = URL(string: zhuanTiModel.image)
                imageV.kf.setImage(with: url)
            }
        }
        



}
