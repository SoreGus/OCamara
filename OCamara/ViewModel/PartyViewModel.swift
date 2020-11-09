//
//  PartyViewModel.swift
//  OCamara
//
//  Created by Gustavo Soré on 09/11/20.
//

import SwiftUI

class PartyViewModel: ObservableObject {
    
    //MARK: - Properties
    
    var party: Party
    @Published var image: Image?
    
    //MARK: - Initializers
    
    init(party: Party) {
        self.party = party
        ImageLoader().load(urlString: party.imageURL) { (image) in
            DispatchQueue.main.async {
                self.image = image
            }
        }
    }
    
    //MARK: - Public Methods
    
    static var example: PartyViewModel {
        return PartyViewModel(party: Party.example)
    }
}
