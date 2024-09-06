//
//  HomeViewModel.swift
//  CrypticGecko
//
//  Created by Maziar Layeghkar on 07.03.24.
//

import Foundation
import SwiftUI
import Combine

class HomeViewModel: ObservableObject, Observable {
    @Published var allCoins: [CoinsModel] = []
    @Published var portfolioCoins: [CoinsModel] = []
    @Published var statistics: [StatisticModel] = []
    @Published var searchText: String = ""
    
    private let coinDataService = CoinDataService()
    private let marketDataService = MarketDataService()
    private let portfolioDataService = PortfolioDataService()
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        //updates allCoins
        $searchText
            .combineLatest(coinDataService.$allCoins)
            .debounce(for: 0.5, scheduler: DispatchQueue.main)
            .map(filterCoins)
            .sink { [weak self] returnedCoins in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
        
        //updates portfolioCoins
        $allCoins
            .combineLatest(portfolioDataService.$savedEntities)
        //What we do will be look through all coinModels, to see if anyone of those is included in portfolioEntities. Then use those ones
            .map { coinModels, portfolioEntities -> [CoinsModel] in
                coinModels
                //we use compactMap cause it can return nil and for the coins that are not needed in portfolioEntities we then return nil
                    .compactMap { coin -> CoinsModel? in
                        guard let entity = portfolioEntities.first(where: { $0.coinID == coin.id }) else {
                            return nil
                        }
                        return coin.updateHoldings(amount: entity.amount)
                    }
            }
            .sink { [weak self] returnedCoins in
                self?.portfolioCoins = returnedCoins
            }
            .store(in: &cancellables)
        
        //updates marketData
        marketDataService.$marketData
            .combineLatest($portfolioCoins)
            .map(mapGlobalMarketData)
            .sink { [weak self] returnedMarketData in
                self?.statistics = returnedMarketData
            }
            .store(in: &cancellables)
    }
    
    func updatePortfolio(coin: CoinsModel, amount: Double) {
        portfolioDataService.updatePortfolio(coin: coin, amount: amount)
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
    
    private func mapGlobalMarketData(marketData: MarketDataModel?, portfolioCoins: [CoinsModel]) -> [StatisticModel] { //without adding portfolioCoins as a parameter to this map, portfolioCoins will not have any update cause it means we are not subscribing to @Published portfolioCoins
        //Good practice for mapping received data from the api
        var stats: [StatisticModel] = []
        
        guard let data = marketData else {
            return stats
        }
        let marketPlaceSection = StatisticModel(title: "Market Place", value: data.marketCap, precentageChange: data.marketCapChangePercentage24HUsd)
        let volumeSection = StatisticModel(title: "24h Volume", value: data.volume)
        let btcDominanceSection = StatisticModel(title: "BTC Dominance", value: data.btcDominance)
        
        let portfolioValue =
        portfolioCoins
            .map({$0.currentHoldingsValue})
            .reduce(0, +) //using reduce we could turn all numbers of [CoinsModel] into one single sum for all filter coins in CoinsModel
        
        let previousValue =
        portfolioCoins
            .map { coin -> Double in
                let currentValue = coin.currentHoldingsValue
                let percentChange = coin.priceChangePercentage24H ?? 0 / 100
                let previousValue = currentValue / (1 + percentChange)
                return previousValue
            }
            .reduce(0, +)
        
        let percentageChange = (portfolioValue - previousValue) / previousValue
        
        
        let portfolioValueSection = StatisticModel(title: "Portfolio Value", value: portfolioValue.asCurrencyWith2Decimals(), precentageChange: percentageChange)
        
        stats.append(contentsOf: [marketPlaceSection,volumeSection,btcDominanceSection,portfolioValueSection])
        return stats
    }
}
