//
//  APIQuery.swift
//
//
//  Created by Leonardo Mendez on 1/11/23.
//

import UIKit
import Alamofire

struct APIQuery {
    
    var headers: [String: String]?
    var httpMethod: Alamofire.HTTPMethod
    var path: String
    var parameters: [String: Any]?
    
    var parameterEncoding: Alamofire.ParameterEncoding = URLEncoding.default
    var cachePolicy: String = ""
    
    init(httpMethod: Alamofire.HTTPMethod, path: String) {
        self.httpMethod = httpMethod
        self.path = path
    }
    
    init(httpMethod: Alamofire.HTTPMethod, path: String, parameters: [String: Any]?) {
        self.httpMethod = httpMethod
        self.path = path
        self.parameters = parameters
       
    }
    
    init(httpMethod: Alamofire.HTTPMethod, path: String, parameters: [String: Any]?, headers: [String: String]?) {
        self.httpMethod = httpMethod
        self.path = path
        self.parameters = parameters
        self.headers = headers
    }
    
    init(httpMethod: Alamofire.HTTPMethod, path: String, parameters: [String: Any]?, headers: [String: String]?, paremeterEncoding: Alamofire.ParameterEncoding ) {
        self.httpMethod = httpMethod
        self.path = path
        self.parameters = parameters
        self.headers = headers
        self.parameterEncoding = paremeterEncoding
    }

    static func checkAuthorization(_ statusCode: Int?) {
        if let statusCode = statusCode {
            if statusCode == 401 {
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "Unauthorized"), object: nil)
            }
        }
    }
}
