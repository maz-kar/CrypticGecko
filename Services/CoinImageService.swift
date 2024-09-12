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
    private let coin: CoinModel
    private let fileManager = LocalFileManager.instance
    private let folderName = "coins"
    private let imageName: String
    
    init(coin: CoinModel) {
        self.coin = coin
        self.imageName = coin.id
        getCoinImage()
    }
    
    private func getCoinImage() {
        //if image already existed and saved, set the image
        if let savedImage = fileManager.getImage(folderName: folderName, imageName: imageName) {
            image = savedImage
            print("SavedImage used.")
            //if not go to download it below
        } else {
            downloadCoinImage()
            print("downloadedImage used.")
        }
    }
    
    private func downloadCoinImage() {
        guard let url = URL(string: coin.image) else { return }
        imageSubscription = NetworkingManager.download(url: url)
            .tryMap({ (data) -> UIImage? in
                return UIImage(data: data)
            })
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] returnedImage in
                guard let self = self, let downloadedImage = returnedImage
                else { return }
                self.image = downloadedImage
                self.imageSubscription?.cancel()
                //after downloading, save the image
                self.fileManager.saveImage(image: downloadedImage, folderName: self.folderName, imageName: self.imageName)
            })
    }
}
