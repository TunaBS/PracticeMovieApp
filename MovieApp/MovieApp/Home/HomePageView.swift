//
//  HomePageView.swift
//  MovieApp
//
//  Created by BS00880 on 29/5/24.
//

import SwiftUI

struct HomePageView: View {
//    @StateObject var viewModel: NetworkLoaderViewModel = NetworkLoaderViewModel() //changed this
    @State var viewModel = NetworkLoaderViewModel()
    @State private var isLoaded = false
    @ObservedObject var languageManager = LanguageManager.shared
    
    
    var body: some View {
        NavigationStack {
                ScrollView {
                    VStack{
                        
                        HStack {
                            VStack(alignment: .leading){
//                                Text("Welcome Back,")
                                Text(languageManager.localizedString(forKey: "Welcome Back"))
                                    .font(.title2)
                                Text(UserInfo.userShowForTest.userName ?? "No user found")
//                                Text(languageManager.localizedString(forKey: "User Name"))
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
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
//    }
}
