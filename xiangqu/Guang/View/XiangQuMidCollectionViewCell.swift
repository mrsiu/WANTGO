//
//  XiangQuMidCollectionViewCell.swift
//  xiangqu
//
//  Created by mrsiu on 2017/7/26.
//  Copyright © 2017年 mrsiu. All rights reserved.
//

import UIKit
import Kingfisher

class XiangQuMidCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var brandNameL: UILabel!
    @IBOutlet weak var imageV: UIImageView!
    @IBOutlet weak var keywordL: UILabel!
    @IBOutlet weak var priceL: UILabel!
    
    var midItemModel: XiangQuMidItemModel? {
        didSet {
            guard let midItemModel = midItemModel else {
                return
            }
            
            brandNameL.text = midItemModel.brandName
            keywordL.text = midItemModel.keyword
            priceL.text = String(midItemModel.price)
            let url = URL(string: midItemModel.image)
            imageV.kf.setImage(with: url)
            
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
