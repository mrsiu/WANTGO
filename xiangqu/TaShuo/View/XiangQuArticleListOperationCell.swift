//
//  XiangQuArticleListOperationCell.swift
//  xiangqu
//
//  Created by mrsiu on 2017/8/1.
//  Copyright © 2017年 mrsiu. All rights reserved.
//

import UIKit

class XiangQuArticleListOperationCell: UITableViewCell {
    weak var likeCount: UILabel?
    weak var postCount: UILabel?
    weak var dateL: UILabel?

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// 初始化UI
    func setupUI(){
        let favView = UIImageView(image: UIImage(named: "2247468218908147910#1"))
        let commentView = UIImageView(image: UIImage(named: "2247468218908147922#1"))
        addSubview(favView)
        addSubview(commentView)
        let likeCount = UILabel()
        self.likeCount = likeCount
        addSubview(likeCount)
        let postCount = UILabel()
        self.postCount = postCount
        addSubview(postCount)
        
        let dateL = UILabel()
        self.dateL = dateL
        addSubview(dateL)
        
        for view in self.subviews {
            guard let view = view as? UILabel else {
                continue
            }
            view.font = UIFont.systemFont(ofSize: 12)
            view.textColor = UIColor.hexStringToColor(hexString: "AAAAAA")
        }
        
        favView.snp.makeConstraints { (make) in
            make.width.height.equalTo(28)
            make.left.equalTo(self).offset(17)
            make.centerY.equalTo(self)
        }
        
        likeCount.snp.makeConstraints { (make) in
            
            make.left.equalTo(favView.snp.right)
            make.centerY.equalTo(self)
        }
        commentView.snp.makeConstraints { (make) in
            make.left.equalTo(likeCount.snp.right).offset(15)
            make.width.height.equalTo(28)
            make.centerY.equalTo(self)
        }
        postCount.snp.makeConstraints { (make) in
            
            make.left.equalTo(commentView.snp.right)
            make.centerY.equalTo(self)
        }
        dateL.snp.makeConstraints { (make) in
            make.right.equalTo(self).offset(-17)
            make.centerY.equalTo(self)
        }
    }
    
}
