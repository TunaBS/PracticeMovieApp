//
//  MoviePoster.swift
//  MovieApp
//
//  Created by BS00880 on 29/5/24.
//

import SwiftUI

struct MoviePoster: View {
    var movie: Movie
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            AsyncImage(url: URL(string: movie.largeCoverImage)) {phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 300)
                        .cornerRadius(20)
                    
                }
                else {
                    Image("background_dummy_img")
                        .resizable()
                        .scaledToFit()
                }
            }
            .frame(height: 350)
            Text(movie.title)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .lineLimit(1)
                .truncationMode(/*@START_MENU_TOKEN@*/.tail/*@END_MENU_TOKEN@*/)
                .frame(width: 200, alignment: .leading)
                .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
            
            HStack{
                Text(String(movie.year))
                Circle().frame(width: 2, height: 2)
                Text(movie.mpaRating)
                Circle().frame(width: 2, height: 2)
                Text(String(movie.runtime/60)+"H")
                Text(String(movie.runtime%60)+"M")
            }
            .font(.footnote)
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        }
    }
}

#Preview {
    MoviePoster(movie: Movie.movieShowForTest)
}
