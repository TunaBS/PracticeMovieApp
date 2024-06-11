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
    @AppStorage("hasCompletedOnboarding") var hasCompletedOnboarding: Bool = false
//    @EnvironmentObject var signingViewModel: AuthenticationManager
//    @StateObject var signingViewModel = AuthenticationManager()
    @StateObject var signingViewModel = AuthenticationManager()

    init() {
        FirebaseApp.configure()
        print("Firebase configured")
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
                    .environmentObject(signingViewModel)
//                if hasCompletedOnboarding {
//                    ContentView()
//                        .environmentObject(signingViewModel)
//                    TabViewBelow()
//                        .preferredColorScheme(isDarkModeEnabled ? .dark : .light)
//                        .environmentObject(WatchListViewModel())
//                        .environmentObject(NetworkLoaderViewModel())
//                        .environmentObject(AuthenticationManager())
//                } else {
//                    LaunchScreenView(hasCompletedOnboarding: $hasCompletedOnboarding)
//                        .preferredColorScheme(isDarkModeEnabled ? .dark : .light)
//                        .environmentObject(WatchListViewModel())
//                        .environmentObject(NetworkLoaderViewModel())
//                        .environmentObject(AuthenticationManager())
//                }
//                TabViewBelow()
////                LaunchScreenView()
//                    .preferredColorScheme(isDarkModeEnabled ? .dark : .light)
//                    .environmentObject(WatchListViewModel())
//                    .environmentObject(NetworkLoaderViewModel())
//                    .environmentObject(AuthenticationManager())
            }
//            .environmentObject(watchListViewModel)
        }
    }
}
