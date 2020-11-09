//
//  DeputyViewModel.swift
//  OCamara
//
//  Created by Gustavo Soré on 09/11/20.
//

import SwiftUI

class DeputyViewModel: ObservableObject {
    
    //MARK: - Properties
    
    var deputy: Deputy
    @Published var party: Party?
    @Published var image: Image = Image.init("profile")
    
    //MARK: - Initializers
    
    init(deputy: Deputy) {
        self.deputy = deputy
        loadImage()
        PartyAPI().fetch(uriString: deputy.partyUri) { (party) in
            if let party = party {
                DispatchQueue.main.async {
                    self.party = party
                }
            }
        }
    }
    
    //MARK: - Public Methods
    
    static var example: DeputyViewModel {
        return DeputyViewModel(deputy: Deputy.example)
    }
    
    //MARK: - Private Methods
    
    private func loadImage() {
        ImageLoader().load(urlString: deputy.photoURL) { (image) in
            if let image = image {
                DispatchQueue.main.async {
                    self.image = image
                }
            }
        }
    }
}
