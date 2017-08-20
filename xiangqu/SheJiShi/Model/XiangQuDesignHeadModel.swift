//
//  XiangQuDesignHeadModel.swift
//  xiangqu
//
//  Created by mrsiu on 2017/7/31.
//  Copyright © 2017年 mrsiu. All rights reserved.
//

import UIKit

class XiangQuDesignHeadModel: NSObject {
    var banner = ""
    var opTag = ""
    var shopName = ""
    var tags = [[String:Any]]()
    var userNick = ""
    
    
    init(dict: [String : Any]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}
