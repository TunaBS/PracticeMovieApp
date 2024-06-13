//
//  Cast.swift
//  MovieApp
//
//  Created by BS00880 on 29/5/24.
//

import Foundation

struct Cast : Codable, Hashable {
//    let imdbCode: Int
    let name: String
    let characterName: String
    let urlSmallImage: String?
    
    static var castForTest = Cast(name: "", characterName: "", urlSmallImage: "cast_dummy_img")
    static var ifNoCastDataAvailable = Cast(name: "No Data", characterName: "No Data", urlSmallImage: "cast_dummy_img")
}
