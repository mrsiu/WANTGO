//
//  XiangQuThemeDetailListModel.swift
//  xiangqu
//
//  Created by mrsiu on 2017/8/7.
//  Copyright © 2017年 mrsiu. All rights reserved.
//

import UIKit

class XiangQuThemeDetailListModel: NSObject {
    var image = ""
    var text = ""
    
    init(dict: [String : Any]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}
