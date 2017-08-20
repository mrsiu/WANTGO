//
//  XiangQuDesignMidModel.swift
//  xiangqu
//
//  Created by mrsiu on 2017/7/31.
//  Copyright © 2017年 mrsiu. All rights reserved.
//

import UIKit

class XiangQuDesignMidModel: NSObject {
    
    var image = ""
    var name = ""
    
    
    init(dict: [String : Any]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }

}
