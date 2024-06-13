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
//    @Published var userFirebaseSession: FirebaseAuth.User?
    private var userId: String?
    @Published var currentUser: UserInfo?
    @Published var itemAlreadyInWatchList: Bool = false
//    let itemsKey: String = "items_key"
    @Published var movieArray: [Movie] = [] {
        didSet {
            Task {
                await saveItems()
            }
        }
    }
    
    init() {
        if let userId = Auth.auth().currentUser?.uid {
            self.userId = userId
            Task {
                await fetchUser()
            }
        }
//        getItems()
    }
    
    func fetchUser() async {
        print("into fetch user function from watchlist view model")
        guard let uid = userId else { return }
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else { return }
        self.currentUser = try? snapshot.data(as: UserInfo.self)
        print("From watchlist view model Fetched current user \(self.currentUser)")
        print("From watchlist view model current user name \(self.currentUser?.userName)")
        print("cFrom watchlist view modelcurrent user email id \(self.currentUser?.email)")
        self.movieArray = currentUser?.movies ?? []
    }

    func deleteItems(indexSet: IndexSet) {
        movieArray.remove(atOffsets: indexSet)
        Task {
            await saveItems()
        }
    }
    
    func moveItems(from: IndexSet, to: Int) {
        movieArray.move(fromOffsets: from, toOffset: to)
    }
    
    func addItems(movie: Movie) {
//        movieArray.contains(where: { $0.id == movie.id }) ? itemAlreadyInWatchList = true : movieArray.append(movie)
        if movieArray.contains(where: { $0.id == movie.id }) {
            itemAlreadyInWatchList = true
        }
        else {
            itemAlreadyInWatchList = false
            movieArray.append(movie)
        }
        Task {
            await saveItems()
        }
//        return itemAlreadyInWatchList
    }
    
    func saveItems() async {
        await updateInFirestore()
    }
    
    func updateInFirestore () async /*throws */{
        guard let uid = userId else { return }
        guard var currentUserInfo = currentUser else { return }
        currentUserInfo.movies = movieArray
        let personInfo = Firestore.firestore().collection("users").document(uid)
        do {
//            let encodedMovieArray = try Firestore.Encoder().encode(movieArray)
//            let encoder = JSONEncoder()
//            let encodedMovieArray = try encoder.encode(movieArray)
            try await personInfo.setData(from: currentUserInfo)
            print("Document successfully updated")
        } catch {
            print("Error updating document: \(error)")
        }
    }
}
