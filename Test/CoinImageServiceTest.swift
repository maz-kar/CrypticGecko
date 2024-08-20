//
//  CoinImageServiceTest.swift
//  CrypticGecko
//
//  Created by Maziar Layeghkar on 19.08.24.
//

import Foundation
import SwiftUI
import Combine

class CoinImageServiceTest {
    
    @Published var image: UIImage? = nil
    
    private let coin: CoinsModel
    private var imageSubscriptions: AnyCancellable?
    
    init(coin: CoinsModel) {
        self.coin = coin
        downloadImage()
    }
    
    private func downloadImage() {
        guard let url = URL(string: coin.image) else { return }
        imageSubscriptions = NetworkingManager.download(url: url)
            .tryMap({ (data) in
                return UIImage(data: data)
            })
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] returnedImage in
                self?.image = returnedImage
                self?.imageSubscriptions?.cancel()
            })
    }
}

/*
 Networking layers of getting the images can be continued from here after finishing the setups in CoinImageViewModel:
- Here is the downloading layer from an interner URL
- Unlike the coins that had static URL, here we have a dynamic URL for every single coin's image.
- We have already made a generic download and handleCompletion funcs inside of a utility class called NetworkingManager.
- The trick here is to pass the coin: CoinsModel in init, to use the coin.image URLString.
 */
