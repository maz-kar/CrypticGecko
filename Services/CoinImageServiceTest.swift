//
//  CoinImageServiceTest.swift
//  CrypticGecko
//
//  Created by Maziar Layeghkar on 24.07.24.
//

import Foundation
import Combine
import SwiftUI

class CoinImageServiceTest {
    
    @Published var image: UIImage? = nil
    private let coin: CoinsModel
    private var imageSubscription: AnyCancellable?
    private let fileManager = LocalFileManager.instance
    private var folderName: String = "coins"
    private var imageName: String
    
    init(coin: CoinsModel) {
        self.coin = coin
        self.imageName = coin.id
        
        getCoinImages()
    }
    
    private func getCoinImages() {
        if let savedImage = fileManager.getImage(folderName: folderName, imageName: imageName) {
            self.image = savedImage
        }
        else {
            downloadCoinImages()
        }
    }
    
    private func downloadCoinImages() {
        guard let url = URL(string: coin.image) else { return }
        imageSubscription = NetworkingManager.download(url: url)
            .tryMap({ (data) -> UIImage? in
                return UIImage(data: data)
            })
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] returnedImage in
                guard let self = self, let downloadedImage = returnedImage else { return }
                self.image = downloadedImage
                self.imageSubscription?.cancel()
            })
        
        
    }
}
