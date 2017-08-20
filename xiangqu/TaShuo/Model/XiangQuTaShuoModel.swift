//
//  XiangQuTaShuoModel.swift
//  xiangqu
//
//  Created by mrsiu on 2017/8/1.
//  Copyright © 2017年 mrsiu. All rights reserved.
//

import UIKit

class XiangQuTaShuoModel: NSObject {
    var authorAvatarURL = ""
    var authorName = ""
    var authorTag = ""
    var commentNum = 0
    var createAt = ""
    var favorNum = 0
    var postTitle = ""
    var comments = [XiangQuTaShuoCommentsModel]()
    var contents = [XiangQuTaShouContentsModel]()
    
    init(dict: [String : Any]) {
        super.init()
        setValuesForKeys(dict)
        guard let commentsArr = dict["comments"] as? [[String:Any]] else {
            return
        }
        self.comments = commentsArr.map{XiangQuTaShuoCommentsModel(dict: $0)}
        
        guard let contentsArr = dict["contents"] as? [[String:Any]] else {
            return
        }
        self.contents = contentsArr.map{XiangQuTaShouContentsModel(dict: $0)}
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}
