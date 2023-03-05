//
//  APIManager.swift
//  Test
//
//  Created by Prachit on 04/03/23.
//

import Foundation

enum DataError: Error {
    case invalidResponse
    case parsingFailed
    case invalidData
    case networkIssue
    case invalidURL
    case error(Error?)
}

typealias Handler = (Result<[Product], DataError>) -> Void

final class APIManager {
    
    static let shared = APIManager()
    
    private init () {}
    
    func fetchProduct( completion : @escaping Handler) {
        
        guard let url = URL(string: Constant.API.productAPI) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data , error == nil else {
                completion(.failure(.invalidData))
                return
            }
            
            guard let response = response as? HTTPURLResponse, 200 ... 299 ~= response.statusCode   else {
                completion(.failure(.invalidResponse))
                return
            }
            
            do {
                let products = try JSONDecoder().decode([Product].self, from: data)
                completion(.success(products))
            } catch {
                completion(.failure(.error(error)))
            }
            
        }.resume()
    }
    
}


class A {
    

}
