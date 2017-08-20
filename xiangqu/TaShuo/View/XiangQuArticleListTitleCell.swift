//
//  XiangQuArticleListTitleCell.swift
//  xiangqu
//
//  Created by mrsiu on 2017/8/1.
//  Copyright © 2017年 mrsiu. All rights reserved.
//

import UIKit

class XiangQuArticleListTitleCell: UITableViewCell {
    weak var titleLabel:UILabel?
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// 初始化UI
    func setupUI(){
        let titleLabel = UILabel()
        
        self.titleLabel = titleLabel
        
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        
        addSubview(titleLabel)
        
        //设置titleLabel约束
        titleLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(self)
            make.left.equalTo(self).offset(17)
            make.right.equalTo(self).offset(-17)
        }
        
        
    }
}
