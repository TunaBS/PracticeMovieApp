//
//  MovieDetailsView.swift
//  MovieApp
//
//  Created by BS00880 on 29/5/24.
//

import SwiftUI

struct MovieDetailsView: View {
    
    let movieId: Int
    @State var movie = Movie.movieShowForTest
    @State var viewModel = NetworkLoaderViewModel()
    @State private var isLoaded = false
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                ScrollView(.vertical) {
                    AsyncImage(url: URL(string: movie.largeCoverImage)) {phase in
                        if let image = phase.image {
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 200, height: 100)
                                .cornerRadius(20)
                            
                        }
                        else {
                            Image("background_dummy_img")
                                .resizable()
                                .scaledToFit()
                        }
                    }
                    
                    HStack {
                        ForEach(movie.genres, id: \.self) { genre in
                            Text(genre)
                                .font(.footnote)
                            if genre != movie.genres.last {
                                Circle().frame(width: 2, height: 2)
                            }
                        }
                    }
                    Text(movie.title)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    
                    HStack{
                        Text(movie.mpaRating)
                            .padding(3)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.white, lineWidth: 1)
                            )
                        Text(String(movie.year))
                            .padding(3)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.white, lineWidth: 1)
                            )
                        Text("\(movie.runtime/60)H \(movie.runtime%60)M")
                            .padding(3)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.white, lineWidth: 1)
                            )
                            
                    }
                    Text(movie.descriptionFull)
                        .multilineTextAlignment(.leading)
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Add to Watchlist")
                            .padding(10)
                    })
                    .background(.purple)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    RatingView(movieId: movieId)
                    Text("Cast")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }
            }
            .padding()
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        }
    }
}

#Preview {
    MovieDetailsView(movieId: 10)
}
