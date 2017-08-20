//
//  XiangQuGuangVC.swift
//  xiangqu
//
//  Created by mrsiu on 2017/7/17.
//  Copyright © 2017年 mrsiu. All rights reserved.
//

import UIKit
private let topReuseID = "HomeCell"
private let midReuseID = "midCell"
private let footReuseID = "footCell"
class XiangQuGuangVC: UITableViewController {

    //数据源
    fileprivate var dataTopSource = [XiangQuGuangHeadModel]() {
        didSet{
            tableView.reloadData()
        }
    }
    fileprivate var dataMidSource = [XiangQuGuangMidModel]() {
        didSet{
            tableView.reloadData()
        }
    }
    fileprivate var dataFootSource = [[XiangQuFootModel]]() {
        didSet{
            tableView.reloadData()
        }
    }
    
    
    override init(style: UITableViewStyle) {
        super.init(style: style)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        loadTopData()
        loadMidData()
        loadFootData()
        
        tableView.register(XiangQuTopCell.self, forCellReuseIdentifier: topReuseID)
        tableView.register(UINib.init(nibName: "XiangQuMidCell", bundle: nil), forCellReuseIdentifier: midReuseID)
        tableView.register(UINib.init(nibName: "XiangQuFootCell", bundle: nil), forCellReuseIdentifier: footReuseID)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension XiangQuGuangVC {
    
    //加载上部分数据
    func loadTopData () {
        
        let urlString = HomeUrlString + "category/out/children"
        
        let parameters = [
            "noTimestamp" : 1
        ]
        
        HttpTool.loadRequest(urlString: urlString, method: .post, parameters: parameters) { (response : [String : Any], error : Error?) in
            
            if error != nil {
                return
            }
            
            guard let dictArr = response["data"] as? [[String:Any]] else {
                return
            }
            
            self.dataTopSource = dictArr.map{ XiangQuGuangHeadModel(dict: $0)}
        }
    }
    
    //加载中部数据
    func loadMidData () {
        
        let urlString = HomeUrlString + "shopping/banner/list"
        
        let parameters = [
            "noTimestamp" : 1
        ]
        
        HttpTool.loadRequest(urlString: urlString, method: .post, parameters: parameters) { (response : [String : Any], error : Error?) in
            if error != nil {
                return
            }
            
            guard let dataDict = response["data"] as? [String:Any] else {
                return
            }
            
            guard let dictArr = dataDict["content"] as? [[String:Any]] else {
                return
            }
            
            self.dataMidSource = dictArr.map{ XiangQuGuangMidModel(dict: $0) }
            
        }
    }
    
    //加载底部数据
    func loadFootData () {
        let urlString = HomeUrlString + "search/list"
        
        let now = NSDate()
        let timeInterval:TimeInterval = now.timeIntervalSince1970
        let timeStamp = Int(timeInterval)
        
        let parameters = [
            "page" : 0,
            "t" : timeStamp
        ]
        
        HttpTool.loadRequest(urlString: urlString, method: .post, parameters: parameters) { (response : [String : Any], error : Error?) in
            if error != nil {
                return
            }
            
            guard let dataDict = response["data"] as? [String:Any] else {
                return
            }
            
            guard let dictArr = dataDict["records"] as? [[String:Any]] else {
                return
            }
            let arr = dictArr.map{ XiangQuFootModel(dict: $0) }
            //-------------将数组两两组合成新数组--------------//
            var arr1 = [XiangQuFootModel]()
            var arr2 = [XiangQuFootModel]()
            var arr3 = [XiangQuFootModel]()
            for i in 0..<arr.count {
                if i%2 == 0 {
                    arr1.append(arr[i])
                    
                } else {
                    arr2.append(arr[i])
                }
            }
            
            for i in 0..<arr2.count {
                arr3 = [arr1[i],arr2[i]]
                self.dataFootSource.append(arr3)
                
            }
            //----------------------------------//
            
        }
    }
    
}

extension XiangQuGuangVC {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return self.dataMidSource.count
        }else {
            return dataFootSource.count
        }
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: topReuseID) as! XiangQuTopCell
        cell.topCells = dataTopSource
            return cell
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: midReuseID) as! XiangQuMidCell
            cell.midModel = dataMidSource[indexPath.row]
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: footReuseID) as! XiangQuFootCell
            cell.footModels = dataFootSource[indexPath.row]
            return cell
        }

    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 164
        case 1:
            return 435
        case 2:
            return 248
        default:
            return 44
        }
        
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }
}
