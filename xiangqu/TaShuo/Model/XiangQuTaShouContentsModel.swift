//
//  XiangQuTaShouContentsModel.swift
//  xiangqu
//
//  Created by mrsiu on 2017/8/1.
//  Copyright © 2017年 mrsiu. All rights reserved.
//

import UIKit

class XiangQuTaShouContentsModel: NSObject {
    var content = ""
    var type = 0
    
    init(dict: [String : Any]) {
        super.init()
        setValuesForKeys(dict)
        
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}
