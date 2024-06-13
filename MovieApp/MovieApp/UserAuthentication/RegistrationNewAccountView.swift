//
//  RegistrationNewAccountView.swift
//  MovieApp
//
//  Created by BS00880 on 7/6/24.
//

import SwiftUI

struct RegistrationNewAccountView: View {
    @ObservedObject var languageManager = LanguageManager.shared
//    @StateObject private var signUpViewModel = SignInEmailViewModel()
//    @StateObject private var navigationState = NavigationState()
    @State var userName = ""
    @State var email = ""
    @State var password = ""
    @State var confirmPassword = ""
    @State var passwordCorrect = false
    @State var showAlert: Bool = false
    @State private var alertMessage: String = ""
    @State private var successfulAccountCreation = false
    @State private var isPasswordVisible: Bool = false
    @State private var isConfirmPasswordVisible: Bool = false
    @EnvironmentObject var signingViewModel: AuthenticationManager
    
    var body: some View {
        
        NavigationStack {
            GeometryReader { geomtery in
                ZStack {
                    Color(.black)
                        .ignoresSafeArea()
                    Image("backgroundLaunch")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                        .frame(width: geomtery.size.width, height: geomtery.size.height/1.3, alignment: .center)
                        .opacity(0.2)
                    VStack(alignment: .leading) {
                        VStack (alignment: .leading) {
                            HStack {
                                Spacer()
                                Text(languageManager.localizedString(forKey: "Welcome"))
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                    .foregroundColor(.white)
                                Spacer()
                            }
                            HStack {
                                Spacer()
                                Text(languageManager.localizedString(forKey: "Create new account"))
                                    .foregroundColor(.white)
                                Spacer()
                            }
                            
                        }
                        .padding()
                        
                        Spacer()
                        
                        VStack (alignment: .leading) {
                            HStack {
                                TextField(languageManager.localizedString(forKey: "User Name"), text: $userName)
                                    
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 25).fill(Color.white.opacity(0.5)))
                            
                            HStack {
                                TextField(languageManager.localizedString(forKey: "Email"), text: $email)
                                    .autocapitalization(.none)
                                    
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 25).fill(Color.white.opacity(0.5)))
                            
                            HStack {
                                if isPasswordVisible {
                                    TextField(languageManager.localizedString(forKey: "Password"), text: $password)
                                } else {
                                    SecureField(languageManager.localizedString(forKey: "Password"), text: $password)
                                }
                                Button(action: {
                                    isPasswordVisible.toggle()
                                }) {
                                    Image(systemName: isPasswordVisible ? "eye.slash.fill" : "eye.fill")
                                        .foregroundColor(.white)
                                }
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 25).fill(Color.white.opacity(0.5)))
                            
                            HStack {
                                
                                if isConfirmPasswordVisible {
                                    TextField(languageManager.localizedString(forKey: "Confirm Password"), text: $confirmPassword)
                                    
                                } else {
                                    SecureField(languageManager.localizedString(forKey: "Confirm Password"), text: $confirmPassword)
                                    
                                }
                                Button(action: {
                                    isConfirmPasswordVisible.toggle()
                                }) {
                                    Image(systemName: isConfirmPasswordVisible ? "eye.slash.fill" : "eye.fill")
                                        .foregroundColor(.white)
                                }
                                
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 25).fill(Color.white.opacity(0.5)))
                            
                            
                        }
                        .padding()
                        
                        Spacer()
                        Button(action: {
                            Task {
                                try await signingViewModel.createUser(email: email, password: password, userName: userName)

                            }
                        }, label: {
                            Text(languageManager.localizedString(forKey: "Sign Up"))
                                .foregroundColor(.white)
                        })
                        .disabled(!formIsValid)
                        .opacity(formIsValid ? 1.0 : 0.6)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 30)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/).fill(Color.purple))
                        .padding()
                        .alert(isPresented: $showAlert) {
                            Alert(title: Text("Error Signing Up"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                        }
                        
                    }
                    .padding()
                }
            }
            .navigationTitle("Sign Up")
//            .navigationBarTitleDisplayMode(.inline)
//            .navigationDestination(isPresented: $successfulAccountCreation) {
//                SignInView(navigationState: navigationState)
//            }
        }
    }
    
    
    private func checkPasswordMatch() {
        if passwordsMatch() {
            passwordCorrect = true
            print("Passwords match")
        } else {
            print("Passwords do not match")
        }
    }
    
    private func passwordsMatch() -> Bool {
        return !password.isEmpty && password == confirmPassword
    }
}

extension RegistrationNewAccountView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty 
        && !userName.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
        && password == confirmPassword
    }
}
#Preview {
    RegistrationNewAccountView()
}
