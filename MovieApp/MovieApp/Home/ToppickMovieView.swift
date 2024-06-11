//
//  ToppickMovieView.swift
//  MovieApp
//
//  Created by BS00880 on 29/5/24.
//

import SwiftUI

struct ToppickMovieView: View {
    @ObservedObject var languageManager = LanguageManager.shared
    
    
    let movieList: [Movie]
    var body: some View {
        NavigationStack {
            VStack{
                HStack{
                    Text(languageManager.localizedString(forKey: "Top Movie Picks"))
                        .font(.title2)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Spacer()
                    NavigationLink(destination: MovieListView()) {
                        Text(languageManager.localizedString(forKey: "See all"))
                            .foregroundColor(.primary)
                    }
                }
                
                ScrollView(.horizontal) {
                    HStack {
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
