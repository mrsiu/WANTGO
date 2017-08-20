//
//  XiangQuDesignerMidCollectionViewCell.swift
//  xiangqu
//
//  Created by mrsiu on 2017/7/31.
//  Copyright © 2017年 mrsiu. All rights reserved.
//

import UIKit

class XiangQuDesignerMidCollectionViewCell: UICollectionViewCell {
    
    var designerMidModel:XiangQuDesignMidModel? {
        didSet {
            guard let designerMidModel = designerMidModel else {
                return
            }
            let url = URL(string: designerMidModel.image)
            imageV?.kf.setImage(with: url)
            titleL?.text = designerMidModel.name
        }
    }
    
    weak var imageV: UIImageView?

    weak var blurView: UIView? 
    weak var titleL: UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let imageV = UIImageView()
        let blurView = UIView()
        let titleL = UILabel()
        self.imageV = imageV
        self.blurView = blurView
        blurView.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.5)
        self.titleL = titleL
        titleL.textColor = .white
        addSubview(imageV)
        addSubview(blurView)
        blurView.addSubview(titleL)
        
        imageV.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalTo(self)
        }
        blurView.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalTo(self)
        }
        titleL.snp.makeConstraints { (make) in
            make.center.equalTo(blurView)
        }
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
//    func tapG(ges: UIGestureRecognizer) {
//        if ges.state == .ended {
//            blurView.isHidden = false
//        } else {
//            blurView.isHidden = true
//        }
//    }
    
//    override var isSelected: Bool {
//        didSet{
//            blurView.isHidden = isSelected ? true : false
//        }
//    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        blurView?.isHidden = true
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        blurView?.isHidden = false
    }
//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        blurView.isHidden = false
//    }
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        blurView?.isHidden = false
    }
}
