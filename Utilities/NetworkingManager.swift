//
//  NetworkingManager.swift
//  CrypticGecko
//
//  Created by Maziar Layeghkar on 05.05.24.
//

import Foundation
import Combine

/*
 NetworkingManager consists:
 1. This layer must be a folder like Utilities
 2. Its funcs must be static func in order to be accessible anywhere in project
 3. enum NetworkingError with var description
 */

class NetworkingManager {
    
    enum NetworkingError: LocalizedError {
        case badURLResponse(url: URL)
        case unknown
        
        var errorDescription: String? {
            switch self {
            case .badURLResponse(url: let url): return "[🔥] Bad response from ULR: \(url)"
            case .unknown: return "[⚠️] Unknown error occured."
            }
        }
    }
    
    static func download(url: URL) -> AnyPublisher<Data, Error> {
        return URLSession.shared.dataTaskPublisher(for: url)
            //.subscribe(on: DispatchQueue.global(qos: .default)) As automatically goes to background thread, it can be deleted.
            .tryMap({ try handleURLResponse(output: $0, url: url) })
            .retry(3) //retries 3 times if response fails
            .eraseToAnyPublisher()
    }
    
    static func handleCompletion(completion: Subscribers.Completion<any Error>) {
        switch completion {
        case .finished: break
        case .failure(let error): print(error.localizedDescription)
        }
    }
    
    static func handleURLResponse(output: URLSession.DataTaskPublisher.Output, url: URL) throws -> Data {
        guard
            let response = output.response as? HTTPURLResponse,
            response.statusCode >= 200 && response.statusCode < 300 else { throw NetworkingError.badURLResponse(url: url) }
        return output.data
    }
    
}
