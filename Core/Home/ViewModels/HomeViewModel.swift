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
    
    @Published var allCoinsList: [CoinsModel] = []
    @Published var portfolioCoinsList: [CoinsModel] = []
    var cancellable = Set<AnyCancellable>()
    
    init() {
        getData()
    }
    
    func getData() {
        let decoderData = JSONDecoder()
        decoderData.keyDecodingStrategy = .convertFromSnakeCase
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h&locale=en") else { return }
        URLSession.shared.dataTaskPublisher(for: url)
            .receive(on: DispatchQueue.main)
            .tryMap(handleOutput)
            .decode(type: [CoinsModel].self, decoder: decoderData)
            .replaceError(with: [])
            .sink { [weak self] returnedCoins in
                self?.allCoinsList = returnedCoins
            }
            .store(in: &cancellable)
    }
    
    func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard
            let response = output.response as? HTTPURLResponse,
            response.statusCode >= 200 && response.statusCode < 300 else {
            throw URLError(.badServerResponse)
        }
        return output.data
    }
}
