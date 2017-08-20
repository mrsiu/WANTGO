//
//  XiangQuTaShuoVC.swift
//  xiangqu
//
//  Created by mrsiu on 2017/7/17.
//  Copyright © 2017年 mrsiu. All rights reserved.
//

import UIKit
import UITableView_FDTemplateLayoutCell

let ArticleListAuthorCell = "ArticleListAuthorCell"
let ArticleListTitleCell = "ArticleListTitleCell"
let ArticleListImageContentCell = "ArticleListImageContentCell"
let ArticleListTextContentCell = "ArticleListTextContentCell"
let ArticleListCommentCell = "ArticleListCommentCell"
let ArticleListOperationCell = "ArticleListOperationCell"

class XiangQuTaShuoVC: UITableViewController {
    
    var dataSource:[XiangQuTaShuoModel]? {
        didSet{
            tableView.reloadData()
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        
        tableView.separatorStyle = .none
        
        tableView.register(XiangQuArticleListAuthorCell.self, forCellReuseIdentifier: ArticleListAuthorCell)
        tableView.register(XiangQuArticleListTitleCell.self, forCellReuseIdentifier: ArticleListTitleCell)
        tableView.register(XiangQuArticleListImageContentCell.self, forCellReuseIdentifier: ArticleListImageContentCell)
        tableView.register(XiangQuArticleListTextContentCell.self, forCellReuseIdentifier: ArticleListTextContentCell)
        tableView.register(XiangQuArticleListCommentCell.self, forCellReuseIdentifier: ArticleListCommentCell)
        tableView.register(XiangQuArticleListOperationCell.self, forCellReuseIdentifier: ArticleListOperationCell)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.dataSource?.count ?? 0
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let model = self.dataSource?[section]
        return 2 + (model?.comments.count ?? 0) + (model?.contents.count ?? 0) + 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let model = self.dataSource?[indexPath.section] else {
            return UITableViewCell()
        }
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: ArticleListAuthorCell) as! XiangQuArticleListAuthorCell
            let url = URL.init(string: model.authorAvatarURL)
            cell.iconView?.kf.setImage(with: url)
            cell.nameLabel?.text = model.authorName
            cell.signLabel?.text = model.authorTag
            
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: ArticleListTitleCell) as!
            XiangQuArticleListTitleCell
            cell.titleLabel?.text = model.postTitle
            return cell
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: ArticleListImageContentCell) as!
            XiangQuArticleListImageContentCell
            let contentModel = model.contents[0]
            let url = URL(string: contentModel.content)
            cell.imageV?.kf.setImage(with: url)
            return cell
        } else if indexPath.row == 3 {
            if model.contents.count > 1 {
                let cell = tableView.dequeueReusableCell(withIdentifier: ArticleListTextContentCell) as!
                XiangQuArticleListTextContentCell
                let contentModel = model.contents[1]
                cell.titleL?.text = contentModel.content
                
                return cell
            }else {
                if model.comments.count != 0 {
                    let commentModel = model.comments[0]
                    let url = URL(string: commentModel.avaPath)
                    let cell = tableView.dequeueReusableCell(withIdentifier: ArticleListCommentCell) as!
                    XiangQuArticleListCommentCell
                    cell.imageV?.kf.setImage(with: url)
                    cell.titleL?.text = commentModel.nick + ":" + commentModel.content
                    return cell
                    
                } else {
                    let cell = tableView.dequeueReusableCell(withIdentifier: ArticleListOperationCell) as! XiangQuArticleListOperationCell
                    cell.likeCount?.text = String(model.favorNum)
                    cell.postCount?.text = String(model.commentNum)
                    cell.dateL?.text = model.createAt
                    return cell
                }
            }
        } else if indexPath.row == 4 {
            if model.contents.count == 1 && model.comments.count > 1 {
                let commentModel = model.comments[1]
                let url = URL(string: commentModel.avaPath)
                let cell = tableView.dequeueReusableCell(withIdentifier: ArticleListCommentCell) as!
                XiangQuArticleListCommentCell
                cell.imageV?.kf.setImage(with: url)
                cell.titleL?.text = commentModel.nick + ":" + commentModel.content
                return cell
            } else if model.contents.count == 2 && model.comments.count != 0 {
                let commentModel = model.comments[0]
                let url = URL(string: commentModel.avaPath)
                let cell = tableView.dequeueReusableCell(withIdentifier: ArticleListCommentCell) as!
                XiangQuArticleListCommentCell
                cell.imageV?.kf.setImage(with: url)
                cell.titleL?.text = commentModel.nick + ":" + commentModel.content
                return cell
            } else{
                let cell = tableView.dequeueReusableCell(withIdentifier: ArticleListOperationCell) as! XiangQuArticleListOperationCell
                cell.likeCount?.text = String(model.favorNum)
                cell.postCount?.text = String(model.commentNum)
                cell.dateL?.text = model.createAt
                return cell
            }
        } else if indexPath.row == 5 {
            if model.comments.count == 2 {
                let commentModel = model.comments[1]
                let url = URL(string: commentModel.avaPath)
                let cell = tableView.dequeueReusableCell(withIdentifier: ArticleListCommentCell) as!
                XiangQuArticleListCommentCell
                cell.imageV?.kf.setImage(with: url)
                cell.titleL?.text = commentModel.nick + ":" + commentModel.content
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: ArticleListOperationCell) as! XiangQuArticleListOperationCell
                cell.likeCount?.text = String(model.favorNum)
                cell.postCount?.text = String(model.commentNum)
                cell.dateL?.text = model.createAt
                return cell
            }
        } else{
            let cell = tableView.dequeueReusableCell(withIdentifier: ArticleListOperationCell) as! XiangQuArticleListOperationCell
            cell.likeCount?.text = String(model.favorNum)
            cell.postCount?.text = String(model.commentNum)
            cell.dateL?.text = model.createAt
            return cell
        }
        
        
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let model = self.dataSource?[indexPath.section] else {
            return 44
        }
        if indexPath.row == 0 {
            return 50
        } else if indexPath.row == 1 {
            return 44
        } else if indexPath.row == 2 {
            return 265
        } else if indexPath.row == 3 {
            if model.contents.count > 1 {
            return 44
            }else {
                if model.comments.count != 0 {
                    return 22
                    
                } else {
                    return 42
                }
            }
        } else if indexPath.row == 4 {
            if model.contents.count == 1 && model.comments.count > 1 {
                return 22
            } else if model.contents.count == 2 && model.comments.count != 0 {
                return 22
            } else{
                return 42
            }
        } else if indexPath.row == 5 {
            if model.comments.count == 2 {
                return 22
            } else {
                return 42
            }
        } else{
            return 42
        }
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1
    }
    
}


extension XiangQuTaShuoVC {
    func loadData() {
        let urlString = "http://api.xiangqu.com/post/recommends"
        let parameters = [String:Any]()
        HttpTool.loadRequest(urlString: urlString, method: .post, parameters: parameters) { (reponse:[String : Any], error:Error?) in
            if error != nil {
                return
            }
            guard let dictArr = reponse["data"] as? [[String:Any]] else {
                return
            }
            self.dataSource = dictArr.map{XiangQuTaShuoModel.init(dict: $0)}
        }
    }
}


