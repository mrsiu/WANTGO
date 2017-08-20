//
//  XiangQuArticleListCommentCell.swift
//  xiangqu
//
//  Created by mrsiu on 2017/8/1.
//  Copyright © 2017年 mrsiu. All rights reserved.
//

import UIKit

class XiangQuArticleListCommentCell: UITableViewCell {
    weak var imageV: UIImageView?

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
        let imageV = UIImageView()
        self.imageV = imageV
        addSubview(imageV)
        let titleL = UILabel()
        self.titleL = titleL
        addSubview(titleL)
        
        titleL.font = UIFont.systemFont(ofSize: 14)
        titleL.textColor = UIColor.hexStringToColor(hexString: "AAAAAA")
        
        imageV.snp.makeConstraints { (make) in
            make.width.height.equalTo(17)
            make.left.equalTo(self).offset(17)
            make.centerY.equalTo(self)
        }
        titleL.snp.makeConstraints { (make) in
            make.left.equalTo(imageV.snp.right).offset(5)
            make.centerY.equalTo(self)
            make.right.equalTo(self).offset(-17)
        }
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        //设置圆角
        self.imageV?.layer.cornerRadius = (self.imageV?.frame.width)! / 2
        self.imageV?.layer.borderWidth = 1
        self.imageV?.layer.borderColor = UIColor.init(colorLiteralRed: 0, green: 0, blue: 0, alpha: 0.3).cgColor
        self.imageV?.layer.masksToBounds = true
    }
    
}
