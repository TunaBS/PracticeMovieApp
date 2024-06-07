//
//  SignInView.swift
//  MovieApp
//
//  Created by BS00880 on 7/6/24.
//

import SwiftUI

struct SignInView: View {
    
    @ObservedObject var languageManager = LanguageManager.shared
    @StateObject var signInViewModel = SignInEmailViewModel()
    @State var email = ""
    @State var password = ""
    @State var successfulLogIn = false
    @State private var alertMessage: String = ""
    @State var showAlert = false
    
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
                                SecureField(languageManager.localizedString(forKey: "Password"), text: $password)
                                    .overlay(
                                        Image(systemName: "eye.fill").foregroundColor(.primary)
                                        ,alignment: .trailing)
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 25).fill(Color.primary.opacity(0.25)))
                            
                            HStack {
                                Spacer()
                                Text(languageManager.localizedString(forKey: "Forgot Password?"))
                            }
                        }
                        .padding()
                        
                        Spacer()
                        
                        Button(action: {
                            signInViewModel.signIn(email: email, password: password)
//                            print("successful login value in Login View")
//                            print(signInViewModel.signIn(email: email, password: password))
//                            if signInViewModel.signIn(email: email, password: password){
//                                successfulLogIn = true
//                                print("Sign in hocche")
//                                
//                            } /*else {*/
//                                alertMessage = "Sorry you couldn't sign in, please give correct information again"
//                                showAlert = true
//                                print("enters here not signed in that means")
//                            }
                        }, label: {
                            Text(languageManager.localizedString(forKey: "Sign In"))
                                .foregroundColor(.white)
                        })
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 30)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/).fill(Color.purple))
                        .padding()
                        .alert(isPresented: $showAlert){
                            Alert(title: Text("Error Signing In"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                        }
                        
                        HStack {
                            Text(languageManager.localizedString(forKey: "Don't have an account?"))
                            Text(languageManager.localizedString(forKey: "Sign Up"))
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        }
                    }
                }
            }
            .navigationTitle("Login")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    SignInView()
}
//Cannot find 'geomtery' in scope
