//
//  CoinImageService.swift
//  CrypticGecko
//
//  Created by Maziar Layeghkar on 13.05.24.
//

import Foundation
import Combine
import SwiftUI

class CoinImageService {
    
    @Published var image: UIImage? = nil
    private var imageSubscription: AnyCancellable?
    private let coin: CoinsModel
    private let fileManager = LocalFileManager.instance
    
    init(coin: CoinsModel) {
        self.coin = coin
        getCoinImage()
    }
    
    private func getCoinImage() {
        //TODO: if can get it from fileManager do it, else download it
        //fileManager.getImage
    }
    
    private func downloadCoinImage() {
        print("Downloading Image")
        guard let url = URL(string: coin.image) else { return }
        imageSubscription = NetworkingManager.download(url: url)
            .tryMap({ (data) -> UIImage? in
                return UIImage(data: data)
            })
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] returnedImage in
                guard let self = self else { return }
                self.image = returnedImage
                self.imageSubscription?.cancel()
                //TODO: save the image here
                //fileManager.saveImage
                
            })
    }
}