//
//  MovieDetailsView.swift
//  MovieApp
//
//  Created by BS00880 on 29/5/24.
//

import SwiftUI

struct MovieDetailsView: View {
    
    let idMovie: Int
    @State var movie = Movie.movieShowForTest
    @State var viewModel = MovieDetailViewModel()
    @State var castNotFound = Movie.movieShowForTest.cast
    let boolCastNotFound = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Rectangle()
                    .fill(LinearGradient(gradient: Gradient(colors: [Color(red: 101/255, green: 67/255, blue: 33/255), Color.black]),
                        startPoint: .top, endPoint: .bottom)
                    )
                    .ignoresSafeArea()
                
                ScrollView(.vertical) {
                
                
                    VStack(alignment: .leading) {
                        AsyncImage(url: URL(string: movie.largeCoverImage)) {phase in
                            if let image = phase.image {
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .cornerRadius(20)
                            }
                            else {
                                Image("background_dummy_img")
                                    .resizable()
                                    .scaledToFit()
                                    .cornerRadius(20)
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
                            if movie.mpaRating != "" {
                                Text(movie.mpaRating)
                                    .padding(3)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.white, lineWidth: 1)
                                    )
                            } else {
                                Text("N/A")
                                    .padding(3)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.white, lineWidth: 1)
                                    )
                            }
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
                        RatingView(movieRate: movie.rating)
                            .padding()
                            .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        
                        VStack(alignment: .leading){
                            Text("Cast")
                                .font(.title3)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            
                            ScrollView(.horizontal) {
                                HStack {
                                    ForEach(movie.cast ?? [Cast.ifNoCastDataAvailable], id: \.self) {cast in
                                        CastView(castOfMovie: cast)
                                    }
                                    
                                }
                            }
                        }
                    }
                    .padding()
                }
            }
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
            .onAppear {
                Task {
                    await viewModel.getMovieData(movieId: idMovie)
                    movie = viewModel.movieDetail?.data.movie ?? movie
                }
            }
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    MovieDetailsView(idMovie: 10)
}
