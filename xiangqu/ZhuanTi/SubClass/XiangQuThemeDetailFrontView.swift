//
//  XiangQuThemeDetailFrontView.swift
//  xiangqu
//
//  Created by mrsiu on 2017/8/10.
//  Copyright © 2017年 mrsiu. All rights reserved.
//

import UIKit

class XiangQuThemeDetailFrontView: UIView {
    weak var footView:UIView!
    weak var label:UILabel!
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let logoView = UIImageView(frame: CGRect(x: 15, y: 30, width: 38, height: 20))
            
        addSubview(logoView)
        
        setUpFooterView()
        setUpLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpFooterView() {
        let footView = UIView()
        self.footView = footView
        addSubview(footView)
        
        
        let homeBtn = UIButton(type: .custom)
        let sharedBtn = UIButton(type: .custom)
        let pageControl = UIPageControl()
        footView.addSubview(homeBtn)
        footView.addSubview(sharedBtn)
        footView.addSubview(pageControl)
        
        homeBtn.addTarget(self, action: #selector(homBtnClick), for: .touchUpInside)
        sharedBtn.addTarget(self, action: #selector(sharedBtnClick), for: .touchUpInside)
        
        footView.snp.makeConstraints { (make) in
            make.height.equalTo(59)
            make.bottom.equalTo(self)
            make.left.equalTo(self).offset(15)
            make.right.equalTo(self).offset(-15)
            
        }
        homeBtn.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(9)
            make.centerY.equalTo(self)
            make.width.height.equalTo(23)
        }
        
        sharedBtn.snp.makeConstraints { (make) in
            make.left.equalTo(homeBtn.snp.right).offset(22)
            make.centerY.equalTo(self)
            make.width.height.equalTo(23)
        }
        
        footView.snp.makeConstraints { (make) in
            make.right.equalTo(self).offset(-9)
            make.centerY.equalTo(self)
        }
        
    }
    
    func homBtnClick(sender: UIButton) {
        print(sender)
    }
    func sharedBtnClick(sender: UIButton) {
        print(sender)
    }
    
    
    func setUpLabel() {
        let label = UILabel()
        self.label = label
        addSubview(label)
        
        label.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(24)
            make.right.equalTo(self).offset(-24)
            make.bottom.equalTo(footView.snp.top).offset(-10)
        }
    }

}
