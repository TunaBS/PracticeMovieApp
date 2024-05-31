//
//  TabViewBelow.swift
//  MovieApp
//
//  Created by BS00880 on 30/5/24.
//

import SwiftUI

struct TabViewBelow: View {
//    @State var movieListArray = Movie.movieArrayShowForTest
//    @StateObject var viewModel: NetworkLoaderViewModel = NetworkLoaderViewModel()
    @State private var isLoaded = false
    var body: some View {
        TabView {
            HomePageView()
                .tabItem {
                    Image(systemName: "house")
                }
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
            MovieListView()
                .tabItem {
                    Image(systemName: "list.bullet")
                }
            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                }
        }
    }
}

#Preview {
    TabViewBelow()
}
