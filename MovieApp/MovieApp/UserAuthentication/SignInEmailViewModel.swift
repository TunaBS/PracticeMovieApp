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
    @Published var successfulAccountCreation = false
    @Published var successfulLogin = false
    
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
        }
        return successfulAccountCreation
    }
    
    func signIn(email: String, password: String) -> Bool {
        print("email: \(email)")
        print("password: \(password)")
        
        guard !email.isEmpty, !password.isEmpty else {
            print("enter email password in login page")
            return successfulLogin
        }
        
        Task {
            do {
                let returnSignedInUserData = try await AuthenticationManager.shared.signInUser(email: email, password: password)
                print("successfully sign in")
                print(returnSignedInUserData)
                successfulLogin = true
                print("successful login value in View model")
                print(successfulLogin)
            } catch {
                print("Error: \(error)")
            }
        }
        print("successful login value in View model before the return statement")
        print(successfulLogin)
        return successfulLogin
        
    }
}
