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
    
    var body: some View {
        NavigationStack {
//            GeometryReader{
                ScrollView {
                    VStack{
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
//            }
            .onAppear {
                Task {
                    await viewModel.getMovieData()
                    isLoaded = true
                }
            }
            
        }
        
        
    }
    
}

#Preview {
//    NavigationView {
        HomePageView()
//    }
}
