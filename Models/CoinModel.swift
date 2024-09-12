//
//  CoinsModel.swift
//  CrypticGecko
//
//  Created by Maziar Layeghkar on 25.03.24.
//

import Foundation
import SwiftUI

/*
 URL: https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h&locale=en
 
 JSON Respone:
 {
     "id": "bitcoin",
     "symbol": "btc",
     "name": "Bitcoin",
     "image": "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
     "current_price": 70501,
     "market_cap": 1381772197074,
     "market_cap_rank": 1,
     "fully_diluted_valuation": 1475641025320,
     "total_volume": 39431030249,
     "high_24h": 70690,
     "low_24h": 65363,
     "price_change_24h": 5137.72,
     "price_change_percentage_24h": 7.86024,
     "market_cap_change_24h": 93517986629,
     "market_cap_change_percentage_24h": 7.25928,
     "circulating_supply": 19664143,
     "total_supply": 21000000,
     "max_supply": 21000000,
     "ath": 73738,
     "ath_change_percentage": -4.61507,
     "ath_date": "2024-03-14T07:10:36.635Z",
     "atl": 67.81,
     "atl_change_percentage": 103624.98885,
     "atl_date": "2013-07-06T00:00:00.000Z",
     "roi": null,
     "last_updated": "2024-03-25T17:59:02.623Z",
     "sparkline_in_7d": {
       "price": [
         68145.79947189869,
       ]
     },
     "price_change_percentage_24h_in_currency": 7.860238668152288
   },
 */

struct CoinModel: Identifiable, Codable {
    //id,symbol,name,image,currentPrice SHOULD have values
    //To be safe, preferably use Double rather than Int
    //Because we have id, we dont need any extra effort for conforming to Identifiable
    let id, symbol, name: String
    let image: String
    let currentPrice: Double
    let marketCap, marketCapRank, fullyDilutedValuation: Double?
    let totalVolume, high24H, low24H: Double?
    let priceChange24H, priceChangePercentage24H: Double?
    let marketCapChange24H: Double?
    let marketCapChangePercentage24H: Double?
    let circulatingSupply, totalSupply, maxSupply, ath: Double?
    let athChangePercentage: Double?
    let athDate: String?
    let atl, atlChangePercentage: Double?
    let atlDate: String?
    let lastUpdated: String?
    let sparklineIn7D: SparklineIn7D?
    let priceChangePercentage24HInCurrency: Double?
    let currentHoldings: Double?
    //was added to keep track of user holdings. It's optional as we're not downloading it from internet and when initialize for the 1st time, it will be failed and it will be updated afterwards.
    //REMEMBER: instead of using custom coding keys (having an extra enum and then conforming to String and CodingKey protocol) for camel case issues, we can use decoderData.keyDecodingStrategy = .convertFromSnakeCase such as:
//    enum CodingKeys: String, CodingKey {
//        case id, symbol, name
//        case currentPrice = "current_price"
//        case currentHolding
//REMEMBER: if we have values for all the keys the compiler error should go away
//We will use the keyDecodingStrategy = .convertFromSnakeCase in our viewModel when we get the data from the URLSession
//    }
    
    func updateHoldings(amount: Double) -> CoinModel {
        return CoinModel(id: id, symbol: symbol, name: name, image: image, currentPrice: currentPrice, marketCap: marketCap, marketCapRank: marketCapRank, fullyDilutedValuation: fullyDilutedValuation, totalVolume: totalVolume, high24H: high24H, low24H: low24H, priceChange24H: priceChange24H, priceChangePercentage24H: priceChangePercentage24H, marketCapChange24H: marketCapChange24H, marketCapChangePercentage24H: marketCapChangePercentage24H, circulatingSupply: circulatingSupply, totalSupply: totalSupply, maxSupply: maxSupply, ath: ath, athChangePercentage: athChangePercentage, athDate: athDate, atl: atl, atlChangePercentage: atlChangePercentage, atlDate: atlDate, lastUpdated: lastUpdated, sparklineIn7D: sparklineIn7D, priceChangePercentage24HInCurrency: priceChangePercentage24HInCurrency, currentHoldings: amount)
        //when calling updateHoldings, it's gonna give us a new coinsModel with all the same data as the current coinsModel, but with the updatedHoldings
    }
    
    var currentHoldingsValue: Double {
        return (currentHoldings ?? 0) * currentPrice
    }
    
    var rank: Int {
        return Int(marketCapRank ?? 0)
    }
}

struct SparklineIn7D: Codable {
    let price: [Double]?
}

