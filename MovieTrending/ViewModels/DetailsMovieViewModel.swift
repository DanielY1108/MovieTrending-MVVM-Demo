//
//  DetailsMovieViewModel.swift
//  MovieTrending
//
//  Created by JINSEOK on 2023/02/23.
//

import Foundation

class DetailsMovieViewModel {
    
    var movie: Movie
    
    var movieImage: URL?
    var moviewTitle: String
    var movieDescription: String
    var movieID: Int
    
    init(movie: Movie) {
        self.movie = movie
        
        self.movieID = movie.id
        self.moviewTitle = movie.title
        self.movieDescription = movie.overview
        self.movieImage = makeImageURL(movie.backdropPath)
    }
    
    private func makeImageURL(_ imageCode: String) -> URL? {
        URL(string: "\(NetworkConstant.shared.imageServerAddress)\(imageCode)")
    }
}
