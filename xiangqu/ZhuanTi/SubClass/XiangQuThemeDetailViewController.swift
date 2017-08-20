//
//  XiangQuThemeDetailViewController.swift
//  xiangqu
//
//  Created by mrsiu on 2017/8/7.
//  Copyright © 2017年 mrsiu. All rights reserved.
//

import UIKit

class XiangQuThemeDetailViewController: UIViewController {
    var id:Int?
    var dataSource:XiangQuThemeDetailModel? {
        didSet{
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        loadData()
        
        let scrollView = UIScrollView(frame: UIScreen.main.bounds)
        let coverView = XiangQuThemeDetailFrontView(frame: UIScreen.main.bounds)
        view.addSubview(scrollView)
        view.addSubview(coverView)
        
        
        
    }

    init(id: Int) {
        super.init(nibName: nil, bundle: nil)
        self.id = id
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func loadData() {
        
        let urlString = "http://api.xiangqu.com/ios/magezine"
        let parameters = [
        "id":self.id ?? 0,
        "key":"4ab28710c6eeb921523d9bf328ce4d44",
        "t":"1502001570925"
        ] as [String : Any]
        
        
        
        HttpTool.loadRequest(urlString: urlString, method: .post, parameters: parameters,headers:[
        "User-DeviceId":"4IZc/3gWUUsp6tEd9K98/BtcZRfgmfEIWywmoJHvEGZc432us5QtICM4V0vMp2CHRRKI6yM5ub4mz4iFjEKF5Q==",
        "User-Agent":"xiangqu;iphone 6s;Client/IOS10.2;V/4550|4.5.5;channel/appStore;lag/zh-Hans-CN"
        ]) { (reponse:[String : Any], error:Error?) in
            
            
            print(reponse)
            print(error)
            if error != nil {
                return
            }
            guard let dict = reponse["data"] as? [String:Any] else {
                return
            }
            self.dataSource = XiangQuThemeDetailModel(dict: dict)
        
        
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
        tabBarController?.tabBar.isHidden = true
    }

}
