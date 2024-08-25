//
//  HomeViewModel.swift
//  CrypticGecko
//
//  Created by Maziar Layeghkar on 07.03.24.
//

import Foundation
import SwiftUI
import Combine

class HomeViewModel: ObservableObject {
    @Published var allCoins: [CoinsModel] = []
    @Published var portfolioCoinsList: [CoinsModel] = []
    @Published var searchText: String = ""
    @Published var statistics: [StatisticModel] = []
    
    private let coinDataService = CoinDataService()
    private let marketDataService = MarketDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        $searchText
            .combineLatest(coinDataService.$allCoins)
            .debounce(for: 0.5, scheduler: DispatchQueue.main)
            .map(filterCoins)
            .sink { [weak self] returnedCoins in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
        
        marketDataService.$marketData
            .map(mapGlobalMarketData)
            .sink { [weak self] returnedMarketData in
                self?.statistics = returnedMarketData
            }
            .store(in: &cancellables)
        
    }
    
    private func filterCoins(text: String, coins: [CoinsModel]) -> [CoinsModel] {
        guard !text.isEmpty else {
            return coins
        }
        let lowercasedText = text.lowercased()
        
        return coins.filter { coin in
            return coin.id.contains(lowercasedText) || coin.symbol.contains(lowercasedText) || coin.name.contains(lowercasedText)
        }
    }
    
    private func mapGlobalMarketData(marketData: MarketDataModel?) -> [StatisticModel] {
        //Good practice for mapping received data from the api
        var stats: [StatisticModel] = []
        
        guard let data = marketData else {
            return stats
        }
        let marketPlaceSection = StatisticModel(title: "Market Place", value: data.marketCap, precentageChange: data.marketCapChangePercentage24HUsd)
        let volumeSection = StatisticModel(title: "24h Volume", value: data.volume)
        let btcDominanceSection = StatisticModel(title: "BTC Dominance", value: data.btcDominance)
        let portfolioValueSection = StatisticModel(title: "Portfolio Value", value: "$0.0", precentageChange: 0.0)
        
        stats.append(contentsOf: [marketPlaceSection,volumeSection,btcDominanceSection,portfolioValueSection])
        return stats
    }
}
