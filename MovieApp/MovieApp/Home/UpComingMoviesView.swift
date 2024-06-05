//
//  UpComingMoviesView.swift
//  MovieApp
//
//  Created by BS00880 on 29/5/24.
//

import SwiftUI

struct UpComingMoviesView: View {
    
    let movieList: [Movie]
    var body: some View {
        VStack{
            HStack{
                Text("Upcoming Movies")
                    .font(.title)
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

#Preview {
    UpComingMoviesView(movieList: Movie.movieArrayShowForTest)
}
