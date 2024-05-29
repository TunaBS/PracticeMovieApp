//
//  MovieDetailViewModel.swift
//  MovieApp
//
//  Created by BS00880 on 29/5/24.
//

import Foundation

//https://yts.mx/api/v2/movie_details.json

class MovieDetailViewModel {
//    var movieId: Int
    let networkCall: NetworkCall
    
    var movieDetail: MovieDetail?
    
    init(networkCall: NetworkCall = NetworkCall()) {
        self.networkCall = networkCall
    }
    
    @MainActor
    func getMovieData(movieId: Int) async {
        do {
            movieDetail = try await networkCall.getMovieDetails(movieId: movieId)
        } catch {
            print("problem in fetching")
        }
    }
}
