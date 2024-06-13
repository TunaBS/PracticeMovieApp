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
                                .shimmer(.init(tint: .black.opacity(0.3), highlight: .white,blur: 5))
                        }
                    }
                    VStack(alignment: .leading) {
                        Text(genresString(from: movie.genres))
                            .foregroundColor(.primary)
                            .font(.footnote)
                            .multilineTextAlignment(.leading)
                        
                        Text(movie.title)
                            .foregroundColor(.primary)
                            .font(.headline)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .multilineTextAlignment(.leading)
                        
                        
                        HStack{
                            if movie.mpaRating == "" {
                                Text("N/A")
                                    .foregroundColor(.primary)
                                    .font(.footnote)
                                    .padding(2.0)
                                    .overlay(RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color.primary, lineWidth: 1))
                            } else {
                                Text(movie.mpaRating)
                                    .foregroundColor(.primary)
                                    .font(.footnote)
                                    .padding(2.0)
                                    .overlay(RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color.primary, lineWidth: 1))
                            }
                            Text(String(movie.year))
                                .foregroundColor(.primary)
                                .font(.footnote)
                                .padding(2.0)
                                .overlay(RoundedRectangle(cornerRadius: 5.0).stroke(Color.primary, lineWidth: 1))
                            Text("\(movie.runtime/60)H \(movie.runtime%60)M")
                                .foregroundColor(.primary)
                                .font(.footnote)
                                .padding(2.0)
                                .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.primary, lineWidth: 1))
                        }
                        HStack {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                                .font(.footnote)
                            Text(String(format: "%.1f", movie.rating))
                                .foregroundColor(.primary)
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
