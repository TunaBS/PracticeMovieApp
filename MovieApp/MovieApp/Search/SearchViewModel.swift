//
//  SearchViewModel.swift
//  MovieApp
//
//  Created by BS00880 on 3/6/24.
//

import Foundation
import Combine


class SearchViewModel/*: ObservableObject */{
    let networkCall: NetworkCall
    
//    @Published var movieDatabase: MovieData?
    @Published var filteredMovieDatabase: MovieData?
//    @Published var allMovies: [Movie] = []
//    @Published var filteredMovies: [Movie] = []
    /*private*/ var isLoadingData = true

    init(networkCall: NetworkCall = NetworkCall(), isLoadingData: Bool = true) {
        self.networkCall = networkCall
        self.isLoadingData = isLoadingData
    }
    
    @MainActor
//    func getSearchedMovieData(movieName: String) async {
//        do {
//            filteredMovieDatabase = try await networkCall.getSearchList(movieName: movieName)
//        } catch ErrorHand.invalidURL {
//            print("invalid url")
//        } catch ErrorHand.invalidResponse {
//            print("invalid response")
//        } catch ErrorHand.invalidData {
//            print("invalid data")
//        } catch {
//            print("problem in fetching")
//        }
//        isLoadingData = false
//    }
    
    func getFilteredMovieData(movieName: String, sortBy: String, orderBy: String) async {
        do {
            filteredMovieDatabase = try await networkCall.getFilteredSearchList(movieName: movieName, sortCriteria: sortBy, orderBy: orderBy)
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
    
//    func filterMoviesByGenres(genres: Set<String>, movieArray: [Movie]) -> [Movie] {
//        guard let movieData = filteredMovieDatabase else {
//            return // No movie data available, nothing to filter
//        }
//
//        // Filter movies and assign them to a new array
//        let filteredMovies = movieData.data.movies.filter { movie in
//            return genres.isSubset(of: Set(movie.genres))
//        }
//
//        // Create a new MovieData instance with the filtered movies
//        let newMovieData = MovieData(status: "ok", statusMessage: "ok", data: MovieData.Data(movies: filteredMovies))
//
//        // Update filteredMovieDatabase with the new MovieData instance
//        filteredMovieDatabase = newMovieData
//        print("updated")
//    }
    
    func filterMoviesByGenres(genres: Set<Genre>, movieArray: [Movie]) -> [Movie] {
        
        return movieArray.filter { movie in
            let movieGenres = Set(movie.genres.compactMap { Genre(rawValue: $0) })
            return genres.isSubset(of: movieGenres)
//            !genres.intersection(movieGenres).isEmpty
        }
    }

}
