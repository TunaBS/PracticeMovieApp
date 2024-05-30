//
//  Cast.swift
//  MovieApp
//
//  Created by BS00880 on 29/5/24.
//

import Foundation

struct Cast : Codable, Hashable {
    let imdbCode: Int
    let name: String
    let characterName: String
    let urlSmallImage: String?
    
    static var castForTest = Cast(imdbCode: 005458, name: "Daniel", characterName: "Harry Potter", urlSmallImage: "background_dummy_img")
}
