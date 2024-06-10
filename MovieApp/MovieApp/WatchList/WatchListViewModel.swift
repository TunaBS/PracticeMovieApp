//  WatchListViewModel.swift
//  MovieApp
//
//  Created by BS00880 on 3/6/24.
//

import Foundation

class WatchListViewModel: ObservableObject {
    
    let itemsKey: String = "items_key"
    @Published var movieArray: [Movie] = [] {
        didSet {
            saveItems()
        }
    }
    
    init() {
        getItems()
    }
    
    func getItems() {
        guard let data = UserDefaults.standard.data(forKey: itemsKey)
        else {
            print("error, no data found")
            return
        }
        guard
            let savedItem = try? JSONDecoder().decode([Movie].self, from: data)
        else {
            print("error while decoding")
            return
        }
        
        self.movieArray = savedItem
    }
    
    func deleteItems(indexSet: IndexSet) {
        movieArray.remove(atOffsets: indexSet)
    }
    
    func moveItems(from: IndexSet, to: Int) {
        movieArray.move(fromOffsets: from, toOffset: to)
    }
    
    func addItems(movie: Movie) {
        movieArray.contains(where: { $0.id == movie.id }) ? print("This movie already exists in your watch list") : movieArray.append(movie)
    }
    
    func saveItems() {
        if let encodeddData = try? JSONEncoder().encode(movieArray) {
            UserDefaults.standard.set(encodeddData,forKey: itemsKey)
        }
    }
}

//class WatchListViewModel: ObservableObject {
//    
//    let itemsKey: String = "items_key"
////    @Published var movieArray: [Movie] = []
//    @Published var movieArray: [Movie] = [] {
//        didSet {
//            saveItems()
//        }
//    }
//    
//    init() {
//        getItems()
//    }
//    
//    func getItems() {
//        Task {
//            do {
//                let userInfo = try await AuthenticationManager.shared.getLoggedInUserData()
//                self.movieArray = userInfo.movies
//                print("Successfully fetched movies: \(self.movieArray)")
//            } catch {
//                print("Failed to fetch user data: \(error)")
//            }
//        }
//    }
//    func addItems(movie: Movie) {
//        guard let userID = Auth.auth().currentUser?.uid else {
//            print("No user is logged in")
//            return
//        }
//        
//        Task {
//            do {
//                try await AuthenticationManager.shared.uploadMovieData(movie: movie, userID: userID)
//                print("Movie data uploaded for movie: \(movie.title)")
//            } catch {
//                print("Failed to upload movie data: \(error)")
//            }
//        }
//    }
//    
//    func saveItems() {
//        if let encodeddData = try? JSONEncoder().encode(movieArray) {
//            UserDefaults.standard.set(encodeddData,forKey: itemsKey)
//        }
//    }
//}
//
