//
//  APIConfig.swift
//  
//
//  Created by Leonardo Mendez on 1/11/23.
//

import UIKit
import Alamofire

enum APIConfig {
    
    case production
    
    var source: (host: String, headers: [String: String]?) {
        switch self {
        case .production:
            return (host: "https://pokeapi.co", headers: ["Authorization": ""])
        }
    }

}
