//
//  HomePageView.swift
//  MovieApp
//
//  Created by BS00880 on 29/5/24.
//

import SwiftUI

struct HomePageView: View {
//    @StateObject var viewModel: NetworkLoaderViewModel = NetworkLoaderViewModel() //changed this
//    @State var viewModel = NetworkLoaderViewModel()
    @StateObject var viewModel: NetworkLoaderViewModel = NetworkLoaderViewModel()
    @State private var isLoaded = false
    @ObservedObject var languageManager = LanguageManager.shared
    @EnvironmentObject var signingViewModel: AuthenticationManager

    
    var body: some View {
        NavigationStack {
                ScrollView {
                    VStack{
                        
                        HStack {
                            VStack(alignment: .leading){
//                                Text("Welcome Back,")
                                Text(languageManager.localizedString(forKey: "Welcome Back"))
                                    .font(.title3)
                                Text(signingViewModel.currentUser?.userName ?? "")
//                                Text(languageManager.localizedString(forKey: "User Name"))
                                    .font(.title3)
                                    .fontWeight(.bold)
                            }
                            .padding()
                            Spacer()
                            
                            Image(systemName: "rectangle")
                                .font(.system(size: 20, weight: .bold))
                                .padding()
                        }
                        
                        if isLoaded == true{
                            SlideShowView(movieList: viewModel.movieDatabase? .data.movies ?? Movie.movieArrayShowForTest)
                                    .padding(.bottom)
                            
                            ToppickMovieView(movieList: viewModel.movieDatabase? .data.movies ?? Movie.movieArrayShowForTest)
                                    .padding(.bottom)
                            UpComingMoviesView(movieList: viewModel.movieDatabase? .data.movies ?? Movie.movieArrayShowForTest)
                                    .padding(.top)
                            
                            
                        }
                    }
                    
                }
                .scrollIndicators(.hidden)
            }
            .onAppear {
                Task {
                    await viewModel.getMovieData()
                    isLoaded = true
                }
            }
    }
    
}

#Preview {
//    NavigationView {
        HomePageView()
        .environmentObject(AuthenticationManager())
//    }
}
