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
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(20)
                        .frame(maxWidth: .infinity, alignment: .center)
                } else {
                    Image("background_dummy_img")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(20)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
            }
            .overlay {
                VStack {
                    HStack {
                        HStack{
                            Image(systemName: "star.fill")
                                .foregroundColor(.white)
                            Text(String(format: "%.1f", movie.rating))
                                .foregroundColor(.white)
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
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            
                            HStack{
                                ForEach(movie.genres, id: \.self) {genre in
                                    Text("\(genre)")
                                        .foregroundColor(.white)
                                    
                                    if genre != movie.genres.last {
                                        Circle().frame(width: 3, height: 3).colorInvert()
                                    }
                                }
                            }
                            
                            HStack {
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
                                    .overlay(RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color.white, lineWidth: 1))
                                
                                Text("\(movie.runtime/60)H \(movie.runtime%60)M")
                                    .foregroundStyle(.white)
                                    .padding(2.0)
                                    .overlay(RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color.white, lineWidth: 1))
                            }
                            .padding(.bottom)
                        }
                        Spacer()
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("Add to Watchlist")
                        })
                        .padding(5.0)
                        .foregroundColor(.white)
                        .background(.purple)
                        .cornerRadius(10)
                    }
                    .padding()
                }
                
                
                
            }
        
            
            
        }
        
        
    }
}

#Preview {
    MovieBannerView(movie: Movie.movieShowForTest)
}
