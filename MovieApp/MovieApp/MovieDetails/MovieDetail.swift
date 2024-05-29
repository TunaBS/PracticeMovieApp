//
//  MovieDetail.swift
//  MovieApp
//
//  Created by BS00880 on 29/5/24.
//

import Foundation

struct MovieDetail : Codable{
    struct MovieObject : Codable {
        let movie : Movie
    }
    let status : String
    let statusMessage : String
    let data : MovieObject
}


