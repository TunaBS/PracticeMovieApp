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
    @State private var selectedGenres: Set<Genre> = []
    @State var isFilteredSearchViewPresented: Bool = false
    @State var searchItemChanged: DispatchWorkItem?
    @ObservedObject var languageManager = LanguageManager.shared
    
    var body: some View {
        VStack {
            HStack (alignment: .top){
                Text(languageManager.localizedString(forKey: "Search"))
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(.bold)
                Spacer()
                
                Button(action: {
                    isFilteredSearchViewPresented.toggle()
                }) {
                    Image(systemName: "slider.vertical.3")
                }
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
                        
                        let workItem = DispatchWorkItem {
                            if !newString.isEmpty {
                                print("Delayed operation: \(newString)")
                                Task {
//                                    await searchviewModel.getSearchedMovieData(movieName: newString)
//                                    await searchviewModel.getFilteredMovieData(movieName: newString, sortBy: "", orderBy: ""/*, genre: ""*/)
                                    await searchviewModel.getFilteredMovieData(movieName: newString, sortBy: "", orderBy: "")
                                    filteredMovies = searchviewModel.filteredMovieDatabase?.data.movies ?? allMovies
                                }
                            } else {
                                filteredMovies=allMovies
                            }
                            
//                            if !newString.isEmpty {
//                                print("Delayed operation: \(newString)")
//                                Task {
//                                    await searchviewModel.getMovieData(movieName: newString)
//                                    searchviewModel.filteredMovies = searchviewModel.movieDatabase?.data.movies ?? searchviewModel.allMovies
//                                }
//                            } else {
//                                searchviewModel.filteredMovies=searchviewModel.allMovies
//                            }
                        }
                        // Schedule the DispatchWorkItem after a delay
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: workItem)
                        
                        // Store the new DispatchWorkItem
                        self.searchItemChanged = workItem
                    }
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 25).fill(Color.primary.opacity(0.25)))
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
            .sheet(isPresented: $isFilteredSearchViewPresented) {
                FilterSearchView(movieName: $searchItem, allMovies: $allMovies, filteredMovies: $filteredMovies)
            }
        }
    }
    
}



struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            SearchView()
        }
    }
}
