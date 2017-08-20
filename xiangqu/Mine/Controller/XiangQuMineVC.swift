//
//  XiangQuMineVC.swift
//  xiangqu
//
//  Created by mrsiu on 2017/7/17.
//  Copyright © 2017年 mrsiu. All rights reserved.
//

import UIKit

class XiangQuMineVC: UITableViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.sectionHeaderHeight = 0
        self.setUpHeaderView()
        self.automaticallyAdjustsScrollViewInsets = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    var topView: XiangQuTopView? 
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    override func viewDidAppear(_ animated: Bool) {
        
        let coverView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 65))
        
        coverView.backgroundColor = UIColor(colorLiteralRed: 21/255.0, green: 21/255.0, blue: 21/255.0, alpha: 1)
        
        
        let btn = UIButton(frame: CGRect(x: 315, y: 0, width: 60, height: 60))
        btn.setImage(UIImage.init(named: "2243281721011208361#1"), for: .normal)
        btn.imageEdgeInsets = UIEdgeInsetsMake(15, 10, 0, 0)
        self.tableView.superview?.addSubview(coverView)
        self.tableView.superview?.addSubview(btn)
    }
}

extension XiangQuMineVC {
    func setUpHeaderView() {
        let headerView = UIView(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 270))
        headerView.backgroundColor = .red
        self.tableView.tableHeaderView = headerView
        self.tableView.tableHeaderView?.alpha = 0
        
        topView = XiangQuTopView.viewFromXib(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 260)) as? XiangQuTopView
        topView?.backgroundColor = .blue
        self.view.insertSubview(topView!, at: 0)
    }
    
}

extension XiangQuMineVC {
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(self.tableView.contentOffset)
        let offsetY = self.tableView.contentOffset.y
        if offsetY > 0 {
            topView?.frame = CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 260)
        } else {
            topView?.frame = CGRect.init(x: 0, y: offsetY, width: UIScreen.main.bounds.width, height: 260-offsetY)
        }
        
        
        
        if offsetY < 44 {
            
        } else {
            
        }
    }
}
