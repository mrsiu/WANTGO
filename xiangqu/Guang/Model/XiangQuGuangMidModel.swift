//
//  XiangQuGuangMidModel.swift
//  xiangqu
//
//  Created by mrsiu on 2017/7/26.
//  Copyright © 2017年 mrsiu. All rights reserved.
//

import UIKit

class XiangQuGuangMidModel: NSObject {
    var title = ""
    var h5Url = ""
    var id = 0
    var image = ""
    var name = ""
    var items = [[String:Any]]()
    var dataSource = [XiangQuMidItemModel]()

    
    init(dict: [String : Any]) {
        super.init()
        setValuesForKeys(dict)
        dataSource = items.map{ XiangQuMidItemModel(dict: $0) }
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    
}
