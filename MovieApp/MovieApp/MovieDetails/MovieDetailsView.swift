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
    @StateObject var viewModel = MovieDetailViewModel()
    @State var castNotFound = Movie.movieShowForTest.cast
    @EnvironmentObject var watchListViewModel: WatchListViewModel
//    @StateObject var watchListViewModel: WatchListViewModel
    let boolCastNotFound = false
    var hello = true
    
    let imageHeight: Int = 500
    let imageWidth = 400
    let shimmerTextWidth = 40
    let shimmerTextHeight = 10
    @ObservedObject var languageManager = LanguageManager.shared
    
    
    var body: some View {
        NavigationStack {
            
            
            ZStack {
                let foregroundImageHeight = 400.0
                if viewModel.isLoadingData /*!hello*/ {
                    VStack (alignment: .leading) {
                        Rectangle()
                            .frame(width: foregroundImageHeight, height: foregroundImageHeight)
                        Rectangle()
                            .frame(width: foregroundImageHeight, height: 50)
                        Rectangle()
                            .frame(width: foregroundImageHeight, height: 100)
                        Rectangle()
                            .frame(width: foregroundImageHeight, height: 50)
                        Rectangle()
                            .frame(width: foregroundImageHeight, height: 100)
                    }
                    .shimmer(.init(tint: .black.opacity(0.3), highlight: .white,blur: 5))
                }
                else {
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
                            .padding()
                            .frame(width: 400, height: 500)
                            
                            
                            HStack {
                                ForEach(movie.genres, id: \.self) { genre in
                                    Text(genre)
                                    if genre != movie.genres.last {
                                        Circle().frame(width: 2, height: 2)
                                    }
                                }
                            }
                            .padding()
                            Text(movie.title)
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
//                                .shimmer(.init(tint:/* .black.opacity(0.5), highlight: .white,blur: 5))*/
                                .padding()
                            
                            HStack{
                                if movie.mpaRating != "" {
                                    Text(movie.mpaRating)
                                        .padding(3)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(Color.primary, lineWidth: 1)
                                        )
                                } else {
                                    Text("N/A")
                                        .padding(3)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(Color.primary, lineWidth: 1)
                                        )
                                }
                                Text(String(movie.year))
                                    .padding(3)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.primary, lineWidth: 1)
                                    )
                                Text("\(movie.runtime/60)H \(movie.runtime%60)M")
                                    .padding(3)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.primary, lineWidth: 1)
                                    )
                                
                            }
                            .padding()
                            Text(movie.descriptionFull)
                                .multilineTextAlignment(.leading)
                                .padding()
                            
                            Button(action: {
                                watchListViewModel.addItems(movie: movie)
                            }, label: {
                                Text("Add to Watchlist")
                                    .padding(10)
                            })
                            .frame(maxWidth: .infinity, maxHeight: 100)
                            .background(.purple)
                            .foregroundColor(.white)
                            .cornerRadius(50)
                            .padding()
                            
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
                            .padding()
                        }
                    }
                    
                }
                    
            }
            .onAppear {
                Task {
                    await viewModel.getMovieData(movieId: idMovie)
                    movie = viewModel.movieDetail?.data.movie ?? movie
                }
            }
            .navigationTitle(languageManager.localizedString(forKey: "Movie Details"))
            .navigationBarTitleDisplayMode(.inline)
            .scrollIndicators(.hidden)
        }
    }
}
 
#Preview {
    MovieDetailsView(idMovie: 10)
}
