//
//  SignInView.swift
//  MovieApp
//
//  Created by BS00880 on 7/6/24.
//

import SwiftUI

struct SignInView: View {
    
    @ObservedObject var languageManager = LanguageManager.shared
//    @ObservedObject var navigationState: NavigationState
//    @StateObject var signInViewModel = SignInEmailViewModel()
    @State var email = ""
    @State var password = ""
//    @State var successfulLogIn = false
    @State private var alertMessage: String = ""
    @State var showAlert = false
    @State private var isPasswordVisible: Bool = false
    @State private var isConfirmPasswordVisible: Bool = false
    @EnvironmentObject var signingViewModel: AuthenticationManager
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ZStack {
                    Image("loginBackgroud")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                        .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                        .opacity(0.2)
                    VStack {
                        VStack {
                            Text(languageManager.localizedString(forKey: "Welcome Back"))
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            
                            Text(languageManager.localizedString(forKey: "Please sign in to your account"))
                        }
                        
                        Spacer()
                        
                        VStack (alignment: .leading) {
                            HStack {
                                TextField(languageManager.localizedString(forKey: "Email"), text: $email)
                                    .autocapitalization(.none)
                                    
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 25).fill(Color.primary.opacity(0.25)))
                            
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
                                        .foregroundColor(.primary)
                                }
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 25).fill(Color.primary.opacity(0.25)))
                            
                        }
                        .padding()
                        
                        Spacer()
                        
                        Button(action: {

                            Task {
                                try await signingViewModel.signIn(email: email, password: password)
                            }

                        }, label: {
                            Text(languageManager.localizedString(forKey: "Sign In"))
                                .foregroundColor(.white)
                        })
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 30)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/).fill(Color.purple))
                        .padding()
                        .disabled(!formIsValid)
                        .opacity(formIsValid ? 1.0 : 0.6)
                        .alert(isPresented: $showAlert){
                            Alert(title: Text("Error Signing In"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                        }
                        
                        Button(action: {
                            Task {
                                try await signingViewModel.signInWithGoogle()
                            }
                        }, label: {
                            HStack {
                                Image("googleLogo")
                                    .resizable()
                                    .frame(maxWidth: 30, maxHeight: 30)
                                Text(languageManager.localizedString(forKey: "Sign In With Google"))
                            }
                        })
                        .frame(maxWidth: .infinity, maxHeight: 30)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 25.0).fill(Color.white))
                        .padding()
                        .alert(isPresented: $showAlert){
                            Alert(title: Text("Error Signing In"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                        }
                        HStack {
                            Text(languageManager.localizedString(forKey: "Don't have an account?"))
                            NavigationLink(destination: RegistrationNewAccountView()) {
                                Text(languageManager.localizedString(forKey: "Sign Up"))
                                    .fontWeight(.bold)
                                    .foregroundColor(.primary)
                            }
                        }
                    }
                }
            }
//            .navigationTitle("Login")
//            .navigationBarTitleDisplayMode(.inline)
//            .navigationDestination(isPresented: $navigationState.isLoggedIn) {
//                TabViewBelow()
//            }
        }
    }
}

extension SignInView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty 
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
    }
}

#Preview {
    SignInView(/*navigationState: NavigationState()*/)
        .environmentObject(AuthenticationManager())
}
