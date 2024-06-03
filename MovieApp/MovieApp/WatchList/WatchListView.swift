//
//  WatchListView.swift
//  MovieApp
//
//  Created by BS00880 on 3/6/24.
//

import SwiftUI

struct WatchListView: View {
    @EnvironmentObject var watchListViewModel: WatchListViewModel
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ForEach(watchListViewModel.movieArray, id: \.id) { movie in
                        NavigationLink(destination: MovieDetailsView(idMovie: movie.id)) {
                            MovieCard(movie: movie, showWatchListButton: false)
                        }
                    }
                    .onDelete(perform: watchListViewModel.deleteItems)
                }
            }
            .navigationTitle("Watch List")
            .scrollIndicators(.hidden)
            
        }
        
    }
}

//#Preview {
//    NavigationStack {
//        WatchListView()
//    }
//    .environmentObject(WatchListViewModel())
//}

struct WatchListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            WatchListView()
        }
        .environmentObject(WatchListViewModel())
    }
}
