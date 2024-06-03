//
//  WatchListButtonView.swift
//  MovieApp
//
//  Created by BS00880 on 3/6/24.
//

import SwiftUI

struct WatchListButtonView: View {
    let movie: Movie
//    @Binding var isButtonPressed: Bool
    @EnvironmentObject var watchListViewModel: WatchListViewModel
    
    var body: some View {
        Button(action: {
            watchListViewModel.addItems(movie: movie)
        }, label: {
            Text("Add to Watchlist")
                .padding(10)
                .foregroundColor(.white)
                .background(.purple)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
        })
    }
}

//#Preview {
//    WatchListButtonView(movie: Movie.movieShowForTest)
//}

struct WatchListButtonView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            WatchListButtonView(movie: Movie.movieShowForTest)
        }
        .environmentObject(WatchListViewModel())
    }
}
