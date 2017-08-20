//
//  XiangQuArticleListTextContentCell.swift
//  xiangqu
//
//  Created by mrsiu on 2017/8/1.
//  Copyright © 2017年 mrsiu. All rights reserved.
//

import UIKit

class XiangQuArticleListTextContentCell: UITableViewCell {
    weak var titleL: UILabel?

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// 初始化UI
    func setupUI(){
        let titleL = UILabel()
        
        self.titleL = titleL
        
        titleL.font = UIFont.systemFont(ofSize: 14)
        titleL.textColor = UIColor.hexStringToColor(hexString: "4A4A4A")
        titleL.numberOfLines = 2
        
        addSubview(titleL)
        
        //设置titleLabel约束
        titleL.snp.makeConstraints { (make) in
            make.top.equalTo(self)
            make.left.equalTo(self).offset(17)
            make.right.equalTo(self).offset(-17)
            make.bottom.equalTo(self).offset(-8)
        }
        
        
    }
}
