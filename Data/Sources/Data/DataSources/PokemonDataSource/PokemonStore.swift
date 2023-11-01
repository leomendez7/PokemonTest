//
//  PokemonStore.swift
//  
//
//  Created by Leonardo Mendez on 1/11/23.
//

import UIKit
import Alamofire
import Domain

public struct PokemonStore {
    
    public init() {}
    
    func requestRouter(pokemonId: String) -> Router {
        let request = PokemonRouter.pokemon(pokemonId: pokemonId)
        return request
    }
    
    public func fetchPokemon(pokemonId: String, _ completion: @escaping(_ pokemon: Pokemon?) -> Void) {
        AF.request(requestRouter(pokemonId: pokemonId)).responseDecodable(of: Pokemon.self) { response in
            switch response.result {
            case .success(let pokemon):
                completion(pokemon)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
