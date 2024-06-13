//
//  TabViewBelow.swift
//  MovieApp
//
//  Created by BS00880 on 30/5/24.
//

import SwiftUI

struct TabViewBelow: View {
//    @State var movieListArray = Movie.movieArrayShowForTest
    @StateObject var viewModel: NetworkLoaderViewModel = NetworkLoaderViewModel()
    @StateObject var watchListViewModel: WatchListViewModel = WatchListViewModel()
//    @StateObject var searchListMovie: SearchViewModel = SearchViewModel()
    @EnvironmentObject var signingViewModel: AuthenticationManager
    
    init(){
            let tabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithOpaqueBackground()
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
            // correct the transparency bug for Navigation bars
            let navigationBarAppearance = UINavigationBarAppearance()
            navigationBarAppearance.configureWithOpaqueBackground()
            UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
        }
    
    @State private var isLoaded = false
    var body: some View {
        NavigationStack{
            TabView {
                HomePageView()
                    .tabItem {
                        Image(systemName: "house")
                    }
                SearchView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                    }
                WatchListView()
                    .tabItem {
                        Image(systemName: "list.bullet")
                    }
                SettingsView()
                    .tabItem {
                        Image(systemName: "gear")
                    }
            }
        }
        .environmentObject(viewModel)
        .environmentObject(watchListViewModel)
        .environmentObject(signingViewModel)
    }
}

//#Preview {
//        TabViewBelow()
//    
//}
   
struct TabViewBelow_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            TabViewBelow()
        }
        .environmentObject(NetworkLoaderViewModel())
        .environmentObject(WatchListViewModel())
//        .environmentObject(AuthenticationManager())
    }
}
