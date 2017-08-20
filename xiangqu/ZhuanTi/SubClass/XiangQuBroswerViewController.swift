//
//  XiangQuBroswerViewController.swift
//  xiangqu
//
//  Created by mrsiu on 2017/8/7.
//  Copyright © 2017年 mrsiu. All rights reserved.
//

import UIKit

class XiangQuBroswerViewController: UIViewController {
    
    var url:URL?
    private weak var webView:UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let webView = UIWebView(frame: view.bounds)
        self.webView = webView
        view.addSubview(webView)
        webView.loadRequest(URLRequest(url: url!))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    init(url: URL) {
        super.init(nibName: nil, bundle: nil)
        self.url = url
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
