//
//  APICachePolicy.swift
//  
//
//  Created by Leonardo Mendez on 1/11/23.
//

import Foundation

enum APICachePolicy {
    case networkOnly
    case cacheOnly
    case networkElseCache
    case cacheThenNetwork
    
    func isCache() -> Bool {
        if self == .networkOnly || self == .networkElseCache { return false }
        return true
    }
}
