//
//  CoinImageViewModelTest.swift
//  CrypticGecko
//
//  Created by Maziar Layeghkar on 19.08.24.
//

import Foundation
import SwiftUI
import Combine

class CoinImageViewModelTest: ObservableObject {
    
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    
    private let dataService: CoinImageServiceTest
    private var cancellables = Set<AnyCancellable>()
    
    let coin: CoinsModel
    
    init(coin: CoinsModel) {
        self.coin = coin
        self.dataService = CoinImageServiceTest(coin: coin)
        self.isLoading = true
        
        getImage()
    }
    
    private func getImage() {
        dataService.$image
            .sink { [weak self] (_) in
                self?.isLoading = false
            } receiveValue: { [weak self] returnedImage in
                self?.image = returnedImage
            }
            .store(in: &cancellables)
    }
    
}

/*
 Networking layers of getting the images can be continued from here after finishing the setups in CoinImageView:
- Here we need to subscribe to published $image property coming from CoinImageService
- Sinking the data which means receiving the image --> appending self.image by the received data/image
- As self.image is a @Published property, it can be sent to CoinImageView later on.
- The tricks here is to pass the coin: CoinsModel in init
 */
