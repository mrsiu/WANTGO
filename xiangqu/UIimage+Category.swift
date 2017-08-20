//
//  UIimage+Category.swift
//  xiangqu
//
//  Created by mrsiu on 2017/7/18.
//  Copyright © 2017年 mrsiu. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
     class func renderOriginalImage(named: String) -> UIImage {
        
        let image = UIImage(named: named)
        
        guard var unwarppedImage = image else {
            return UIImage()
        }
        
        unwarppedImage = unwarppedImage.withRenderingMode(.alwaysOriginal)
        
        return unwarppedImage
        
    }
}
