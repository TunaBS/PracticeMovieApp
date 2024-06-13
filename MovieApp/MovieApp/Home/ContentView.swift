//
//  ContentView.swift
//  MovieApp
//
//  Created by BS00880 on 17/5/24.
//

import SwiftUI



//struct MovieData: Codable{
//    struct Movie: Codable, Identifiable{
//        let id: Int
//        let title: String
//    //    let rating: Float
//    //    let runtime: Float
//    }
//    struct Data: Codable {
//        let movies: [Movie]
//    }
//    let status: String
//    let statusMessage: String
//    let data: Data
//    
//}

struct ContentView: View {
    
//    @StateObject var viewModel: NetworkLoaderViewModel = NetworkLoaderViewModel()
    @EnvironmentObject var signingViewModel: AuthenticationManager
    @AppStorage("isDarkModeEnabled") var isDarkModeEnabled: Bool = false
    
    var body: some View {
        Group {
            if signingViewModel.userFirebaseSession != nil {
                TabViewBelow()
                    .environmentObject(signingViewModel)
            } else {
                SignInView()
            }
        }
        
        .preferredColorScheme(isDarkModeEnabled ? .dark: .light)
    }//end of body
}

#Preview {
    ContentView()
        .environmentObject(AuthenticationManager())
}
