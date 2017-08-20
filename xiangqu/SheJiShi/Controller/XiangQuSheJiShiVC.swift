//
//  XiangQuSheJiShiVC.swift
//  xiangqu
//
//  Created by mrsiu on 2017/7/17.
//  Copyright © 2017年 mrsiu. All rights reserved.
//

import UIKit
private let DesignerHead:String = "DesignerHead"
private let DesignerMid:String = "DesignerMid"
class XiangQuSheJiShiVC: UIViewController {
    var orignH:CGFloat = 0
    weak var headCell:XiangQuDesignerHeadCollectionViewCell? {
        didSet{
            orignH = (headCell?.frame.size.height)!
        }
    }
    var dataSource:XiangQuDesignHeadModel?{
        didSet{
            collectionView?.reloadData()
        }
    }
    var midDataSource:[XiangQuDesignMidModel]?{
        didSet{
            collectionView?.reloadData()
        }
    }
    weak var collectionView:UICollectionView?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.automaticallyAdjustsScrollViewInsets = false
        
        let layout = XiangQuDesignerLayout()
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        view.addSubview(collectionView)
        self.collectionView = collectionView
        
        collectionView.backgroundColor = .lightGray
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        loadHeaderData()
        loadMidData()
        

        collectionView.register(XiangQuDesignerHeadCollectionViewCell.self, forCellWithReuseIdentifier: DesignerHead)
        collectionView.register(XiangQuDesignerMidCollectionViewCell.self, forCellWithReuseIdentifier: DesignerMid)

        
        
        self.collectionView?.delaysContentTouches = false;

        }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }


}

extension XiangQuSheJiShiVC {
    func loadHeaderData() {
        let urlString = "http://api.xiangqu.com/designer2/recommend/operate"
        let parameters:[String:Any] = [:]
        
        HttpTool.loadRequest(urlString: urlString, method: .post, parameters: parameters) { (response:[String : Any], error:Error?) in
            if error != nil {
                return
            }
            guard let dict = response["data"] as? [String:Any]else {
                return
            }
            self.dataSource = XiangQuDesignHeadModel(dict: dict)
        }
    }
    func loadMidData() {
        let urlString = "http://api.xiangqu.com/designer2/tag/index"
        let parameters:[String:Any] = [:]
        
        HttpTool.loadRequest(urlString: urlString, method: .post, parameters: parameters) { (response:[String : Any], error:Error?) in
            if error != nil {
                return
            }
            guard let dictArr = response["data"] as? [[String:Any]]else {
                return
            }
            let dict = dictArr[0] 
            guard let dictArr1 = dict["tags"]  as? [[String:Any]]else {
                return
            }
            self.midDataSource = dictArr1.map{XiangQuDesignMidModel.init(dict: $0)}
            
            
        }
    }
}

extension XiangQuSheJiShiVC:UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return self.midDataSource?.count ?? 0
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        
        if indexPath.section == 0 {
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DesignerHead, for: indexPath) as! XiangQuDesignerHeadCollectionViewCell
            cell.designerHeadModel = self.dataSource
            
            headCell = cell
            
            return cell
        } else {
          let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DesignerMid, for: indexPath) as! XiangQuDesignerMidCollectionViewCell
            cell.designerMidModel = self.midDataSource?[indexPath.item]
            return cell
        }
        
    }
}

extension XiangQuSheJiShiVC:UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if scrollView.contentOffset.y < 0 {
            headCell?.frame.origin.y = scrollView.contentOffset.y
        headCell?.frame.size.height = orignH - scrollView.contentOffset.y
        }
    }
    
}
