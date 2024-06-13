//
//  MovieListView.swift
//  MovieApp
//
//  Created by BS00880 on 30/5/24.
//

import SwiftUI

struct MovieListView: View {
//    let movieList: [Movie]
    @State private var isLoaded = false
//    @State private var viewModel = NetworkLoaderViewModel()
    @EnvironmentObject var viewModel: NetworkLoaderViewModel
    var body: some View {
        NavigationStack {
            ScrollView {
                if isLoaded == true {
                    VStack(alignment: .leading) {
                        ForEach(viewModel.movieDatabase?.data.movies ?? Movie.movieArrayShowForTest, id: \.id) { movie in
                            NavigationLink(destination: MovieDetailsView(idMovie: movie.id)) {
                                MovieCard(movie: movie, showWatchListButton: true)
                            }
                            .padding(.bottom)
                        }
                    }
                }
                
            }
            .navigationTitle("Movie Lists")
            .onAppear {
                Task {
                    await viewModel.getMovieData()
                    isLoaded = true
                }
            }
        }
    }
}

//#Preview {
//    MovieListView()
//}

struct MovieView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            MovieListView()
        }
        .environmentObject(NetworkLoaderViewModel())
    }
}
