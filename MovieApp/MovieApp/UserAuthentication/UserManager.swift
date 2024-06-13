//
//  UserManager.swift
//  MovieApp
//
//  Created by BS00880 on 10/6/24.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

final class UserManager {
//    static let shared = UserManager()
//    private init() { }
//    
//    func createNewUser (auth: AuthDataResultModel/*, userInfo: UserInfo*/) async throws {
//        var userData: [String: Any] = [
//            "user_id": auth.uid,
////            "user_name": userInfo.userName
//        ]
//        if let email = auth.email {
//            userData["email"] = email
//        }
//        
//        try await Firestore.firestore().collection("users").document(auth.uid).setData(userData, merge: false)
//    }
//    
//    func getUser(userId: String) async throws -> UserInfo {
//        let snapshot = try await Firestore.firestore().collection("users").document(userId).getDocument()
//        guard let data = snapshot.data(), let userId = data["user_id"] as? String else {
//            throw URLError(.badServerResponse)
//        }
//        
//        let email = data["email"] as? String
//        let userName = data["user_name"] as? String
//        
//        return UserInfo(id: userId, email: email, userName: userName)
//    }
}
