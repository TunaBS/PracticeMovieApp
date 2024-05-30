//
//  HomePageView.swift
//  MovieApp
//
//  Created by BS00880 on 29/5/24.
//

import SwiftUI

struct HomePageView: View {
    @State var viewModel = NetworkLoaderViewModel()
    @State private var isLoaded = false
    
    var body: some View {
        NavigationStack {
//            ZStack{
                ScrollView {
                    VStack{
                        if isLoaded == true{
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
    HomePageView()
}
