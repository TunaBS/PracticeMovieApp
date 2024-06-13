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
        VStack(alignment: .leading){
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
                        .shimmer(.init(tint: .primary.opacity(0.3), highlight: .white,blur: 5))
                }
            }
            .frame(height: 350)
            Text(movie.title)
                .font(.headline)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .lineLimit(1)
                .truncationMode(/*@START_MENU_TOKEN@*/.tail/*@END_MENU_TOKEN@*/)
                .frame(width: 200, alignment: .leading)
            
            HStack{
                Text(String(movie.year))
                    .font(.caption)
                Circle().frame(width: 2, height: 2)
                if movie.mpaRating != "" {
                    Text(movie.mpaRating)
                        .font(.caption)
                } else {
                    Text("N/A")
                        .font(.caption)
                }
                Circle().frame(width: 2, height: 2)
                Text(String(movie.runtime/60)+"H")
                    .font(.caption)
                Text(String(movie.runtime%60)+"M")
                    .font(.caption)
            }
            .font(.footnote)
        }
    }
}

#Preview {
    MoviePoster(movie: Movie.movieShowForTest)
}
