//
//  RatingView.swift
//  MovieApp
//
//  Created by BS00880 on 29/5/24.
//

import SwiftUI

struct RatingView: View {
    let movieRate: Double
    @State var movie = Movie.movieShowForTest
//    @State var movieRateTest: Movie
    
    var body: some View {
        HStack {
            VStack(alignment: .center){
                Text("Overall Rating")
                    .font(.title2)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Text(String(format: "%.1f", movieRate))
                
                HStack {
                    ForEach(1..<6) { index in
                        if Double(index)<=movieRate/2 {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                        }
                        else if Double(index-1)<movieRate/2 && movieRate/2<Double(index) {
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
            .padding()
            Rectangle()
                .frame(width: 2, height: 100)
                
            VStack(alignment: .center){
                Text("Your Rating")
                    .font(.title2)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
//                Text(String(format: "%.1f", movieRate))
                Text(String(format: "%.1f", 0))
                
                HStack {
                    ForEach(1..<6) { index in
                        Image(systemName: "star.fill")
                            .foregroundColor(.gray)
//                        if Double(index)<=movieRate/2 {
//                            Image(systemName: "star.fill")
//                                .foregroundColor(.yellow)
//                        }
//                        else if Double(index-1)<movieRate/2 && movieRate/2<Double(index) {
//                            Image(systemName: "star.leadinghalf.fill")
//                                .foregroundStyle(.yellow)
//                        }
//                        else {
//                            Image(systemName: "star.fill")
//                                .foregroundColor(.gray)
//                        }
                    }
                }
                
            }
            .padding()
            
        }
    }
}

#Preview {
    RatingView(movieRate: 6.0)
}
