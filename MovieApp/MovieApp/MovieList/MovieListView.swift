//
//  MovieListView.swift
//  MovieApp
//
//  Created by BS00880 on 30/5/24.
//

import SwiftUI

struct MovieListView: View {
    let movieList: [Movie]
    @State private var isLoaded = false
    @State private var viewModel = NetworkLoaderViewModel()
    var body: some View {
        NavigationStack {
            ScrollView {
                if isLoaded == true {
                    VStack(alignment: .leading) {
                        ForEach(movieList, id: \.id) { movie in
                            NavigationLink(destination: MovieDetailsView(idMovie: movie.id)) {
                                MovieCard(movie: movie)
                            }
                            .padding(.bottom)
                        }
                    }
                }
                
            }
            .navigationTitle("Movie Lists")
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
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
    MovieListView(movieList: Movie.movieArrayShowForTest)
}
