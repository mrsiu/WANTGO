//
//  XiangQuArticleListImageContentCell.swift
//  xiangqu
//
//  Created by mrsiu on 2017/8/1.
//  Copyright © 2017年 mrsiu. All rights reserved.
//

import UIKit

class XiangQuArticleListImageContentCell: UITableViewCell {
    weak var imageV: UIImageView?

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// 初始化UI
    func setupUI(){
        let imageV = UIImageView()
        self.imageV = imageV

        addSubview(imageV)
        
        imageV.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(17)
            make.right.equalTo(self).offset(-17)
            make.top.equalTo(self).offset(0)
            make.bottom.equalTo(self).offset(-8)
        }
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        imageV?.clipsToBounds = true
        imageV?.contentMode = .scaleAspectFill
    }
}
