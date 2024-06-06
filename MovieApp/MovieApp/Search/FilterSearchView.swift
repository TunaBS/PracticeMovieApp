//
//  FilterSearchView.swift
//  MovieApp
//
//  Created by BS00880 on 4/6/24.
//

import SwiftUI

struct FilterSearchView: View {
    
    let order: String = "desc"
    @Binding var movieName: String
    @State var searchviewModel = SearchViewModel()
    @Binding var allMovies: [Movie]
    @Binding var filteredMovies: [Movie]
    @State var isFilteredSearchViewPresented: Bool = false
    @State private var selectedGenres: Set<Genre> = []
    @State private var selectedSort: SortBy? = nil
    @State private var seletedOrder: OrderBy? = nil
    @State var holdSort: String = ""
    @State var holdOrder: String = ""
    @State var holdGenre: String = ""
    @Environment(\.dismiss) var dismiss
    @AppStorage("isDarkModeEnabled") var isDarkModeEnabled: Bool = false
    @ObservedObject var languageManager = LanguageManager.shared
    
    var body: some View {
        
        VStack(alignment: .leading){
            Text(languageManager.localizedString(forKey: "Sort and Filter"))
                .font(.title)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            Divider()
            Text(languageManager.localizedString(forKey: "Sort by"))
                .font(.title3)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            HStack {
                ForEach(SortBy.allCases, id: \.self){ sortBy in
                    Text(sortBy.rawValue)
                        .padding(5)
                        .overlay(RoundedRectangle(cornerRadius: 15.0).stroke((self.selectedSort == sortBy ? Color.blue : Color.primary)))
                        .foregroundColor(self.selectedSort == sortBy ? Color.blue : Color.primary)
                        .onTapGesture {
                            self.selectedSort = sortBy
                        }
                }
            }
            Divider()
            
            Text(languageManager.localizedString(forKey: "Genres"))
                .font(.title3)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            
//            GenreSelectionView(selectedGenres: $selectedGenres)
            ListPlacingView(selectedGenres: $selectedGenres, genres: Genre.allCases, columns: 4)
      
            Divider()
            
            Text(languageManager.localizedString(forKey: "Order By"))
                .font(.title3)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            HStack {
                ForEach(OrderBy.allCases, id: \.self){ orderBy in
                    Text(orderBy.rawValue)
                        .padding(5)
                        .overlay(RoundedRectangle(cornerRadius: 15.0).stroke((self.seletedOrder == orderBy ? Color.blue : Color.primary)))
                        .foregroundColor(self.seletedOrder == orderBy ? Color.blue : Color.primary)
                        .onTapGesture {
                            self.seletedOrder = orderBy
                        }
                }
            }
            
            HStack {
                Spacer()
                Button(action: {
                    Task {
                        if let sortBy = selectedSort?.rawValue {
                            holdSort = sortBy
                        }
                        if let orderBy = seletedOrder?.rawValue {
                            holdOrder = orderBy
                        }
                        if !movieName.isEmpty {
                            await searchviewModel.getFilteredMovieData(movieName: movieName, sortBy: holdSort, orderBy: holdOrder)
                            filteredMovies = searchviewModel.filteredMovieDatabase?.data.movies ?? allMovies
                            print(filteredMovies.count)
                            filteredMovies = searchviewModel.filterMoviesByGenres(genres: selectedGenres, movieArray: filteredMovies)
                            print(filteredMovies.count)
                            
                        } else {
                            await searchviewModel.getFilteredMovieData(movieName: "", sortBy: holdSort, orderBy: holdOrder)
                            filteredMovies = searchviewModel.filteredMovieDatabase?.data.movies ?? allMovies
                            print(filteredMovies.count)
                            filteredMovies = searchviewModel.filterMoviesByGenres(genres: selectedGenres, movieArray: filteredMovies)
                            print(filteredMovies.count)
                        }
                    }
                    
                    dismiss.callAsFunction()
                }, label: {
                    Text(languageManager.localizedString(forKey: "Apply"))
                        .padding()
                        .foregroundColor(.white)
                        .background(Color(.purple))
                        .clipShape(RoundedRectangle(cornerRadius: 20.0))
                })
                .padding()
            }
            
            
            
        }
        .padding()
        .preferredColorScheme(isDarkModeEnabled ? .dark : .light)
    }
}

#Preview {
    FilterSearchView(movieName: .constant("hello"), allMovies: .constant(Movie.movieArrayShowForTest), filteredMovies: .constant(Movie.movieArrayShowForTest))
}
