//
//  XiangQuDesignerLayout.swift
//  xiangqu
//
//  Created by mrsiu on 2017/7/30.
//  Copyright © 2017年 mrsiu. All rights reserved.
//

import UIKit

class XiangQuDesignerLayout: UICollectionViewLayout {
    
    fileprivate var collectionViewHeight:CGFloat?
    

    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var attributesArray = [UICollectionViewLayoutAttributes]()
        
        //获取section
        guard let sectionCount = self.collectionView?.numberOfSections else {
            return nil
        }
        
        //循环便利 section
        for i in 0..<sectionCount {
            
            //获取section里面的元素个数
            guard let cellCount = self.collectionView?.numberOfItems(inSection: i) else {
                return nil
            }
            
            //循环给每个section里面的元素 定义属性
            
            for j in 0..<cellCount {
                let indexPath = IndexPath(item: j, section: i)
                
                let attributes = self.layoutAttributesForItem(at: indexPath)
                
                attributesArray.append(attributes!)
            }
        }
        return attributesArray
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        // 获取当前布局属性
        let attribute = UICollectionViewLayoutAttributes(forCellWith: indexPath)
        //屏幕宽高
        let width = UIScreen.main.bounds.size.width
        let cellheight:CGFloat = 252.0
        if indexPath.section == 0 {
            let cellWidth = width
            
            
            attribute.frame = CGRect(x: 0, y: 0, width: cellWidth, height: cellheight)
            
        } else if indexPath.section == 1 {
            let space:CGFloat = 2
            let cellWidth = (width - space) / 2
            let row = indexPath.item / 2
            let col = indexPath.item % 2
            let x = (cellWidth+space)*CGFloat(col)
            let y = (cellWidth+space)*CGFloat(row)
            
            attribute.frame = CGRect(x: x, y: y+cellheight, width: cellWidth, height: cellWidth)
            
            if indexPath.item == (self.collectionView?.numberOfItems(inSection: 1))!-1 {
                   collectionViewHeight = attribute.frame.maxY
                
            }
            
        }
        return attribute
        
    }
    
    override var collectionViewContentSize: CGSize {
        get {
            
           return CGSize(width: UIScreen.main.bounds.size.width, height: collectionViewHeight ?? 0)
        }
    }

}
