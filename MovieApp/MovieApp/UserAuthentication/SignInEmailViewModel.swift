//
//  SignInEmailViewModel.swift
//  MovieApp
//
//  Created by BS00880 on 7/6/24.
//

import Foundation

@MainActor
final class SignInEmailViewModel: ObservableObject {
//    @Published var email = ""
//    @Published var password = ""
//    
//
    var successfulAccountCreation = false
    
    func signUp(email: String, password: String) -> Bool {
        print("this is the email: \(email)")
        print("this is the password \(password)")
        guard !email.isEmpty, !password.isEmpty else {
            print("Please enter email and password")
            return successfulAccountCreation
        }
        
        Task {
            do {
                let returnedUserData = try await AuthenticationManager.shared.createUser(email: email, password: password)
                print("Successfully Created New User")
                print(returnedUserData)
                successfulAccountCreation = true
            } catch {
                print("Error: \(error)")
            }
            return successfulAccountCreation
        }
        
        return successfulAccountCreation
    }
}
