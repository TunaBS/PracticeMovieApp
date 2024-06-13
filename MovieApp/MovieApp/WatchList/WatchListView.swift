//
//  WatchListView.swift
//  MovieApp
//
//  Created by BS00880 on 3/6/24.
//
import SwiftUI

struct WatchListView: View {
    @EnvironmentObject var watchListViewModel: WatchListViewModel
    @ObservedObject var languageManager = LanguageManager.shared
//    @EnvironmentObject var signingViewModel: AuthenticationManager
    
    var body: some View {
        
        NavigationStack {
            VStack(alignment: .leading){
                HStack {
                    Text(languageManager.localizedString(forKey: "Watch List"))
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .fontWeight(.bold)
                        .padding()
                }
                
                if watchListViewModel.movieArray.isEmpty {
                    Text("You haven't chosen any movie for your Watch List")
                        .padding()
                        .font(.title3)
                        .frame(alignment: .leading)
                }
                else {
                    List {
                        ForEach(/*signingViewModel.currentUser?.movies ?? Movie.movieArrayShowForTest*/ watchListViewModel.movieArray, id: \.id) { movie in
                            NavigationLink(destination: MovieDetailsView(idMovie: movie.id)) {
                                MovieCard(movie: movie, showWatchListButton: false)
//                                    .*padding(.vertical, 20)*/
                            }
                        }
                        .onDelete(perform: watchListViewModel.deleteItems)
                        .onMove(perform: watchListViewModel.moveItems)
                        .buttonStyle(PlainButtonStyle()) // Hide the ">" sign
//                        .lineSpacing(20.0)
                    }
                    .listRowSeparator(.hidden)
                    .listStyle(.plain)
                    
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
//        .environmentObject(AuthenticationManager())
    }
}
