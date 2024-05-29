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
    
    private var isLoaded = true
    
    init(networkCall: NetworkCall = NetworkCall(), isLoaded: Bool = true) {
        self.networkCall = networkCall
        self.isLoaded = isLoaded
    }
    
    @MainActor
    func getMovieData(movieId: Int) async {
        do {
            movieDetail = try await networkCall.getMovieDetails(movieId: movieId)
        }/* catch ErrorHand.invalidURL {
//            print("invalid url")
//        } catch ErrorHand.invalidResponse {
//            print("invalid response")
//        } catch ErrorHand.invalidData {
//            print("invalid data")
        } */ catch {
            print("problem in fetching")
        }
        isLoaded = false
    }
}
