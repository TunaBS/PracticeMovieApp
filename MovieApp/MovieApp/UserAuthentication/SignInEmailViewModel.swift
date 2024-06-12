////
////  SignInEmailViewModel.swift
////  MovieApp
////
////  Created by BS00880 on 7/6/24.
////
//
//import Foundation
//
//@MainActor
//final class SignInEmailViewModel: ObservableObject {
////    @Published var email = ""
////    @Published var password = ""
////    
////
//    @Published var successfulAccountCreation = false
//    @Published var successfulLogin = false
//    

//    func signUp(email: String, password: String, userName: String, completion: @escaping (Bool) -> Void) {
//        print("this is the email: \(email)")
//        print("this is the password \(password)")
//        guard !email.isEmpty, !password.isEmpty else {
//            print("Please enter email and password")
//            completion(false)
//            return
//        }
//        Task {
//            do {
//                let returnedUserData = try await AuthenticationManager.shared.createUser(email: email, password: password, userName: userName)
//                print("Successfully Created New User")
//                print(returnedUserData)
//                successfulAccountCreation = true
//                completion(true)
//            } catch {
//                print("Error: \(error)")
//                completion(false)
//            }
//        }
//    }
//    
//    func signIn(email: String, password: String, navigationState: NavigationState, completion: @escaping (Bool) -> Void) {
//        print("email: \(email)")
//        print("password: \(password)")
//        
//        guard !email.isEmpty, !password.isEmpty else {
//            print("enter email password in login page")
//            completion(false)
//            return
//        }
//        
//        Task {
//            do {
//                let returnSignedInUserData = try await AuthenticationManager.shared.loginUser(email: email, password: password)
//                print("successfully sign in")
//                print(returnSignedInUserData)
//                successfulLogin = true
//                print("successful login value in View model")
//                print(successfulLogin)
//                completion(true)
//            } catch {
//                print("Error: \(error)")
//                completion(false)
//            }
//        }
//        
//    }
//}

