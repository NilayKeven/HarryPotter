//
//  CharacterListView.swift
//  HarryPotter
//
//  Created by Nilay Keven on 29.10.2020.
//

import SwiftUI
import SDWebImageSwiftUI

struct CharacterListView: View {
    @ObservedObject var viewModel = CharacterListViewModel()
    
    var body: some View {
        Text("Hello, world")
    }
}

struct CharacterListView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterListView()
    }
}
