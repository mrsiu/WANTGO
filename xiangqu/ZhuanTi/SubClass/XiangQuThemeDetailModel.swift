//
//  XiangQuThemeDetailModel.swift
//  xiangqu
//
//  Created by mrsiu on 2017/8/7.
//  Copyright © 2017年 mrsiu. All rights reserved.
//

import UIKit

class XiangQuThemeDetailModel: NSObject {
    var list = [XiangQuThemeDetailListModel]()
    var name = ""
    var url = ""
    
    init(dict: [String : Any]) {
        super.init()
        setValuesForKeys(dict)
        guard let Arr = dict["list"] as? [[String:Any]] else {
            return
        }
        self.list = Arr.map{XiangQuThemeDetailListModel(dict: $0)}
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}
