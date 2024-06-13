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
            VStack(alignment: .leading) {
                AsyncImage(url: URL(string: castOfMovie.urlSmallImage ?? "cast_dummy_img")) {phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(20)
                        
                    }
                    else {
                        Image("cast_dummy_img")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(20)
                    }
                }
                .frame(width: 150, height: 150)
                Text(castOfMovie.name)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .lineLimit(1)
                Text(castOfMovie.characterName)
                    .lineLimit(1)
            }
            .padding()
            .frame(width: 150)
        }
    }
}

#Preview {
    CastView(castOfMovie: Cast.castForTest)
}
