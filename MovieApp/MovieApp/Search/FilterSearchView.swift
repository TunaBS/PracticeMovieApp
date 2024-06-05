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
    @State private var selectedSort: SortBy? = nil
    @State private var seletedOrder: OrderBy? = nil
    
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
            
            Text("Genres")
                .font(.title3)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
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
                        
                        if !movieName.isEmpty {
                            if let sortBy = selectedSort?.rawValue, let orderBy = seletedOrder?.rawValue {
                                await searchviewModel.getFilteredMovieData(movieName: movieName, sortBy: sortBy, orderBy: orderBy)
                                filteredMovies = searchviewModel.filteredMovieDatabase?.data.movies ?? allMovies
                            } else {
                                await searchviewModel.getFilteredMovieData(movieName: movieName, sortBy: "", orderBy: "desc") // Default value or handle no selection case
                                filteredMovies = searchviewModel.filteredMovieDatabase?.data.movies ?? allMovies
                            }
                        } else {
                            if let sortBy = selectedSort?.rawValue, let orderBy = seletedOrder?.rawValue {
                                await searchviewModel.getFilteredMovieData(movieName: "", sortBy: sortBy, orderBy: orderBy)
                                filteredMovies = searchviewModel.filteredMovieDatabase?.data.movies ?? allMovies
                            } else {
                                await searchviewModel.getFilteredMovieData(movieName: "", sortBy: "", orderBy: "desc") // Default value or handle no selection case
                                filteredMovies = searchviewModel.filteredMovieDatabase?.data.movies ?? allMovies
                            }
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
