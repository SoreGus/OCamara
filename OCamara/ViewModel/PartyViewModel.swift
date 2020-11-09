//
//  PartyViewModel.swift
//  OCamara
//
//  Created by Gustavo Soré on 09/11/20.
//

import SwiftUI

class PartyViewModel: ObservableObject {
    var party: Party
    @Published var image: Image?
    
    init(party: Party) {
        self.party = party
        ImageLoader().load(urlString: party.imageURL) { (image) in
            DispatchQueue.main.async {
                self.image = image
            }
        }
    }
    
    static var example: PartyViewModel {
        return PartyViewModel(party: Party.example)
    }
}
