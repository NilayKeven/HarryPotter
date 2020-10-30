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
        ScrollView(.horizontal, showsIndicators: false, content: {
            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 20, content: {
                ForEach(viewModel.characterList) { character in
                    GeometryReader(content: { geometry in
                        WebImage(url: URL(string: character.image ?? ""))
                            .resizable()
                            .frame(width: 300, height: 400, alignment: .center)
                            .rotation3DEffect(Angle(degrees: Double(geometry.frame(in: .global).minX) / 20),
                                              axis: (x: 0, y: 1, z: 1))
                            .onTapGesture {
                                let rootVC = (UIApplication.shared.windows.first)?.rootViewController as? UINavigationController
                                rootVC?.pushViewController(UIHostingController(rootView: Text(character.name ?? "")), animated: false)
                            }
                    }).frame(width: 300, height: 400, alignment: .center)
                }
            }).padding()
        })
    }
}

struct CharacterListView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterListView()
    }
}
