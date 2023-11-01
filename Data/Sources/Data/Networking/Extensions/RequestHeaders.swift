//
//  File.swift
//  
//
//  Created by Leonardo Mendez on 1/11/23.
//

import UIKit

extension URLRequest {
    
    mutating func addHTTPHeaders(_ headers: [String: String]?) {
        guard let headers = headers else { return }
        for (key, value) in headers {
            setValue(value, forHTTPHeaderField: key)
        }
    }
    
}
