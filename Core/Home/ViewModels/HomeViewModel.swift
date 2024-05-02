//
//  HomeViewModel.swift
//  CrypticGecko
//
//  Created by Maziar Layeghkar on 07.03.24.
//

import Foundation
import SwiftUI
 
class HomeViewModel: ObservableObject {
    
    @Published var allCoinsList: [CoinsModel] = []
    @Published var portfolioCoinsList: [CoinsModel] = []
    
    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.allCoinsList.append(DeveloperPreview.instance.coin)
            self.portfolioCoinsList.append(DeveloperPreview.instance.coin)
        }
    }
}
