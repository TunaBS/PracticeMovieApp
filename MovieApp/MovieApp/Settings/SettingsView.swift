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
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                Text("Settings")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Spacer()
            }
            .padding()
            
            VStack(alignment: .leading) {
                HStack {
                    Text("Language")
                        .font(.title3)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding()
                    Spacer()
                    HStack {
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("Eng")
                        })
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("Ban")
                        })
                    }
                    .padding()
                }
                
                
                HStack {
                    Text("Theme")
                        .font(.title3)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding()
                    
                    Toggle(isOn: $isDarkModeEnabled) {
                        
                    }
                    .padding()
                }
                Spacer()
            }
        }
        .padding()
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
