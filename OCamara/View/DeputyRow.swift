//
//  DeputyRow.swift
//  OCamara
//
//  Created by Gustavo Soré on 08/11/20.
//

import SwiftUI

struct DeputyRow: View {
    @ObservedObject var viewModel: DeputyViewModel
    
    var body: some View {
        HStack {
            viewModel.image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 70, height: 70, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
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
