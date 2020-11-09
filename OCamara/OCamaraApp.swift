//
//  OCamaraApp.swift
//  OCamara
//
//  Created by Gustavo Soré on 07/11/20.
//

import SwiftUI

@main
struct OCamaraApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: DeputyListViewModel())
        }
    }
}
