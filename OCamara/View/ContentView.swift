//
//  ContentView.swift
//  OCamara
//
//  Created by Gustavo Soré on 07/11/20.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: DeputyListViewModel
    var body: some View {
        List(viewModel.deputies, id: \.name) { deputy in
            DeputyRow(viewModel: DeputyViewModel(deputy: deputy))
        }.onAppear(perform: {
            async {
                await self.viewModel.fetch()
            }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: DeputyListViewModel())
    }
}
