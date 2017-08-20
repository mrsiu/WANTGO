//
//  XiangQuTopCollectionViewCell.swift
//  xiangqu
//
//  Created by mrsiu on 2017/7/25.
//  Copyright © 2017年 mrsiu. All rights reserved.
//

import UIKit
import Kingfisher
class XiangQuTopCollectionViewCell: UICollectionViewCell {

     weak var title: UILabel?
     weak var iconImageView: UIImageView?

    
    var topModel: XiangQuGuangHeadModel?{
        didSet {
            guard let topModel = topModel else {
                return
            }
            let url = URL(string: topModel.logo)
            iconImageView?.kf.setImage(with: url)
            title?.text = topModel.name
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .center
        let imageView = UIImageView()
        self.title = label
        self.iconImageView = imageView
        addSubview(label)
        addSubview(imageView)
        
        imageView.snp.makeConstraints { (make) in
            make.height.width.equalTo(36)
            make.top.equalTo(self).offset(12)
            make.centerX.equalTo(self)
        }
        label.snp.makeConstraints { (make) in
            make.bottom.left.right.equalTo(self)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
