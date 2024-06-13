//
//  WatchListButtonView.swift
//  MovieApp
//
//  Created by BS00880 on 3/6/24.
//

import SwiftUI
import FirebaseAuth

struct WatchListButtonView: View {
    let movie: Movie
//    @Binding var isButtonPressed: Bool
    @EnvironmentObject var watchListViewModel: WatchListViewModel
    @ObservedObject var languageManager = LanguageManager.shared
    @State var showAlert: Bool = false
    @State private var alertMessage: String = ""
    
    var body: some View {
        Button(action: {
            watchListViewModel.addItems(movie: movie)
            if watchListViewModel.itemAlreadyInWatchList {
                showAlert = true
                print("check watchlisht item \(watchListViewModel.itemAlreadyInWatchList)")
                alertMessage = languageManager.localizedString(forKey: "Item already exits in your watch list")
            } else {
                showAlert = true
                print("check watchlisht item \(watchListViewModel.itemAlreadyInWatchList)")
                alertMessage = languageManager.localizedString(forKey: "Item added to your watch list")
            }
        }, label: {
            Text(languageManager.localizedString(forKey: "Add to WatchList"))
                .padding(10)
                .foregroundColor(.white)
                .background(.purple)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
        })
        .alert(isPresented: $showAlert) {
            Alert(title: Text(languageManager.localizedString(forKey: "Alert")), message: Text(alertMessage), dismissButton: .default(Text(languageManager.localizedString(forKey: "OK"))))
        }
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
