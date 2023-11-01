//
//  ViewController.swift
//  TestPokemon
//
//  Created by Leonardo Mendez on 1/11/23.
//

import UIKit
import Combine
import Domain
import Kingfisher

class HomeController: UIViewController {
    
    var viewModel = HomeViewModel()
    var anyCancellable: [AnyCancellable] = []
    var experience: Int = 0
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var abilitiesStackView: UIStackView!
    @IBOutlet weak var experienceLabel: UILabel!
    @IBOutlet weak var lessButton: UIButton!
    @IBOutlet weak var moreButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subscriptions()
        viewModel.fetchPokemon()
    }
    
    func subscriptions() {
        viewModel.reloadData.sink { _ in } receiveValue: { _ in
            guard let pokemon = self.viewModel.pokemon else { return }
            self.configurePokemon(pokemon: pokemon)
        }.store(in: &anyCancellable)
        
    }
    
    func configurePokemon(pokemon: Pokemon) {
        let url = URL(string: pokemon.sprites.frontDefault)
        nameLabel.text = pokemon.name.capitalizedSentence
        pokemonImage.kf.setImage(with: url)
        for item in pokemon.abilities {
            let label = UILabel()
            label.text = "- \(item.ability.name.capitalizedSentence)"
            abilitiesStackView.addArrangedSubview(label)
        }
        experience = pokemon.baseExperience
        experienceLabel.text = "\(experience)"
        lessButton.layer.borderWidth = 2
        moreButton.layer.borderWidth = 2
        lessButton.layer.borderColor = UIColor.black.cgColor
        moreButton.layer.borderColor = UIColor.black.cgColor
    }
    
    @IBAction func moreExperience(_ sender: Any) {
        experience = experience + 1
        experienceLabel.text = "\(experience)"
    }
    
    @IBAction func lessExperience(_ sender: Any) {
        if experience != 0 {
            experience = experience - 1
            experienceLabel.text = "\(experience)"
        }
    }
    
}

