//
//  XiangQuTaShuoCommentsModel.swift
//  xiangqu
//
//  Created by mrsiu on 2017/8/1.
//  Copyright © 2017年 mrsiu. All rights reserved.
//

import UIKit

class XiangQuTaShuoCommentsModel: NSObject {
    var avaPath = ""
    var content = ""
    var nick = ""
    
    init(dict: [String : Any]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}
