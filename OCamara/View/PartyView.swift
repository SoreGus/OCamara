//
//  PartyView.swift
//  OCamara
//
//  Created by Gustavo Soré on 08/11/20.
//

import SwiftUI

struct PartyView: View {
    
    @ObservedObject var viewModel: PartyViewModel
    
    var body: some View {
        VStack {
            if let image = viewModel.image {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
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
