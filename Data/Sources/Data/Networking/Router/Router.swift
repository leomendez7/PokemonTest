//
//  Router.swift
//  
//
//  Created by Leonardo Mendez on 1/11/23.
//

import Foundation
import Alamofire

protocol Router: URLRequestConvertible {
    var config: APIConfig { get }
    var query: APIQuery { get }
}

extension Router {
    
    func serverDomain() -> APIConfig {
        return .production
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try config.source.host.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(query.path))
        urlRequest.httpMethod = query.httpMethod.rawValue
        urlRequest.addHTTPHeaders(config.source.headers)
        urlRequest.addHTTPHeaders(query.headers)
        let encoding = query.parameterEncoding
        print ("\(query.httpMethod.rawValue) \(try encoding.encode(urlRequest, with: query.parameters))")
        return try encoding.encode(urlRequest, with: query.parameters)
    }
 
}
