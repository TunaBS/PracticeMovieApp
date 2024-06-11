//  WatchListViewModel.swift
//  MovieApp
//
//  Created by BS00880 on 3/6/24.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseAuth

class WatchListViewModel: ObservableObject {
    @Published var userFirebaseSession: FirebaseAuth.User?
    @Published var currentUser: UserInfo?
    
    
    let itemsKey: String = "items_key"
    @Published var movieArray: [Movie] = [] {
        didSet {
            saveItems()
        }
    }
    
    init() {
        self.userFirebaseSession = Auth.auth().currentUser
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
        Task {
            try await updateInFirestore()
        }
    }
    
    func saveItems() {
        if let encodeddData = try? JSONEncoder().encode(movieArray) {
            UserDefaults.standard.set(encodeddData,forKey: itemsKey)
        }
    }
    
    func updateInFirestore () async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let personInfo = Firestore.firestore().collection("users").document(uid)
        do {
//            let encodedMovieArray = try Firestore.Encoder().encode(movieArray)
            let encoder = JSONEncoder()
            let encodedMovieArray = try encoder.encode(movieArray)
            try await personInfo.updateData(["movies": encodedMovieArray])
            print("Document successfully updated")
        } catch {
            print("Error updating document: \(error)")
        }
    }
//        do {
////            guard let uid = Auth.auth().currentUser?.uid else { return }
//            let user = UserInfo(id: currentUser.id, email: currentUser.email, userName: currentUser.userName, movies: movieArray)
//            let encodedUser = try Firestore.Encoder().encode(user)
//            try await Firestore.firestore().collection("users").document(currentUser.id).updateData()
//        } catch {
//            
//        }
//        let washingtonRef = db.collection("cities").document("DC")
//
//        // Set the "capital" field of the city 'DC'
//        do {
//          try await washingtonRef.updateData([
//            "capital": true
//          ])
//          print("Document successfully updated")
//        } catch {
//          print("Error updating document: \(error)")
//        }
//    }
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
