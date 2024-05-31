//
//  ContentView.swift
//  MovieApp
//
//  Created by BS00880 on 17/5/24.
//

import SwiftUI



//struct MovieData: Codable{
//    struct Movie: Codable, Identifiable{
//        let id: Int
//        let title: String
//    //    let rating: Float
//    //    let runtime: Float
//    }
//    struct Data: Codable {
//        let movies: [Movie]
//    }
//    let status: String
//    let statusMessage: String
//    let data: Data
//    
//}

struct ContentView: View {
    
    @StateObject var viewModel: NetworkLoaderViewModel = NetworkLoaderViewModel()
    var body: some View {
        Text("Hello World")
//        HomePageView()
//        NavigationView {
//            TabViewBelow()
//        }
//        .environmentObject(viewModel)
    }//end of body
}

#Preview {
    ContentView()
}
