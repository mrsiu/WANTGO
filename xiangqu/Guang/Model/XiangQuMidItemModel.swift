//
//  XiangQuMidItemModel.swift
//  xiangqu
//
//  Created by mrsiu on 2017/7/26.
//  Copyright © 2017年 mrsiu. All rights reserved.
//

import UIKit

class XiangQuMidItemModel: NSObject {
    var brandName = ""
    var id = 0
    var image = ""
    var keyword = ""
    var originalPrice = 0.0
    var price = 0.0
    
    init(dict: [String : Any]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    
}
