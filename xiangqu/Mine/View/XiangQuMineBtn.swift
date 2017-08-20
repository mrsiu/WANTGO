//
//  XiangQuMineBtn.swift
//  xiangqu
//
//  Created by mrsiu on 2017/7/19.
//  Copyright © 2017年 mrsiu. All rights reserved.
//

import UIKit

class XiangQuMineBtn: UIButton {
    


    

    override func layoutSubviews() {
        
        super.layoutSubviews()

        guard let imageView = self.imageView else {
            return
        }
        
        guard let titleLabel = self.titleLabel else {
            return
        }
        imageView.center.x = self.frame.width * 0.5
        imageView.frame.origin.y = 10
        titleLabel.center.x = self.frame.width * 0.5
        titleLabel.sizeToFit()
        titleLabel.frame.origin.y = self.frame.height - titleLabel.frame.height  - 10
        
        
        
        
        
    }
}
