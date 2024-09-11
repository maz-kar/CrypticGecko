//
//  DetailViewModel.swift
//  CrypticGecko
//
//  Created by Maziar Layeghkar on 11.09.24.
//

import Foundation
import Combine

class DetailViewModel: ObservableObject {
    let coin: CoinsModel
    @Published var coinDetails: CoinDetailModel? = nil
    
    private let coinDetailsDataService: CoinDetailDataService //Good practice to now define extra let coin
    private var cancellables = Set<AnyCancellable>()
    
    init(coin: CoinsModel) {
        self.coin = coin
        self.coinDetailsDataService = CoinDetailDataService(coin: coin)
        self.addSubscribers()
    }
    
    private func addSubscribers() {
        coinDetailsDataService.$coinDetails
            .sink { [weak self] returnedCoinDetails in
                self?.coinDetails = returnedCoinDetails
                print("Received Coin Detail Data".uppercased())
                print("\(returnedCoinDetails)")
            }
            .store(in: &cancellables)
    }
}
