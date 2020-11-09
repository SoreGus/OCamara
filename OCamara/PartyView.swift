//
//  PartyView.swift
//  OCamara
//
//  Created by Gustavo Soré on 08/11/20.
//

import SwiftUI

class PartyViewModel: ObservableObject {
    var party: Party
    
    init(party: Party) {
        self.party = party
        ImageLoader.load(urlString: party.imageURL) { (image) in
            DispatchQueue.main.async {
                self.image = image
            }
        }
    }
    
    @Published var image: Image?
    
    static var example: PartyViewModel {
        return PartyViewModel(party: Party.example)
    }
}

struct PartyView: View {
    
    @ObservedObject var viewModel: PartyViewModel
    
    var body: some View {
        VStack {
            viewModel.image
            Text(viewModel.party.label)
        }
    }
}

struct PartyView_Previews: PreviewProvider {
    static var previews: some View {
        PartyView(viewModel: PartyViewModel.example)
            .previewLayout(.fixed(width: 50, height: 50))
    }
}
