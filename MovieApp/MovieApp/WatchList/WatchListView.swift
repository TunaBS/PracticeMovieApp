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
            VStack{
                HStack {
                    Text("Watch List")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .fontWeight(.bold)
                }
                
                if watchListViewModel.movieArray.isEmpty {
                    Text("You haven't chosen any movie for your Watch List")
                        .padding()
                        .font(.title3)
                        .frame(alignment: .leading)
                }
                else {
                    List {
                        ForEach(watchListViewModel.movieArray, id: \.id) { movie in
                            NavigationLink(destination: MovieDetailsView(idMovie: movie.id)) {
                                MovieCard(movie: movie, showWatchListButton: false)
                            }
                            .navigationBarHidden(true)
                        }
                        .onDelete(perform: watchListViewModel.deleteItems)
                        .onMove(perform: watchListViewModel.moveItems)
                        .listRowSeparator(.hidden)
                        .listStyle(.plain)
                    }
                }
            }
            
        }
    }
}

struct WatchListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            WatchListView()
        }
        .environmentObject(WatchListViewModel())
    }
}
