//
//  NetworkLoaderViewModel.swift
//  MovieApp
//
//  Created by BS00880 on 29/5/24.
//

//
//  NetworkLoaderViewModel.swift
//  MovieApp
//
//  Created by BS00880 on 29/5/24.
//

import Foundation


class NetworkLoaderViewModel: ObservableObject {
    let networkCall: NetworkCall
    
//    var movieDatabase: MovieData?
    @Published var movieDatabase: MovieData?
    
    
    
    
    init(networkCall: NetworkCall = NetworkCall()) {
        self.networkCall = networkCall
    }
    
    @MainActor
    func getMovieData() async {
        do {
            movieDatabase = try await networkCall.getList()
        } catch {
            print("problem in fetching")
        }
    }
}
