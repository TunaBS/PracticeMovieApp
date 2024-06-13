//
//  MovieData.swift
//  MovieApp
//
//  Created by BS00880 on 29/5/24.
//

import Foundation

struct MovieData : Codable{
    struct Data : Codable {
        let movies : [Movie]
    }
    let status : String
    let statusMessage : String
    let data : Data
}

