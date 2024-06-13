//
//  MovieBannerView.swift
//  MovieApp
//
//  Created by BS00880 on 31/5/24.
//

import SwiftUI

//struct MovieBannerView: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}
//
//#Preview {
//    MovieBannerView()
//}

//
//  TabView.swift
//
//  Created by BS1002 on 21/5/24.
//

import Foundation
import SwiftUI

struct MovieBannerView: View {
    var movie: Movie
    var showWatchListButton: Bool
    
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: movie.backgroundImage)) { phase in
                if let img=phase.image {
                    img
                        .resizable()
                        .cornerRadius(20)
                        .frame(width: 400, height: 300, alignment: .center)
                } else {
                    Image("background_dummy_img")
                        .resizable()
                        .cornerRadius(20)
                        .frame(width: 400, height: 300, alignment: .center)
                        .shimmer(.init(tint: .black.opacity(0.3), highlight: .white,blur: 5))
                }
            }
            .overlay {
                VStack {
                    HStack {
                        HStack{
                            Image(systemName: "star.fill")
                                .font(.footnote)
                            Text(String(format: "%.1f", movie.rating))
                                .font(.footnote)
                        }
                        .padding(5.0)
                        .background(Color.white.opacity(0.35))
                        .overlay {
                            RoundedRectangle(cornerRadius: 5).stroke(Color.white, lineWidth: 1.0)
                        }
                        Spacer()
                    
                    }
                    .padding()
                    Spacer()
                    
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("\(movie.title)")
                                .font(.title3)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .lineLimit(1)
                            
                            Text(genresString(from: movie.genres))
                                .lineLimit(1)
                            
                            
                            HStack {
                                if movie.mpaRating == "" {
                                    Text("N/A")
                                        .font(.footnote)
                                        .padding(2.0)
                                        .overlay(RoundedRectangle(cornerRadius: 5)
                                            .stroke(Color.primary, lineWidth: 1))
                                } else {
                                    Text(movie.mpaRating)
                                        .font(.footnote)
                                        .padding(2.0)
                                        .overlay(RoundedRectangle(cornerRadius: 5)
                                            .stroke(Color.primary, lineWidth: 1))
                                }
                                Text(String(movie.year))
                                    .font(.footnote)
                                    .padding(2.0)
                                    .overlay(RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color.primary, lineWidth: 1))
                                
                                Text("\(movie.runtime/60)H \(movie.runtime%60)M")
                                    .font(.footnote)
                                    .padding(2.0)
                                    .overlay(RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color.primary, lineWidth: 1))
                            }
                        }
                        
                        Spacer()
                        if showWatchListButton {
                            WatchListButtonView(movie: movie)
                        }
                    }
                    .padding()
                    .background(Color.white.opacity(0.35))
                    .overlay {
                        RoundedRectangle(cornerRadius: 5).stroke(Color.white)
                    }
                }
            }
        }
    }
    
    
    private func genresString(from genres: [String]) -> String {
        genres.joined(separator: " • ")
    }
}

#Preview {
    MovieBannerView(movie: Movie.movieShowForTest, showWatchListButton: true)
}
