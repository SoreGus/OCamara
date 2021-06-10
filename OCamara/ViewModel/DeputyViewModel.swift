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
        async {
            let aParty = try await PartyAPI().fetch(uriString: deputy.partyUri)
            DispatchQueue.main.async {
                self.party = aParty
            }
        }
    }
    
    //MARK: - Public Methods
    
    static var example: DeputyViewModel {
        return DeputyViewModel(deputy: Deputy.example)
    }
    
    //MARK: - Private Methods
    
    private func loadImage() {
        async {
            do {
                let aImage = try await ImageLoader().load(urlString: deputy.photoURL)
                DispatchQueue.main.async {
                    self.image = aImage
                }
            } catch {
                // error
            }
        }
    }
}
