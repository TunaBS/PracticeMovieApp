//
//  MovieAppApp.swift
//  MovieApp
//
//  Created by BS00880 on 17/5/24.
//

import SwiftUI

@main
struct MovieAppApp: App {
    @StateObject var viewModel: NetworkLoaderViewModel = NetworkLoaderViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView {
                TabViewBelow()
            }
            .environmentObject(viewModel)
        }
    }
}
