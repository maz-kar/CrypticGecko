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

struct CoinsModel: Identifiable, Codable {
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
}

struct SparklineIn7D: Codable {
    let price: [Double]?
}

