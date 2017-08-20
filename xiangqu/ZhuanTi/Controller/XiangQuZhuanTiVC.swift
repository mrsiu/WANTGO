//
//  XiangQuZhuanTiVC.swift
//  xiangqu
//
//  Created by mrsiu on 2017/7/17.
//  Copyright © 2017年 mrsiu. All rights reserved.
//

import UIKit
import UITableView_FDTemplateLayoutCell
class XiangQuZhuanTiVC: UIViewController {

    var dataSource:[XiangQuZhuanTiModel]? {
        didSet{
            carouselView?.reloadData()
        }
    }
    var carouselView:iCarousel?
    override func viewDidLoad() {
        super.viewDidLoad()

        let bgImageV = UIImageView.init(frame: view.bounds)
        bgImageV.image = UIImage(named: "2247151894566797333#1")
        view.addSubview(bgImageV)
        
        let titleImageV = UIImageView(image: UIImage(named: "2247151894566797335#1"))
        titleImageV.center.x = view.center.x
        titleImageV.frame.origin.y = 40
        view.addSubview(titleImageV)
        let carouselView = iCarousel.init(frame: self.view.bounds)
        carouselView.dataSource = self
        carouselView.delegate = self
        carouselView.type = .custom
        
        carouselView.bounceDistance = 0.2
        
        self.carouselView = carouselView
        view.addSubview(carouselView)
        
        
        carouselView.isPagingEnabled = true
        
        
        loadData()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }

}
extension XiangQuZhuanTiVC {
    func loadData() {
        let urlString = "http://api.xiangqu.com/ios/topic"
        let parameters = [
            "key":"add9185b82ac89653e1a691736374b22",
            "t":"1501511387641"
        ]
        HttpTool.loadRequest(urlString: urlString, method: .post, parameters: parameters) { (reponse:[String : Any], error:Error?) in
            if error != nil {
                return
            }
            guard let dictArr = reponse["data"] as? [[String:Any]] else {
                return
            }
            self.dataSource = dictArr.map{XiangQuZhuanTiModel(dict: $0)}
        }
    }


}
extension XiangQuZhuanTiVC:iCarouselDataSource {
    func numberOfItems(in carousel: iCarousel) -> Int {
        return self.dataSource?.count ?? 0
    }
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        let carouselView = XiangQuZhuanTiReuseView.loadFromNib()
        carouselView.zhuanTiModel = self.dataSource?[index]
        return carouselView
        
    }
}
extension XiangQuZhuanTiVC:iCarouselDelegate {
    func carousel(_ carousel: iCarousel, valueFor option: iCarouselOption, withDefault value: CGFloat) -> CGFloat {
        if option == .spacing {
            return value * 1.0
        }
        return value
    }
    
    func carousel(_ carousel: iCarousel, itemTransformForOffset offset: CGFloat, baseTransform transform: CATransform3D) -> CATransform3D {
        
        var transform = CATransform3DIdentity
        let max_scale:CGFloat = 1.0
        let min_scale:CGFloat = 0.95
        
        if offset <= 1 && offset >= -1 {
            let tempScale = offset < 0 ? 1+offset : 1-offset
            let slope = max_scale - min_scale
            let scale = min_scale + slope * tempScale
            transform = CATransform3DScale(transform, scale, scale, 1)
        }else {
            transform = CATransform3DScale(transform, min_scale, min_scale, 1)
        }
        
        return CATransform3DTranslate(transform, offset * carouselView!.itemWidth*1.05, 0.0, 0.0)
    }
    func carousel(_ carousel: iCarousel, didSelectItemAt index: Int) {
        guard let model = self.dataSource?[index] else {
            return
        }
        if model.url != "" {
            let url = URL(string: model.url)
            let vc = XiangQuBroswerViewController(url: url!)
            navigationController?.pushViewController(vc, animated: true)
        }else{
            let vc = XiangQuThemeDetailViewController(id: model.id)
            
            navigationController?.pushViewController(vc, animated: true)
        }
        
    }
}
