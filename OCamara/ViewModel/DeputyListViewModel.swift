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
