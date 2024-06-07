//
//  AuthenticationManager.swift
//  MovieApp
//
//  Created by BS00880 on 7/6/24.
//

import Foundation
import FirebaseAuth

struct AuthDataResultModel {
    let uid: String
    let email: String?
    
    
    init(user: User) {
        self.uid = user.uid
        self.email = user.email
    }
}

final class AuthenticationManager {
    
    static let shared = AuthenticationManager()
    private init() { }
    
    func createUser(email: String, password: String) async throws -> AuthDataResultModel {
        let authDataResult = try await Auth.auth().createUser(withEmail: email, password: password)
        let result = AuthDataResultModel(user: authDataResult.user)
        return result
    }
    
    func signInUser(email: String, password: String) async throws -> AuthDataResultModel {
        let authSignInData = try await Auth.auth().signIn(withEmail: email, password: password)
        let resultOfSignInData = AuthDataResultModel(user: authSignInData.user)
        return resultOfSignInData
    }
    
}
