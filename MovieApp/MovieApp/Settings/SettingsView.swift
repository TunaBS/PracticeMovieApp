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
                VStack (alignment: .leading) {
                    Text(UserInfo.userShowForTest.userName ?? "No User found")
                        .fontWeight(.bold)
                    Text(UserInfo.userShowForTest.email ?? "no email found")
                }
            }
            
            Section("General") {
                HStack {
//                    Text("Language")
                    Text(languageManager.localizedString(forKey: "Language"))
                        .font(.title3)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding()
                    Spacer()
                    HStack {
                        Button(action: {
                            languageManager.setLanguage(.english)
                        }) {
                            Text(languageManager.localizedString(forKey: "Eng"))
                        }
                        Button(action: {
                            languageManager.setLanguage(.bengali)
                        }) {
                            Text(languageManager.localizedString(forKey: "Ban"))
                        }
                    }
                    .padding()
                }
                HStack {
//                    Text("Theme")
                    Text(languageManager.localizedString(forKey: "Dark Theme"))
                        .font(.title3)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding()
                    
                    Toggle(isOn: $isDarkModeEnabled) {
                        
                    }
                }
            }
            
            Section("User Profile") {
                HStack {
                    Image(systemName: "xmark.circle.fill")
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
            SettingsView()
                .environment(\.locale, Locale.init(identifier: "bn"))
        }
    }
}
