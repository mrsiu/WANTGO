//
//  XiangQuTopCell.swift
//  xiangqu
//
//  Created by mrsiu on 2017/7/25.
//  Copyright © 2017年 mrsiu. All rights reserved.
//

import UIKit

let TopCollectionViewCell = "TopCollectionViewCell"

class XiangQuTopCell: UITableViewCell {
    var flowLayout:UICollectionViewFlowLayout?
    weak var collectionView: UICollectionView?
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let collectionView = UICollectionView(frame: CGRect(), collectionViewLayout: layout())
        collectionView.backgroundColor = .white
        self.collectionView = collectionView
        addSubview(collectionView)
        //设置代理
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalTo(self)
        }
        collectionView.register(XiangQuTopCollectionViewCell.self, forCellWithReuseIdentifier: TopCollectionViewCell)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var topCells: [XiangQuGuangHeadModel]? {
        didSet{

            collectionView?.reloadData()
        }
    }
    
    func layout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        flowLayout = layout
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 5, left: 0, bottom: 0, right: -5)
        return layout
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        let itemW = self.frame.width / 4
        let itemH = self.frame.height / 2 - 10
        flowLayout?.itemSize = CGSize(width: itemW, height: itemH)
    }
    
}

extension XiangQuTopCell:UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return topCells!.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopCollectionViewCell, for: indexPath) as! XiangQuTopCollectionViewCell
        
        cell.topModel = self.topCells?[indexPath.row]
        
        return cell
    }
}

extension XiangQuTopCell:UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = self.collectionView(collectionView, cellForItemAt: indexPath) as! XiangQuTopCollectionViewCell
        print(cell.title?.text)

    }
}
