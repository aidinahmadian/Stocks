//
//  APICaller.swift
//  Stocks
//
//  Created by Aidin Ahmadian on 12/26/21.
//

import Foundation

final class APICaller {
    static let shared = APICaller()
    
    private struct Constants {
        static let apiKey = ""
        static let sandboxApiKey = ""
        static let baseUrl = ""
    }
    
    private init() {}
    
    //MARK: - Public
    
    // Get Stock Info
    
    // Search Stocks
    
    //MARK: Private
    
    private enum Endpoint: String {
        case search
    }
    
    private enum APIError: Error {
        case noDataReturned
        case invalidURL
    }
    
    private func url(
        for endpoint: Endpoint,
        queryParams: [String: String] = [:]
    ) -> URL? {
        
        return nil
    }
    
    private func request<T: Codable>(
        url: URL?,
        expecting: T.Type,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        guard let url = url else {
            // Invalid URL
            completion(.failure(APIError.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.failure(APIError.noDataReturned))
                }
                return
            }
            
            do {
                let results = try JSONDecoder().decode(expecting, from: data)
                completion(.success(results))
            }
            catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}

