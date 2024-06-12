//
//  AuthenticationManager.swift
//  MovieApp
//
//  Created by BS00880 on 7/6/24.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseCore
import GoogleSignIn
import GoogleSignInSwift

//struct AuthDataResultModel {
//    let uid: String
//    let email: String?
//    let userName: String?
//    init(user: UserInfo) {
//        self.uid = user.id
//        self.email = user.email
//        self.userName = user.userName
//    }
//}

protocol AuthenticationFormProtocol {
    var formIsValid: Bool { get }
}

@MainActor
class AuthenticationManager: ObservableObject {
    @Published var userFirebaseSession: FirebaseAuth.User?
    @Published var currentUser: UserInfo?
    
    init() {
        self.userFirebaseSession = Auth.auth().currentUser
        Task {
            await fetchUser()
        }
    }
    
    func signIn(email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userFirebaseSession = result.user
            await fetchUser()
        } catch {
            print("Error while logging in \(error)")
        }
    }
    
    func createUser(email: String, password: String, userName: String) async throws {
        do{
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userFirebaseSession = result.user
            let user = UserInfo(id: result.user.uid, email: email, userName: userName, movies: [])
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
            await fetchUser()
        } catch {
            print("Error in creating user \(error)")
        }
    }
    
    func fetchUser() async {
        print("into fetch user function from authentication manager")
        //        guard let uid = Auth.auth().currentUser?.uid else { return }
        //        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else { return }
        //        self.currentUser = try? snapshot.data(as: UserInfo.self)
        guard let uid = Auth.auth().currentUser?.uid else {return}
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else {return}
        print("snapshot data: \(snapshot)")
        self.currentUser = try? snapshot.data(as: UserInfo.self)
        print("From authentication manager Fetched current user \(self.currentUser)")
        print("From authentication manager current user name \(self.currentUser?.userName)")
        print("From authentication manager current user email id \(self.currentUser?.email)")
    }
    
    func signOut () async throws {
        do {
            try Auth.auth().signOut()
            self.userFirebaseSession = nil
            self.currentUser = nil
        } catch {
            print("Error while signing out \(error)")
        }
    }
    
    func deleteAccount() async throws {
        guard let user = Auth.auth().currentUser else { return }
        
        do {
            try await Firestore.firestore().collection("users").document(user.uid).delete()
            try await user.delete()
            self.userFirebaseSession = nil
            self.currentUser = nil
            print("Account deleted")
        } catch {
            print("DEBUG: Failed to delete account with Error \(error)")
        }
    }
    
    func signInWithGoogle() async throws {
        guard let topView = TopViewController.shared.topViewController() else {
            throw URLError(.cannotFindHost)
        }
        
        do {
            let googleSignInResult = try await GIDSignIn.sharedInstance.signIn(withPresenting: topView)
            
            guard let idToken = googleSignInResult.user.idToken?.tokenString else {
                throw URLError(.badServerResponse)
            }
            let accessToken = googleSignInResult.user.accessToken.tokenString
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: accessToken)
            
            let authDataResult = try await Auth.auth().signIn(with: credential)
            
            let uid = authDataResult.user.uid
            guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else {return}
            self.userFirebaseSession = authDataResult.user
            if !snapshot.exists {
                let user = UserInfo(id: uid, email: authDataResult.user.email, userName: authDataResult.user.displayName, movies: [])
                let encodedUser = try Firestore.Encoder().encode(user)
                try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
            }
            await fetchUser()
        } catch {
            print("Error in creating user with google sign in \(error)")
        }

    }

//    func updateInFirestore (movieArray: [Movie]) async throws {
//        guard let uid = Auth.auth().currentUser?.uid else { return }
//        let personInfo = Firestore.firestore().collection("users").document(uid)
//        do {
////            let encodedMovieArray = try Firestore.Encoder().encode(movieArray)
//            let encoder = JSONEncoder()
//            let encodedMovieArray = try encoder.encode(movieArray)
//            try await personInfo.updateData(["movies": encodedMovieArray])
//            print("Document successfully updated")
//        } catch {
//            print("Error updating document: \(error)")
//        }
//    }
}
//    func createUser(email: String, password: String, userName: String) async throws -> UserInfo {
//        let authDataResult = try await Auth.auth().createUser(withEmail: email, password: password)
//        
//        let uid = authDataResult.user.uid
//        let userDocument: [String: Any] = [
//            "email": email,
//            "userName": userName,
//            "movies": []  // Initially no movies
//        ]
//        
//        try await db.collection("users").document(uid).setData(userDocument)
//        
//        let userInfo = UserInfo(id: uid, email: email, userName: userName, movies: [])
//        print("user created: \(userInfo)")
//        return userInfo
//    }
    

//    
//    func loginUser(email: String, password: String) async throws -> UserInfo {
//        let authSignInData = try await Auth.auth().signIn(withEmail: email, password: password)
//        let uid = authSignInData.user.uid
//        
//        let documentSnapshot = try await db.collection("users").document(uid).getDocument()
//        guard let data = documentSnapshot.data() else {
//            throw NSError(domain: "AuthenticationManager", code: 404, userInfo: [NSLocalizedDescriptionKey: "User not found"])
//        }
//        
//        let email = data["email"] as? String
//        let userName = data["userName"] as? String
//        let movies = try JSONDecoder().decode([Movie].self, from: JSONSerialization.data(withJSONObject: data["movies"] as? [Any] ?? []))
//        
//        let userInfo = UserInfo(id: uid, email: email, userName: userName, movies: movies)
//        return userInfo
//    }
//    
//    func getLoggedInUserData() async throws -> UserInfo {
//        guard let currentUser = Auth.auth().currentUser else {
//            throw NSError(domain: "AuthenticationManager", code: 401, userInfo: [NSLocalizedDescriptionKey: "No user is logged in"])
//        }
//        
//        let uid = currentUser.uid
//        
//        let documentSnapshot = try await db.collection("users").document(uid).getDocument()
//        guard let data = documentSnapshot.data() else {
//            throw NSError(domain: "AuthenticationManager", code: 404, userInfo: [NSLocalizedDescriptionKey: "User not found"])
//        }
//        
//        let email = data["email"] as? String
//        let userName = data["userName"] as? String
//        let movies = try JSONDecoder().decode([Movie].self, from: JSONSerialization.data(withJSONObject: data["movies"] as? [Any] ?? []))
//        
//        let userInfo = UserInfo(id: uid, email: email, userName: userName, movies: movies)
//        return userInfo
//    }
//    
//    
//    func uploadMovieData(movie: Movie, userID: String) async throws {
//        let movieDocument = try JSONEncoder().encode(movie)
//        let movieDictionary = try JSONSerialization.jsonObject(with: movieDocument, options: .allowFragments) as? [String: Any]
//        
//        guard let movieData = movieDictionary else {
//            throw NSError(domain: "AuthenticationManager", code: 500, userInfo: [NSLocalizedDescriptionKey: "Failed to convert movie data"])
//        }
//        
//        try await db.collection("users").document(userID).collection("movies").document("\(movie.id)").setData(movieData)
//        print("Movie data successfully uploaded to Firestore")
//    }
//}
