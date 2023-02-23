//
//  NetworkService.swift
//  MovieTrending
//
//  Created by JINSEOK on 2023/02/23.
//

import Foundation

enum NetworkError: Error {
    case urlError
    case failedRequest
    case failedParseData
}

class NetworkService {
    
    static func getTrendingMovies(completion: @escaping (Result<TrendingMoviesModel, NetworkError>) -> Void) {
        
        let urlString = NetworkConstant.shared.serverAddress + NetworkConstant.shared.apiKey
        
        guard let url = URL(string: urlString) else {
            completion(.failure(.urlError))
            return
        }
        
        URLSession.shared.dataTask(with: url) { dataResponse, urlResponse, error in
            guard error == nil else {
                completion(.failure(.failedRequest))
                return
            }
            
            guard let data = dataResponse,
               let resultData = try? JSONDecoder().decode(TrendingMoviesModel.self, from: data) else {
                completion(.failure(.failedParseData))
                return
            }
            
            completion(.success(resultData))
            
        }.resume()
        
    }
}
