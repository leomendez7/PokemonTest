//
//  HomeViewModel.swift
//  TestPokemon
//
//  Created by Leonardo Mendez on 1/11/23.
//

import Foundation
import Combine
import Data
import Domain

class HomeViewModel {
    
    var pokemon: Pokemon?
    var pokemonStore = PokemonStore()
    var reloadData = PassthroughSubject<Void, Error>()
    
    func fetchPokemon() {
        pokemonStore.fetchPokemon(pokemonId: "25") { response in
            DispatchQueue.main.async {
                if let pokemon = response {
                    self.pokemon = pokemon
                    self.reloadData.send()
                }
            }
        }
    }
    
}
