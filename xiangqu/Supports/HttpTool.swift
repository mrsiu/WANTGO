
//
//  HttpTool.swift
//  xiangqu
//
//  Created by mrsiu on 2017/7/24.
//  Copyright © 2017年 mrsiu. All rights reserved.
//

import UIKit
import Alamofire

public enum HTTPToolMethod: String {
    case options = "OPTIONS"
    case get     = "GET"
    case head    = "HEAD"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
    case trace   = "TRACE"
    case connect = "CONNECT"
}



class HttpTool: NSObject {
    static func loadRequest(urlString: String, method: HTTPToolMethod,parameters: [String: Any],headers: HTTPHeaders? = nil,callBack: @escaping ([String: Any], Error?) -> ()) {
        
        guard let method = HTTPMethod(rawValue: method.rawValue) else {
            return
        }
        Alamofire.request(urlString, method: method, parameters: parameters, headers: headers).responseJSON { (response: DataResponse<Any>) in
            switch response.result {
            case .success(let value):
                callBack((value as? [String : Any]) ?? [:], nil)
            case .failure(let error):
                callBack([:],error)
            }

            
        }
    }
}

