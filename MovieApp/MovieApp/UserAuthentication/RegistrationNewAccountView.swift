//
//  RegistrationNewAccountView.swift
//  MovieApp
//
//  Created by BS00880 on 7/6/24.
//

import SwiftUI

struct RegistrationNewAccountView: View {
    @ObservedObject var languageManager = LanguageManager.shared
    @StateObject private var signUpViewModel = SignInEmailViewModel()
    @State var email = ""
    @State var password = ""
    @State var confirmPassword = ""
    @State var passwordCorrect = false
    @State var showAlert: Bool = false
    @State private var alertMessage: String = ""
    @State private var successfulAccountCreation = false
    
    var body: some View {
        
        NavigationStack {
            GeometryReader { geomtery in
                ZStack {
                    Image("signUpBackGround")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                        .frame(width: geomtery.size.width, height: geomtery.size.height, alignment: .center)
                        .opacity(0.2)
                    VStack(alignment: .leading) {
                        VStack (alignment: .leading) {
                            Text(languageManager.localizedString(forKey: "Welcome"))
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            
                            Text(languageManager.localizedString(forKey: "Create new account"))
                        }
                        .padding()
                        
                        Spacer()
                        
                        VStack (alignment: .leading) {
                            HStack {
                                TextField(languageManager.localizedString(forKey: "Email"), text: $email)
                                    .autocapitalization(.none)
                                    
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 25).fill(Color.primary.opacity(0.25)))
                            
                            HStack {
                                SecureField(languageManager.localizedString(forKey: "Password"), text: $password)
                                    .overlay(
                                        Image(systemName: "eye.fill").foregroundColor(.primary)
                                        ,alignment: .trailing)
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 25).fill(Color.primary.opacity(0.25)))
                            
                            HStack {
                                SecureField(languageManager.localizedString(forKey: "Confirm Password"), text: $confirmPassword)
                                    .overlay(
                                        Image(systemName: "eye.fill").foregroundColor(.primary)
                                        ,alignment: .trailing)
                                    .onChange(of: confirmPassword) { newValue in
                                        checkPasswordMatch()
                                    }
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 25).fill(Color.primary.opacity(0.25)))
                            
                            
                        }
                        .padding()
                        
                        Spacer()
                        
                        
                        Button(action: {
                            if passwordCorrect{
                                if signUpViewModel.signUp(email: email, password: password) {
                                    successfulAccountCreation = true
                                } else {
                                    alertMessage = "Sign Up isn't successful, please try again"
                                }
                            } else {
                                alertMessage = "Your password didn't match"
                                showAlert = true
                            }
                        }, label: {
                            Text(languageManager.localizedString(forKey: "Sign Up"))
                                .foregroundColor(.white)
                        })
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
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(isPresented: $successfulAccountCreation) {
                SignInView()
            }

//            NavigationLink(destination: SignInView(), isActive: $successfulAccountCreation) {
//                EmptyView() // Hide the default NavigationLink label
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

#Preview {
    RegistrationNewAccountView()
}
