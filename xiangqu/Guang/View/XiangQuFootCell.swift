//
//  XiangQuFootCell.swift
//  xiangqu
//
//  Created by mrsiu on 2017/7/26.
//  Copyright © 2017年 mrsiu. All rights reserved.
//

import UIKit

class XiangQuFootCell: UITableViewCell {
    
    @IBOutlet weak var imageV1: UIImageView!
    @IBOutlet weak var imageV2: UIImageView!
    @IBOutlet weak var priceL1: UILabel!
    @IBOutlet weak var priceL2: UILabel!
    @IBOutlet weak var titleL1: UILabel!
    @IBOutlet weak var titleL2: UILabel!
    @IBOutlet weak var tagL1: UILabel!
    @IBOutlet weak var tagL2: UILabel!
    @IBOutlet weak var likeBtn1: UIButton!
    @IBOutlet weak var likeBtn2: UIButton!
    
    var footModels : [XiangQuFootModel]? {
        didSet{
            guard let footModels = footModels else {
                return
            }
            let footModel1 = footModels[0]
            let url1 = URL(string: footModel1.image)
            imageV1.kf.setImage(with: url1)
            priceL1.text = String(footModel1.price)
            titleL1.text = footModel1.nickName
            tagL1.text = footModel1.productDescription
            likeBtn1.setTitle(String(footModel1.favNum), for: .normal)
            likeBtn1.setImage(UIImage.init(named:"2245260485458919995#1"), for: .normal)
            
            let footModel2 = footModels[1]
            let url2 = URL(string: footModel2.image)
            imageV2.kf.setImage(with: url2)
            priceL2.text = String(footModel2.price)
            titleL2.text = footModel2.nickName
            tagL2.text = footModel2.productDescription
            likeBtn2.setTitle(String(footModel2.favNum), for: .normal)
            likeBtn2.setImage(UIImage.init(named:"2245260485458919995#1"), for: .normal)
            
            
            
        }
    }
}



