//
//  CoinDetailDataService.swift
//  CrypticGecko
//
//  Created by Maziar Layeghkar on 11.09.24.
//

import Foundation
import Combine

class CoinDetailDataService {
    let coin: CoinModel
    
    @Published var coinDetails: CoinDetailModel? = nil
    var coinDetailSubscription: AnyCancellable?
    
    init(coin: CoinModel) {
        self.coin = coin
        getCoinDetails(coin: coin)
    }
    
    func getCoinDetails(coin: CoinModel) {
        let decoderData = JSONDecoder()
        decoderData.keyDecodingStrategy = .convertFromSnakeCase
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/\(coin.id)?localization=false&tickers=false&market_data=false&community_data=false&developer_data=false&sparkline=false") else { return }
        coinDetailSubscription = NetworkingManager.download(url: url)
            .decode(type: CoinDetailModel.self, decoder: decoderData)
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] returnedCoinDetail in
                self?.coinDetails = returnedCoinDetail
                self?.coinDetailSubscription?.cancel()
            })
    }
    
}
