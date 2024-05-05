//
//  CoinDataService.swift
//  CrypticGecko
//
//  Created by Maziar Layeghkar on 03.05.24.
//

import Foundation
import Combine

class CoinDataService {
    
    @Published var allCoins: [CoinsModel] = []
    var coinSubscription: AnyCancellable?
    
    init() {
        getCoins()
    }
    
    private func getCoins() {
        let decoderData = JSONDecoder()
        decoderData.keyDecodingStrategy = .convertFromSnakeCase
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h&locale=en") else { return }
        coinSubscription = NetworkingManager.download(url: url)
            .decode(type: [CoinsModel].self, decoder: decoderData)
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] returnedData in
                self?.allCoins = returnedData
                self?.coinSubscription?.cancel()
            })
    }
    
}
