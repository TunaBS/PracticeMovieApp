//
//  MovieCard.swift
//  MovieApp
//
//  Created by BS00880 on 30/5/24.
//

import SwiftUI

struct MovieCard: View {
    var movie: Movie
    
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
//                                        .padding(.horizontal)
                        
                        Text(movie.title)
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        
                        HStack{
                            if movie.mpaRating != "" {
                                Text("PG")
                                    .padding(2.0)
                                    .overlay(RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color.white, lineWidth: 1))
                            } else {
                                Text(movie.mpaRating)
                                    .padding(2.0)
                                    .overlay(RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color.white, lineWidth: 1))
                            }
                            Text(String(movie.year))
                                .padding(2.0)
                                .overlay(RoundedRectangle(cornerRadius: 5.0).stroke(Color.white, lineWidth: 1))
                            Text("\(movie.runtime/60)H \(movie.runtime%60)M")
                                .padding(2.0)
                                .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.white, lineWidth: 1))
                        }
                        HStack {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                            Text(String(format: "%.1f", movie.rating))
                            Spacer()
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                Text("Add to Watchlist")
                            })
                            .padding(5.0)
                            .foregroundColor(.white)
                            .background(.purple)
                            .cornerRadius(10)
                        }
                        .padding(.top)
                    }
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
    MovieCard(movie: Movie.movieShowForTest)
}
