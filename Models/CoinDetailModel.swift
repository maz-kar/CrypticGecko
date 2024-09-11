//
//  CoinDetailModel.swift
//  CrypticGecko
//
//  Created by Maziar Layeghkar on 11.09.24.
//

import Foundation

//JSON Data
/*
 URL: 'https://api.coingecko.com/api/v3/coins/bitcoin?localization=false&tickers=false&market_data=false&community_data=false&developer_data=false&sparkline=false'
 
 Response:
 {
   "id": "bitcoin",
   "symbol": "btc",
   "name": "Bitcoin",
   "block_time_in_minutes": 10,
   "hashing_algorithm": "SHA-256",
   "description": {
     "en": "Bitcoin is the first successful internet money based on peer-to-peer technology...</a>.",
   },
   "links": {
     "homepage": [
       "http://www.bitcoin.org",
     ],
     "subreddit_url": "https://www.reddit.com/r/Bitcoin/",
 }
 */

struct CoinDetailModel: Codable {
    let id, symbol, name: String?
    let blockTimeInMinutes: Int?
    let hashingAlgorithm: String?
    let description: Description?
    let links: Links?
}

struct Links: Codable {
    let homepage: [String]?
    let subredditURL: String?
}

struct Description: Codable {
    let en: String?
}
