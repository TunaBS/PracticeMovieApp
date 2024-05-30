//
//  CastView.swift
//  MovieApp
//
//  Created by BS00880 on 29/5/24.
//

import SwiftUI

struct CastView: View {
//    let idMovie: Int
    var castOfMovie: Cast
//    @State var viewModel = MovieDetailViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 0) {
                AsyncImage(url: URL(string: castOfMovie.urlSmallImage ?? "background_dummy_img")) {phase in
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
//                .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                Text(castOfMovie.name)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .lineLimit(1)
                Text(castOfMovie.characterName)
                    .lineLimit(1)
            }
            .padding()
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
            .frame(width: 100,height: 200)
//            .onAppear {
//                Task {
//                    await viewModel.getMovieData(movieId: idMovie)
//                }
//            }
        }
    }
}

#Preview {
    CastView(castOfMovie: Cast.castForTest)
}
