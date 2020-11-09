//
//  DeputyRow.swift
//  OCamara
//
//  Created by Gustavo Soré on 08/11/20.
//

import SwiftUI

class DeputyViewModel: ObservableObject {
    
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
    
    static var example: DeputyViewModel {
        return DeputyViewModel(deputy: Deputy.example)
    }
    
    var deputy: Deputy
    @Published var party: Party?
    @Published var image: Image = Image.init("profile")
    
    private func loadImage() {
        ImageLoader.load(urlString: deputy.photoURL) { (image) in
            if let image = image {
                DispatchQueue.main.async {
                    self.image = image
                }
            }
        }
    }
}

struct DeputyRow: View {
    @ObservedObject var viewModel: DeputyViewModel
    
    var body: some View {
        HStack {
            viewModel.image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Text(viewModel.deputy.name)
            if let party = viewModel.party {
                Spacer()
                PartyView(viewModel: PartyViewModel(party: party))
            }
        }
        .padding(.bottom)
        .padding(.top)
    }
}

struct DeputyView_Previews: PreviewProvider {
    static var previews: some View {
        DeputyRow(viewModel: DeputyViewModel.example)
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
