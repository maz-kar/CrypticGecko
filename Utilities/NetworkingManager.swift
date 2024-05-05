//
//  NetworkingManager.swift
//  CrypticGecko
//
//  Created by Maziar Layeghkar on 05.05.24.
//

import Foundation
import Combine

class NetworkingManager {
    
    static func download(url: URL) -> AnyPublisher<Data, Error> {
        return URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap({ try handleURLResponse(output: $0) })
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    static func handleCompletion(completion: Subscribers.Completion<any Error>) {
        switch completion {
        case .finished: break
        case .failure(let error): print(error.localizedDescription)
        }
    }
    
    static func handleURLResponse(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard
            let response = output.response as? HTTPURLResponse,
            response.statusCode >= 200 && response.statusCode < 300 else { throw URLError(.badServerResponse) }
        return output.data
    }
}
