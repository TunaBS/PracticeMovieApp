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
        VStack(spacing: 2){
            HStack{
                Text("Upcoming Movies")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("See all")
                })
                .foregroundColor(.white)
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
    UpComingMoviesView(movieList: Movie.movieArrayShowForTest)
}
