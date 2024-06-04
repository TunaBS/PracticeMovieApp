//
//  SearchView.swift
//  MovieApp
//
//  Created by BS00880 on 30/5/24.
//

import SwiftUI

struct SearchView: View {
    
//    @State private var movies: [Movie] = []
    @State var searchItem = ""
//    @EnvironmentObject var searchViewModel: SearchViewModel
//    @State var searchViewModel = SearchViewModel()
    @State var allMovies: [Movie] = []
    @State var filteredMovies: [Movie] = []
    @State var searchviewModel = SearchViewModel()
    /*private */
    @State var searchItemChanged: DispatchWorkItem?
    var body: some View {
        VStack {
            HStack (alignment: .top){
                Text("Search")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(.bold)
                Spacer()
                Image(systemName: "arrow.up.to.line.compact")
            }
            .padding()
            Spacer()
            HStack {
                Image(systemName: "magnifyingglass")
                    .opacity(0.5)
                TextField("Search...", text: $searchItem)
                    .overlay (
                        Image(systemName: "xmark.circle.fill")
                            .padding()
                            .opacity(searchItem.isEmpty ? 0.0 : 1.0)
                            .onTapGesture {
                                UIApplication.shared.endEditing()
                                searchItem = ""
                            }
                        ,alignment: .trailing
                    )
                    .onChange(of: searchItem) { newString in
//                        let finalString = searchItem + newCharacter
//                        print(newString)
                        self.searchItemChanged?.cancel()
                        
                        // Create a new DispatchWorkItem with a delay
                        let workItem = DispatchWorkItem {
                            // Perform operation after a certain amount of time
                            print("Delayed operation: \(newString)")
                            Task {
                                await searchviewModel.getMovieData(movieName: newString)
                                filteredMovies = searchviewModel.movieDatabase?.data.movies ?? allMovies
                                
//                                movie = vijewModel.movieDetail?.data.movie ?? movie
                            }
                        }
                        // Schedule the DispatchWorkItem after a delay
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: workItem)
                        
                        // Store the new DispatchWorkItem
                        self.searchItemChanged = workItem
                    }
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 25).fill(Color(.gray)))
            .padding()
            VStack {
                ScrollView {
                    ForEach(filteredMovies, id: \.id) { movie in
                        NavigationLink(destination: MovieDetailsView(idMovie: movie.id)){
                            MovieCard(movie: movie, showWatchListButton: true)
                        }
                    }
                }
            }
        }
    }
    
    
//    var body: some View {
//        ScrollView {
//            VStack (alignment: .leading) {
//                HStack {
//                    Text("Search")
//                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
//                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
//                }
////                Spacer()
//                VStack {
//                    ForEach(searchViewModel.isSearching ? searchViewModel.filteredMovies : searchViewModel.allMovies) { movie in
//                        NavigationLink(destination: ContentView()) {
//                                MovieCard(movie: movie, showWatchListButton: true)
//                        }
//                    }
//                }
//                
//            }
//            .padding()
//            
//        }
//        .searchable(text: $searchViewModel.searchText, placement: .automatic, prompt: Text("Search Movies"))
//        .onAppear {
//            Task {
//                await searchViewModel.getMovieData(movieName: searchViewModel.searchText)
////                movie = viewModel.movieDetail?.data.movie ?? movie
//            }
//        }
//        .navigationTitle("Search")
////        .task {
////            await searchViewModel.getMovieData(movieName: searchViewModel.searchText)
////        }
//    }
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
