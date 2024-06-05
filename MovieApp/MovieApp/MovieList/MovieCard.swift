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
                            .font(.footnote)
                            .multilineTextAlignment(.leading)
                        
                        Text(movie.title)
                            .font(.title3)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .multilineTextAlignment(.leading)
                        
                        
                        HStack{
                            if movie.mpaRating == "" {
                                Text("N/A")
                                    .font(.footnote)
                                    .padding(2.0)
                                    .overlay(RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color.white, lineWidth: 1))
                            } else {
                                Text(movie.mpaRating)
                                    .font(.footnote)
                                    .padding(2.0)
                                    .overlay(RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color.white, lineWidth: 1))
                            }
                            Text(String(movie.year))
                                .font(.footnote)
                                .padding(2.0)
                                .overlay(RoundedRectangle(cornerRadius: 5.0).stroke(Color.white, lineWidth: 1))
                            Text("\(movie.runtime/60)H \(movie.runtime%60)M")
                                .font(.footnote)
                                .padding(2.0)
                                .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.white, lineWidth: 1))
                        }
                        HStack {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                                .font(.footnote)
                            Text(String(format: "%.1f", movie.rating))
                                .font(.footnote)
                            Spacer()
                            
                            if showWatchListButton {
                                WatchListButtonView(movie: movie)
                            }
                        }
                        .padding(.top)
                    }
                    Spacer()
                }
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
