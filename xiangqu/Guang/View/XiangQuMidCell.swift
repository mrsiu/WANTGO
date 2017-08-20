//
//  XiangQuMidCell.swift
//  xiangqu
//
//  Created by mrsiu on 2017/7/26.
//  Copyright © 2017年 mrsiu. All rights reserved.
//

import UIKit
import Kingfisher
private let reuseIdentifier1 = "midItemCell"
class XiangQuMidCell: UITableViewCell {
    @IBOutlet weak var nameL: UILabel!
    @IBOutlet weak var titleL: UILabel!
    @IBOutlet weak var imageV: UIImageView!

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var allBtn: UIButton!
    var midModel : XiangQuGuangMidModel? {
        didSet {
            guard let midModel = midModel else {
                return
            }
            
            nameL.text = midModel.name
            titleL.text = midModel.title
            let url = URL(string: midModel.image)
            imageV.kf.setImage(with: url)
            dataSource = midModel.dataSource
        }
    }
    
    fileprivate var dataSource = [XiangQuMidItemModel]() {
        didSet{
                collectionView.reloadData()
        }
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        allBtn.layer.borderColor = UIColor.white.cgColor
        allBtn.layer.borderWidth = 1
        self.selectionStyle = .none
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib.init(nibName: "XiangQuMidCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier1)
        
    }
    
}

extension XiangQuMidCell : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:reuseIdentifier1, for: indexPath) as! XiangQuMidCollectionViewCell
        cell.midItemModel = dataSource[indexPath.row]
        
        return cell
    }
}

extension XiangQuMidCell : UICollectionViewDelegate {
    
}
