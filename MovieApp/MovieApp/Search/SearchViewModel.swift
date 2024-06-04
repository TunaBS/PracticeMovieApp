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
    
//    var movieDatabase: MovieData?
    @Published var movieDatabase: MovieData?
//    @Published var searchText: String = ""
    /*private*/ var isLoadingData = true
//
//    @Published private(set) var allMovies: [Movie] = Movie.movieArrayShowForTest
//    @Published private(set) var filteredMovies: [Movie] = []
//    private var cancellable = Set<AnyCancellable> ()
//    
//    var isSearching: Bool {
//        !searchText.isEmpty
//    }
//    
//    var showSearchSuggestions: Bool {
//        searchText.count<5
//    }
    
//    var filteredMovies: [Movie] {
//        guard !searchText.isEmpty else { return movieDatabase?.data.movies ?? Movie.movieArrayShowForTest}
//        return movieDatabase?.data.movies ?? Movie.movieArrayShowForTest.filter { movie in
//            movie.title.lowercased().contains(searchText.lowercased())
//        }
//    }
    
    init(networkCall: NetworkCall = NetworkCall(), isLoadingData: Bool = true) {
        self.networkCall = networkCall
        self.isLoadingData = isLoadingData
//        addSubscribers()
    }
//    
//    private func addSubscribers() {
//        $searchText
//            .debounce(for: 0.3, scheduler: DispatchQueue.main)
//            .sink { [weak self] searchText in
//                self?.filteredMovies(searchText: searchText)
//            }
//            .store(in: &cancellable)
//    }
//    
//    private func filteredMovies(searchText: String) {
//        guard !searchText.isEmpty else {
//            filteredMovies = []
//            return
//        }
//        let search = searchText.lowercased()
//        filteredMovies = allMovies.filter({movie in
//            let titleMovieSearch = movie.title.lowercased().contains(search)
//            return titleMovieSearch
//        })
//    }
    @MainActor
    func getMovieData(movieName: String) async {
        do {
            movieDatabase = try await networkCall.getSearchList(movieName: movieName)
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
