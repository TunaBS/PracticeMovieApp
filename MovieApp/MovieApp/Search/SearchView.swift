//
//  SearchView.swift
//  MovieApp
//
//  Created by BS00880 on 30/5/24.
//

import SwiftUI

struct SearchView: View {
    
//    @State private var movies: [Movie] = []
//    @State private var searchItem = ""
//    @EnvironmentObject var searchViewModel: SearchViewModel
    @StateObject private var searchViewModel = SearchViewModel()
    
    
    
    var body: some View {
        ScrollView {
            VStack (alignment: .leading) {
                HStack {
                    Text("Search")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }
                Spacer()
                ForEach(searchViewModel.isSearching ? searchViewModel.filteredMovies : searchViewModel.allMovies) { movie in
                    NavigationLink(destination: ContentView()) {
                            MovieCard(movie: movie, showWatchListButton: true)
                    }
                }
            }
            .padding()
            
        }
        .searchable(text: $searchViewModel.searchText, placement: .automatic, prompt: Text("Search Movies"))
        .onAppear {
            Task {
                await searchViewModel.getMovieData(movieName: searchViewModel.searchText)
//                movie = viewModel.movieDetail?.data.movie ?? movie
            }
        }
        .navigationTitle("Search")
//        .task {
//            await searchViewModel.getMovieData(movieName: searchViewModel.searchText)
//        }
    }
}

//#Preview {
//    SearchView()
//}


struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            SearchView()
        }
//        .environmentObject(SearchViewModel())
    }
}
