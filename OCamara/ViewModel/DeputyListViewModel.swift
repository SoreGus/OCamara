//
//  DeputyListViewModel.swift
//  OCamara
//
//  Created by Gustavo Soré on 09/11/20.
//

import SwiftUI

class DeputyListViewModel: ObservableObject {
    @Published var deputies: [Deputy] = []
    
    func fetch() {
        DeputyAPI().fetch { (deputies) in
            if let deputies = deputies {
                DispatchQueue.main.async {
                    self.deputies = deputies
                }
            }
        }
    }
}
