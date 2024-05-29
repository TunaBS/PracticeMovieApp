//
//  RatingView.swift
//  MovieApp
//
//  Created by BS00880 on 29/5/24.
//

import SwiftUI

struct RatingView: View {
    let movieId: Int
    @State var movie = Movie.movieShowForTest
    var maxRating: Int = 5
    
    var body: some View {
        HStack {
            VStack(alignment: .center){
                Text("Overall Rating")
                    .font(.title2)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Text(String(format: "%.1f", movie.rating))
                
                HStack {
                    ForEach(1..<maxRating + 1) { index in
                        if Double(index)<=movie.rating/2 {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                        }
                        else if Double(index-1)<movie.rating/2 && movie.rating/2<Double(index) {
                            Image(systemName: "star.leadinghalf.fill")
                                .foregroundStyle(.yellow)
                        }
                        else {
                            Image(systemName: "star.fill")
                                .foregroundColor(.gray)
                        }
                    }
                }
                
            }
            Divider()
                .frame(height: 100)
                .foregroundColor(.black)
//                .fontWeight(5.0)
            VStack(alignment: .center){
                Text("Your Rating")
                    .font(.title2)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Text(String(format: "%.1f", movie.rating))
                
                HStack {
                    ForEach(1..<maxRating + 1) { index in
                        if Double(index)<=movie.rating/2 {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                        }
                        else if Double(index-1)<movie.rating/2 && movie.rating/2<Double(index) {
                            Image(systemName: "star.leadinghalf.fill")
                                .foregroundStyle(.yellow)
                        }
                        else {
                            Image(systemName: "star.fill")
                                .foregroundColor(.gray)
                        }
                    }
                }
                
            }
            
        }
    }
}

#Preview {
    RatingView(movieId: 10)
}
