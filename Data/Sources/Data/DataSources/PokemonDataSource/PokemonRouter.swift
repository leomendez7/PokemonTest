//
//  File.swift
//  
//
//  Created by Leonardo Mendez on 1/11/23.
//

import Alamofire

enum PokemonRouter: Router {
    
    case pokemon(pokemonId: String)
    
    var config: APIConfig {
        return serverDomain()
    }
    
    var query: APIQuery {
        switch(self) {
        case .pokemon(let pokemonId):
            return APIQuery(httpMethod: .get, path: "/api/v2/pokemon/\(pokemonId)", parameters: nil)
        }
    }
    
}
