//
//  MainViewModel.swift
//  MovieTrending
//
//  Created by JINSEOK on 2023/02/23.
//

import Foundation

class MainViewModel {
    
    var isLoading: Observable<Bool> = Observable(false)
    var cellDataSource: Observable<[Movie]> = Observable(nil)
    
    var dataSource: TrendingMoviesModel?
    
    func numberOfSections() -> Int {
        1
    }
    
    func numberOfRows(in section: Int) -> Int {
        self.dataSource?.results.count ?? 0
    }
    
    func getData() {
        // 로딩이 true 면 작업을 중지
        if isLoading.value ?? true {
            return
        }
        
        isLoading.value = true
        
        NetworkService.getTrendingMovies { [weak self] result in
            self?.isLoading.value = false
            
            switch result {
            case .success(let data):
                print("Top Trending count: \(data.results.count)")
                self?.dataSource = data
                self?.mapCellData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func mapCellData() {
        self.cellDataSource.value = self.dataSource?.results ?? []
    }
    
    // 셀을 불러오는 로직을 뷰모델로 처리
    func getMovieTitle(_ movie: Movie) -> String {
        return movie.title
    }
}
