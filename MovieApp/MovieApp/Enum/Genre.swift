//
//  Genre.swift
//  MovieApp
//
//  Created by BS00880 on 4/6/24.
//

import Foundation

enum Genre: String, CaseIterable, Identifiable {
    case action = "Action"
    case comedy = "Comedy"
    case drama = "Drama"
    case horror = "Horror"
    case thriller = "Thriller"
    case romance = "Romance"
    case sciFi = "Sci-Fi"
    case fantasy = "Fantasy"
    case documentary = "Documentary"
    case animation = "Animation"
    
    var id: String { self.rawValue }
}
