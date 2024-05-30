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
        VStack(spacing: 2){
            HStack{
                Text("Top Movie Picks")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Spacer()
                NavigationLink(destination: MovieListView(movieList: movieList)) {
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
        
    }
}

#Preview {
    ToppickMovieView(movieList: Movie.movieArrayShowForTest)
}
