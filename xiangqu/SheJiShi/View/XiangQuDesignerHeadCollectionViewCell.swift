//
//  XiangQuDesignerHeadCollectionViewCell.swift
//  xiangqu
//
//  Created by mrsiu on 2017/7/31.
//  Copyright © 2017年 mrsiu. All rights reserved.
//

import UIKit

class XiangQuDesignerHeadCollectionViewCell: UICollectionViewCell {

    weak var imageV: UIImageView?
    
    weak var collectionV: UICollectionView?
    weak var subTitleL: UILabel?
    weak var titleL: UILabel?
    
    var designerHeadModel:XiangQuDesignHeadModel? {
        didSet {
            guard let designerHeadModel = designerHeadModel else {
                return
            }
            let url = URL(string: designerHeadModel.banner)
            imageV?.kf.setImage(with: url)
            titleL?.text = designerHeadModel.userNick + " | " + designerHeadModel.shopName
            subTitleL?.text = designerHeadModel.opTag
            
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let imageV = UIImageView()
        let coverView = UIImageView(image: UIImage(named: "2246997567801918446#1"))
        let titleL = UILabel()
        let subTitleL = UILabel()
        let collectionV = UICollectionView(frame: CGRect(), collectionViewLayout: layout())
        
        self.imageV = imageV
        self.subTitleL = subTitleL
        self.titleL = titleL
        self.collectionV = collectionV
        
        titleL.font = UIFont.boldSystemFont(ofSize: 18)
        titleL.textColor = .white
        
        subTitleL.font = UIFont.boldSystemFont(ofSize: 14)
        subTitleL.textColor = .white
        
        imageV.contentMode = .scaleAspectFill
        
        addSubview(imageV)
        addSubview(coverView)
        addSubview(titleL)
        addSubview(subTitleL)
        addSubview(collectionV)
        
        imageV.snp.makeConstraints { (make) in
            make.left.right.bottom.top.equalTo(self)
        }
        coverView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(self)
            make.height.equalTo(125)
        }
        collectionV.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(17)
            make.right.equalTo(self).offset(-17)
            make.bottom.equalTo(self).offset(-15)
            make.height.equalTo(13)
        }
        titleL.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(17)
            make.bottom.equalTo(self).offset(-58)
        }
        subTitleL.snp.makeConstraints { (make) in
            make.top.equalTo(titleL.snp.bottom)
            make.leading.equalTo(titleL)
        }
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func layout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 0
        return layout
    }
}
