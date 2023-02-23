//
//  MainViewModel.swift
//  MovieTrending
//
//  Created by JINSEOK on 2023/02/23.
//

import Foundation

class MainViewModel {
    
    func numberOfSections() -> Int {
        1
    }
    
    func numberOfRows(in section: Int) -> Int {
        5
    }
    
    func getData() {
        NetworkService.getTrendingMovies { result in
            switch result {
            case .success(let data):
                print("Top Trending count: \(data.results.count)")
            case .failure(let error):
                print(error)
            }
        }
    }
}
