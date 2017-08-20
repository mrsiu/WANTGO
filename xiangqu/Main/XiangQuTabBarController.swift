//
//  XiangQuTabBarController.swift
//  xiangqu
//
//  Created by mrsiu on 2017/7/16.
//  Copyright © 2017年 mrsiu. All rights reserved.
//

import UIKit

class XiangQuTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpChildViewControllers()
        self.tabBar.tintColor = UIColor(colorLiteralRed: 214/255.0, green: 164/255.0, blue: 29/255.0, alpha: 1)
    }


}
extension XiangQuTabBarController {
    fileprivate func setUpChildViewControllers() {
        addChildViewControllers(XiangQuZhuanTiVC(),  title: "专题", icon: UIImage(named: "tab_theme_nrl_25x25_")!, selectedIcon: UIImage.renderOriginalImage(named: "tab_theme_hlt_25x25_"))
        addChildViewControllers(XiangQuSheJiShiVC(), title: "设计师",icon: UIImage(named: "tab_designer_nrl_25x25_")!, selectedIcon: UIImage.renderOriginalImage(named: "tab_designer_hlt_25x25_"))
        addChildViewControllers(XiangQuTaShuoVC.init(style: .grouped),  title: "TA说",icon: UIImage(named: "tab_ta_nrl_25x25_")!, selectedIcon: UIImage.renderOriginalImage(named: "tab_ta_hlt_25x25_"))
        addChildViewControllers(XiangQuGuangVC.init(style: .grouped), title: "逛",icon: UIImage(named: "tab_guang_nrl_25x25_")!, selectedIcon: UIImage.renderOriginalImage(named: "tab_guang_hlt_25x25_"))
        
        
        let storyBoard = UIStoryboard(name: "XiangQuMineVC", bundle: nil)
        
        
        guard let vc = storyBoard.instantiateInitialViewController() else {
            return
        }
        
        addChildViewControllers(vc, title: "我的",icon: UIImage(named: "tab_profile_nrl_25x25_")!, selectedIcon: UIImage.renderOriginalImage(named: "tab_profile_hlt_25x25_"))
    }
    private func addChildViewControllers(_ viewController: UIViewController,title: String,icon: UIImage,selectedIcon: UIImage) {
        
        let vc = viewController
        
//        vc.view.backgroundColor = bgColor
        
        let nav = UINavigationController.init(rootViewController: vc)
        
        nav.tabBarItem.title = title
        
        nav.tabBarItem.image = icon
        
        nav.tabBarItem.selectedImage = selectedIcon
        
        self.addChildViewController(nav)
        
    }
}
