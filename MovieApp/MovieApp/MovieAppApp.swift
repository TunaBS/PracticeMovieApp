//
//  MovieAppApp.swift
//  MovieApp
//
//  Created by BS00880 on 17/5/24.
//

import SwiftUI
import Firebase

@main
struct MovieAppApp: App {
//    @StateObject var viewModel: NetworkLoaderViewModel = NetworkLoaderViewModel()
//    @StateObject var watchListViewModel: WatchListViewModel = WatchListViewModel()
    @AppStorage("isDarkModeEnabled") var isDarkModeEnabled: Bool = false
    
    init() {
        FirebaseApp.configure()
        print("Firebase configured")
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
//                TabViewBelow()
                LaunchScreenView()
                    .preferredColorScheme(isDarkModeEnabled ? .dark : .light)
            }
//            .environmentObject(watchListViewModel)
        }
    }
}
