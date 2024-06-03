//
//  MovieCard.swift
//  MovieApp
//
//  Created by BS00880 on 30/5/24.
//

import SwiftUI

struct MovieCard: View {
    var movie: Movie
    var showWatchListButton: Bool
//    @Binding var isButtonPressed: Bool
    
    var body: some View {
        VStack {
            GroupBox {
                HStack{
                    AsyncImage(url: URL(string: movie.largeCoverImage)) { phase in
                        if let img=phase.image {
                            img
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(20)
                                .frame(maxWidth: 80)
                        } else {
                            Image("background_dummy_img")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(20)
                                .frame(maxWidth: 80)
                        }
                    }
                    VStack(alignment: .leading) {
                        Text(genresString(from: movie.genres))
                            .foregroundStyle(.white)
                        
                        Text(movie.title)
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundStyle(.white)
                        
                        HStack{
                            if movie.mpaRating == "" {
                                Text("N/A")
                                    .foregroundStyle(.white)
                                    .padding(2.0)
                                    .overlay(RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color.white, lineWidth: 1))
                            } else {
                                Text(movie.mpaRating)
                                    .foregroundStyle(.white)
                                    .padding(2.0)
                                    .overlay(RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color.white, lineWidth: 1))
                            }
                            Text(String(movie.year))
                                .foregroundStyle(.white)
                                .padding(2.0)
                                .overlay(RoundedRectangle(cornerRadius: 5.0).stroke(Color.white, lineWidth: 1))
                            Text("\(movie.runtime/60)H \(movie.runtime%60)M")
                                .foregroundStyle(.white)
                                .padding(2.0)
                                .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.white, lineWidth: 1))
                        }
                        HStack {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                            Text(String(format: "%.1f", movie.rating))
                                .foregroundStyle(.white)
                            Spacer()
                            
                            if showWatchListButton {
                                WatchListButtonView(movie: movie)
                            }
//                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
//                                Text("Add to Watchlist")
//                            })
//                            .padding(5.0)
//                            .foregroundColor(.white)
//                            .background(.purple)
//                            .cornerRadius(10)
                        }
                        .padding(.top)
                    }
                    Spacer()
                }
                .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
            }
            
        }
    }
    
    private func genresString(from genres: [String]) -> String {
        genres.joined(separator: " • ")
    }
}

#Preview {
    MovieCard(movie: Movie.movieShowForTest, showWatchListButton: true)
}
