//
//  MovieDetailViewModel.swift
//  MovieApp
//
//  Created by BS00880 on 29/5/24.
//

import Foundation

class MovieDetailViewModel: ObservableObject {
//    var movieId: Int
    let networkCall: NetworkCall
    
    var movieDetail: MovieDetail?
    
//    /*private*/ var isLoadingData = true
    @Published var isLoadingData = true
    
    init(networkCall: NetworkCall = NetworkCall(), isLoadingData: Bool = true) {
        self.networkCall = networkCall
        self.isLoadingData = isLoadingData
    }
    
    @MainActor
    func getMovieData(movieId: Int) async {
        do {
            movieDetail = try await networkCall.getMovieDetails(movieId: movieId)
        } catch ErrorHand.invalidURL {
            print("invalid url")
        } catch ErrorHand.invalidResponse {
            print("invalid response")
        } catch ErrorHand.invalidData {
            print("invalid data")
        } catch {
            print("problem in fetching")
        }
        isLoadingData = false
    }
}
