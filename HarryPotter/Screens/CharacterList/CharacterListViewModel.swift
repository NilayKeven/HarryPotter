//
//  CharacterListViewModel.swift
//  HarryPotter
//
//  Created by Nilay Keven on 29.10.2020.
//

import Foundation
import Combine

class CharacterListViewModel: ObservableObject {
    
    @Published var characterList = [Character]()
    
    init() {
        getCharacterList()
    }
    
    private func getCharacterList() {
        CharactersAPI.getCharacters.retrieve(completion: { [weak self] (response: [Character]?) in
            guard let characters = response else { return }
            for index in 0..<characters.count {
                var character = characters[index]
                character.id = index
                DispatchQueue.main.async {
                    self?.characterList.append(character)
                }
            }
        })
    }
}
