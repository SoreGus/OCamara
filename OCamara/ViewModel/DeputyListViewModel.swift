//
//  DeputyListViewModel.swift
//  OCamara
//
//  Created by Gustavo Soré on 09/11/20.
//

import SwiftUI

class DeputyListViewModel: ObservableObject {
    
    //MARK: - Properties
    
    @Published var deputies: [Deputy] = []
    
    //MARK: - Public Methods
    
    func fetch() async {
        do {
            deputies = try await DeputyAPI().fetch()
        } catch {
            // error
        }
    }
}
