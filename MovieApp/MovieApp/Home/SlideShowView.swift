//
//  SlideShowView.swift
//  MovieApp
//
//  Created by BS00880 on 31/5/24.
//

import SwiftUI

struct SlideShowView: View {
    let movieList: [Movie]
    @State private var selectedTab = 0
//    let tabs = ["Image 1", "Image 2", "Image 3"]
    let indicatorHeight: CGFloat = 10 // Customize indicator height
    let indicatorColor = Color.white // Customize indicator color

    var body: some View {
        VStack {
            // TabView
            TabView(selection: self.$selectedTab) {
                ForEach(movieList, id: \.id) { movie in
                    NavigationLink(destination: MovieDetailsView(idMovie:movie.id)) {
                        MovieBannerView(movie: movie, showWatchListButton: true)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .overlay {
                    
                VStack(alignment: .trailing){
                    Spacer()
                    HStack {
                        Spacer()
                        HStack(spacing: 1) {
                            ForEach(movieList, id: \.self) { index in
                                if self.selectedTab == index.id {
                                    Capsule()
                                        .fill(self.indicatorColor)
                                        .frame(width: indicatorHeight, height: 5)
                                } else {
                                    Circle()
                                        .fill(.gray)
                                        .frame(width: 5, height: 5)
                                }
                            }
                        }
                        .frame(height: 5)
                    }
                    .padding()
                }
            }
        }
        .frame(width: 400, height: 300)
    }
}

#Preview {
    SlideShowView(movieList: Movie.movieArrayShowForTest)
}
