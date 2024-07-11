//
//  CoinsViewModelTest.swift
//  CrypticGecko
//
//  Created by Maziar Layeghkar on 11.07.24.
//

import Foundation
import Combine

class CoinsViewModelTest: ObservableObject {
    @Published var coins: [CoinsModelTest] = []
    var cancellables = Set<AnyCancellable>()
    
    init() {
        getDataTest()
    }
    
    func getDataTest() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h&locale=en") else { return }
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        URLSession.shared.dataTaskPublisher(for: url)
            .receive(on: DispatchQueue.main)
            .tryMap(handleOutput)
            .decode(type: [CoinsModelTest].self, decoder: decoder)
            .sink(receiveCompletion: handleCompletion , receiveValue: { [weak self] returnedCoins in
                self?.coins = returnedCoins
            })
            .store(in: &cancellables)
    }
    
    func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard
            let response = output.response as? HTTPURLResponse,
            response.statusCode >= 200 && response.statusCode < 300 else {
            throw URLError(.badServerResponse)
        }
        return output.data
    }
    
    func handleCompletion(completion: Subscribers.Completion<any Error>) {
        switch completion {
        case .finished:
            break
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
}
