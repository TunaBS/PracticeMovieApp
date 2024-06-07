//
//  SignInView.swift
//  MovieApp
//
//  Created by BS00880 on 7/6/24.
//

import SwiftUI

struct SignInView: View {
    
    @ObservedObject var languageManager = LanguageManager.shared
    @State var username = ""
    @State var password = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                Text(languageManager.localizedString(forKey: "Welcome Back"))
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                
                Text(languageManager.localizedString(forKey: "Please sign in to your account"))
            }
            
            Spacer()
            
            VStack (alignment: .leading) {
                HStack {
                    TextField(languageManager.localizedString(forKey: "Email"), text: $username)
                        
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 25).fill(Color.primary.opacity(0.25)))
                
                HStack {
                    TextField(languageManager.localizedString(forKey: "Password"), text: $password)
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
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text(languageManager.localizedString(forKey: "Sign In"))
                    .foregroundColor(.white)
            })
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 30)
            .padding()
            .background(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/).fill(Color.purple))
            .padding()
            
            HStack {
                Text(languageManager.localizedString(forKey: "Don't have an account?"))
                Text(languageManager.localizedString(forKey: "Sign Up"))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

#Preview {
    SignInView()
}
