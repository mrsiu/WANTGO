//
//  XiangQuArticleListAuthorCell.swift
//  xiangqu
//
//  Created by mrsiu on 2017/8/1.
//  Copyright © 2017年 mrsiu. All rights reserved.
//

import UIKit

class XiangQuArticleListAuthorCell: UITableViewCell {
     weak var iconView:UIImageView?
     weak var nameLabel:UILabel?
     weak var signLabel:UILabel?
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// 初始化UI
    func setupUI(){
        let iconView = UIImageView()
        self.iconView = iconView
        let nameLabel = UILabel()
        self.nameLabel = nameLabel
        let signLabel = UILabel()
        self.signLabel = signLabel
        addSubview(iconView)
        addSubview(nameLabel)
        addSubview(signLabel)
        
        
        //设置iconView约束
        iconView.snp.makeConstraints({ (make) in
            make.width.height.equalTo(33)
            make.left.equalTo(self).offset(17)
            make.centerY.equalTo(self)
        })
        

        //设置nameLabel约束
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(iconView)
            make.left.equalTo(iconView.snp.right).offset(8)
        }
        //设置signLabel约束
        signLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(iconView)
            make.left.equalTo(iconView.snp.right).offset(8)
        }
        
        
        nameLabel.font = .systemFont(ofSize: 14)
        nameLabel.textColor = UIColor.hexStringToColor(hexString: "858585")
        
        signLabel.font = .systemFont(ofSize: 12)
        signLabel.textColor = UIColor.hexStringToColor(hexString: "AAAAAA")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        //设置圆角
        self.iconView?.layer.cornerRadius = (self.iconView?.frame.width)! / 2
        self.iconView?.layer.borderWidth = 1
        self.iconView?.layer.borderColor = UIColor.init(colorLiteralRed: 0, green: 0, blue: 0, alpha: 0.3).cgColor
        self.iconView?.layer.masksToBounds = true
    }
}
