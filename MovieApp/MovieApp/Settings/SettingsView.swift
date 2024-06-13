//
//  SettingsView.swift
//  MovieApp
//
//  Created by BS00880 on 30/5/24.
//

import SwiftUI

struct SettingsView: View {
    @State private var isToggled = false
    @AppStorage("isDarkModeEnabled") var isDarkModeEnabled: Bool = false
    @ObservedObject var languageManager = LanguageManager.shared
    @EnvironmentObject var signingViewModel: AuthenticationManager
    
    var body: some View {
        List {
//            HStack {
////                Text("Settings")
//                Text(languageManager.localizedString(forKey: "Settings"))
//                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
//                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
//                Spacer()
//            }
//            .padding()
            
            Section {
                HStack {
                    Image(systemName: "person.circle")
                        .font(.largeTitle)
                    VStack (alignment: .leading) {
                        Text(signingViewModel.currentUser?.userName ?? "")
                            .fontWeight(.bold)
                        Text(signingViewModel.currentUser?.email ?? "")
                    }
                }
            }
            
            Section(languageManager.localizedString(forKey: "General")) {
                VStack {
                    Text(languageManager.localizedString(forKey: "Language"))
                        .font(.title3)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }
                VStack {
                    Button(action: {
                        languageManager.setLanguage(.english)
                        print("English has been clicked")
                    }) {
                        Text(languageManager.localizedString(forKey: "Eng"))
                    }
//                    .background(RoundedRectangle(cornerRadius: 20).fill(Color.green))
                    
                }
                VStack{
                    Button(action: {
                        languageManager.setLanguage(.bengali)
                        print("Bengali has been clicked")
                    }) {
                        Text(languageManager.localizedString(forKey: "Ban"))

                    }
//                    .background(RoundedRectangle(cornerRadius: 20).fill(Color.red))
                }
                
                HStack {
                    Text(languageManager.localizedString(forKey: "Dark Theme"))
                        .font(.title3)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
//                    .padding()
                    
                    Toggle(isOn: $isDarkModeEnabled) {
                        
                    }
                }
            }
            
            Section(languageManager.localizedString(forKey: "User Profile")) {
                HStack {
                    Image(systemName: "rectangle.portrait.and.arrow.right")
                        .foregroundColor(.red)
                    
                    Button(action: {
                        Task {
                            try await signingViewModel.signOut()
                        }
                    }, label: {
                        Text(languageManager.localizedString(forKey: "Sign Out"))
                            .font(.title3)
                            .foregroundColor(.primary)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    })
                    
                }
                
//                Spacer()
                
                HStack {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.red)
                    Button(action: {
                        Task {
                            try await signingViewModel.deleteAccount()
                        }
                    }, label: {
                        Text(languageManager.localizedString(forKey: "Delete Account"))
                            .font(.title3)
                            .foregroundColor(.primary)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    })
                }
                
//                Button(action: {
//                    languageManager.setLanguage(.bengali)
//                    print("Bengali has been clicked")
//                }) {
//                    Text(languageManager.localizedString(forKey: "Ban"))
//                        .padding()
//                }
//                .background(RoundedRectangle(cornerRadius: 20).fill(Color.red))
            }
        }
    }
}

//#Preview {
//    SettingsView()
//}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SettingsView()
                .environment(\.locale, Locale.init(identifier: "en"))
                .environmentObject(AuthenticationManager())
            SettingsView()
                .environment(\.locale, Locale.init(identifier: "bn"))
                .environmentObject(AuthenticationManager())
        }
    }
}
