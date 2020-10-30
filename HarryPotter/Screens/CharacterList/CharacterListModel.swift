//
//  CharacterListModel.swift
//  HarryPotter
//
//  Created by Nilay Keven on 29.10.2020.
//

import Foundation

struct CharacterListModel: Codable {
    var list: [Character]?
}

struct Character: Codable, Identifiable, Hashable {
    var id: Int?
    var name: String?
    var role: String?
    var species: String?
    var gender: String?
    var house: String?
    var image: String?
}
