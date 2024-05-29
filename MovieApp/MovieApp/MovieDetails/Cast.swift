//
//  Cast.swift
//  MovieApp
//
//  Created by BS00880 on 29/5/24.
//

import Foundation

struct Cast : Codable {
    let name: String
    let characterName: String
    let urlSmallImage: String
    
    static var castForTest = Cast(name: "Daniel Radcliff", characterName: "Harry Potter", urlSmallImage: "background_dummy_img")
}
