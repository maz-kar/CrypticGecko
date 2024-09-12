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
    
    private let coin: CoinModel
    private var imageSubscriptions: AnyCancellable?
    private let fileManager = LocalFileManagerTest.instance
    private let folderName = "coins"
    private let imageName: String
    
    init(coin: CoinModel) {
        self.coin = coin
        self.imageName = coin.id
        
        getCoinImage()
    }
    
    private func getCoinImage() {
        if let savedImage = fileManager.getImage(folderName: folderName, imageName: imageName) {
            self.image = savedImage
            print("Retrieved Image.")
        } else {
            downloadCoinImage()
            print("Downloaded Image.")
        }
    }
    
    private func downloadCoinImage() {
        guard let url = URL(string: coin.image) else { return }
        imageSubscriptions = NetworkingManager.download(url: url)
            .tryMap({ (data) in
                return UIImage(data: data)
            })
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] returnedImage in
                guard let self = self,
                      let downloadedImage = returnedImage else { return }
                self.image = downloadedImage
                self.imageSubscriptions?.cancel()
                self.fileManager.saveImage(image: downloadedImage, folderName: folderName, imageName: imageName)
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
