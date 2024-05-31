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
    
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: movie.backgroundImage)) { phase in
                if let img=phase.image {
                    img
                        .resizable()
//                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(20)
                        .frame(width: 400, height: 300, alignment: .center)
                } else {
                    Image("background_dummy_img")
                        .resizable()
//                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(20)
                        .frame(width: 400, height: 300, alignment: .center)
//                        .frame(maxWidth: .infinity, alignment: .center)
                }
            }
            .overlay {
                VStack {
                    HStack {
                        HStack{
                            Image(systemName: "star.fill")
                                .foregroundColor(.white)
                                .font(.footnote)
                            Text(String(format: "%.1f", movie.rating))
                                .foregroundColor(.white)
                                .font(.footnote)
                        }
                        .padding(5.0)
                        .background(Color.white.opacity(0.25))
                        .overlay {
                            RoundedRectangle(cornerRadius: 5).stroke(Color(.white), lineWidth: 1.0)
                        }
                        Spacer()
                    
                    }
                    .padding()
                    Spacer()
                    
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("\(movie.title)")
                                .foregroundColor(.white)
                                .font(.title3)
                                .lineLimit(1)
                            
                            Text(genresString(from: movie.genres))
                                .foregroundStyle(.white)
                                .lineLimit(1)
                            
                            
                            HStack {
                                if movie.mpaRating == "" {
                                    Text("N/A")
                                        .foregroundStyle(.white)
                                        .font(.footnote)
                                        .padding(2.0)
                                        .overlay(RoundedRectangle(cornerRadius: 5)
                                            .stroke(Color.white, lineWidth: 1))
                                } else {
                                    Text(movie.mpaRating)
                                        .foregroundStyle(.white)
                                        .font(.footnote)
                                        .padding(2.0)
                                        .overlay(RoundedRectangle(cornerRadius: 5)
                                            .stroke(Color.white, lineWidth: 1))
                                }
                                Text(String(movie.year))
                                    .foregroundStyle(.white)
                                    .font(.footnote)
                                    .padding(2.0)
                                    .overlay(RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color.white, lineWidth: 1))
                                
                                Text("\(movie.runtime/60)H \(movie.runtime%60)M")
                                    .foregroundStyle(.white)
                                    .font(.footnote)
                                    .padding(2.0)
                                    .overlay(RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color.white, lineWidth: 1))
                            }
//                            .padding(.bottom)
                        }
                        
                        Spacer()
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("Add to Watchlist")
//                                .font(.footnote)
                        })
                        .padding(5.0)
                        .foregroundColor(.white)
                        .background(.purple)
                        .cornerRadius(10)
                    }
                    .padding()
                    .background(Color.white.opacity(0.25))
                    .overlay {
                        RoundedRectangle(cornerRadius: 5).stroke(Color(.white))
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
    MovieBannerView(movie: Movie.movieShowForTest)
}
