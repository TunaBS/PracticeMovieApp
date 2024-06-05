//
//  FilterSearchView.swift
//  MovieApp
//
//  Created by BS00880 on 4/6/24.
//

import SwiftUI

struct FilterSearchView: View {
    
//    let allSortByValues = SortBy.allCases
    let order: String = "desc"
//    let movieName: String = "Saltwater"
    @Binding var movieName: String
    @State var searchviewModel = SearchViewModel()
    @Binding var allMovies: [Movie]
    @Binding var filteredMovies: [Movie]
    @State var isFilteredSearchViewPresented: Bool = false
    @State private var selectedGenre: Genre? = nil
//    @State private var genres: [Genre]? = nil
    @State private var selectedSort: SortBy? = nil
    @State private var seletedOrder: OrderBy? = nil
    var columnsCount: Int = 4
    var rowsCount: Int = 3/*(Genre.allCases.count + columnsCount - 1) / columnsCount*/
    @State var holdSort: String = ""
    @State var holdOrder: String = ""
    @State var holdGenre: String = ""
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Sort and Filter")
                .font(.title)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            Divider()
            Text("Sort by")
                .font(.title3)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            HStack {
                ForEach(SortBy.allCases, id: \.self){ sortBy in
                    Text(sortBy.rawValue)
                        .padding(5)
                        .overlay(RoundedRectangle(cornerRadius: 15.0).stroke((self.selectedSort == sortBy ? Color.blue : Color.white)))
                        .foregroundColor(self.selectedSort == sortBy ? Color.blue : Color.white)
                        .onTapGesture {
                            self.selectedSort = sortBy
                        }
                }
            }
            Divider()
            
            VStack{
                Text("Genres")
                    .font(.title3)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            }
            
            
            HStack {
                ForEach(Genre.allCases, id: \.self){ genre in
                    Text(genre.rawValue)
                        .padding(5)
                        .overlay(RoundedRectangle(cornerRadius: 15.0).stroke((self.selectedGenre == genre ? Color.blue : Color.white)))
                        .foregroundColor(self.selectedGenre == genre ? Color.blue : Color.white)
                        .onTapGesture {
                            self.selectedGenre = genre
                        }
                }
            }
            Divider()
            
            Text("Order By")
                .font(.title3)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            HStack {
                ForEach(OrderBy.allCases, id: \.self){ orderBy in
                    Text(orderBy.rawValue)
                        .padding(5)
                        .overlay(RoundedRectangle(cornerRadius: 15.0).stroke((self.seletedOrder == orderBy ? Color.blue : Color.white)))
                        .foregroundColor(self.seletedOrder == orderBy ? Color.blue : Color.white)
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
                        if let genreBy = selectedGenre?.rawValue {
                            holdGenre = genreBy
                        }
                        
                        if !movieName.isEmpty {
                            await searchviewModel.getFilteredMovieData(movieName: movieName, sortBy: holdSort, orderBy: holdOrder, genre: holdGenre)
                            filteredMovies = searchviewModel.filteredMovieDatabase?.data.movies ?? allMovies
                            
                        } else {
                            await searchviewModel.getFilteredMovieData(movieName: "", sortBy: holdSort, orderBy: holdOrder, genre: holdGenre)
                            filteredMovies = searchviewModel.filteredMovieDatabase?.data.movies ?? allMovies
                        }
                    }
                    
                    
                }, label: {
                    Text("Apply")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color(.purple))
                        .clipShape(RoundedRectangle(cornerRadius: 20.0))
                })
                .padding()
            }
            
            
            
        }
        .frame(width: 300, height: 500)
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    FilterSearchView(movieName: .constant("hello"), allMovies: .constant(Movie.movieArrayShowForTest), filteredMovies: .constant(Movie.movieArrayShowForTest))
}
