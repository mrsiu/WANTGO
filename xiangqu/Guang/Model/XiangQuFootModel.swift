//
//  XiangQuFootModel.swift
//  xiangqu
//
//  Created by mrsiu on 2017/7/26.
//  Copyright © 2017年 mrsiu. All rights reserved.
//

import UIKit

class XiangQuFootModel: NSObject {
    var nickName = ""
    var productDescription = ""
    var price = 0
    var favNum = 0
    var image = ""
    
    init(dict: [String : Any]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}
