//
//  XiangQuGuangHeadModel.swift
//  xiangqu
//
//  Created by mrsiu on 2017/7/24.
//  Copyright © 2017年 mrsiu. All rights reserved.
//

import UIKit

class XiangQuGuangHeadModel: NSObject {
    var id = 0
    var name = ""
    var logo = ""
    
    init(dict: [String : Any]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    
}
