//
//  ToppickMovieView.swift
//  MovieApp
//
//  Created by BS00880 on 29/5/24.
//

import SwiftUI

struct ToppickMovieView: View {
    
    let movieList: [Movie]
    var body: some View {
        NavigationStack {
            VStack{
                HStack{
                    Text("Top Movie Picks")
                        .font(.title2)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Spacer()
                    NavigationLink(destination: MovieListView()) {
                        Text("See all")
                            .foregroundColor(.white)
                    }
                }
                .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
                
                ScrollView(.horizontal) {
                    HStack(spacing: 15) {
                        ForEach(movieList, id: \.id) { movie in
                            NavigationLink(destination: MovieDetailsView(idMovie: movie.id)) {
                                MoviePoster(movie: movie)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                }
                
            }
            .padding()
        }
        
    }
}

#Preview {
    ToppickMovieView(movieList: Movie.movieArrayShowForTest)
}
