//
//  Movie.swift
//  MovieApp
//
//  Created by BS00880 on 29/5/24.
//

import Foundation

struct Movie : Codable, Hashable, Identifiable{
   
    
    let id : Int
    let title : String
    let year : Int
    let rating : Double
    let runtime : Int
    let genres : [String]
    let descriptionFull : String
    let backgroundImage : String
    let largeCoverImage :  String
    let mpaRating: String
    let cast: [Cast]?
    
    static var movieShowForTest = Movie(id: 10, title: "", year: 0, rating: 0, runtime: 0, genres: ["", ""], descriptionFull: "", backgroundImage: "background_dummy_img", largeCoverImage: "background_dummy_img", mpaRating: "", cast: [Cast.castForTest, Cast.castForTest, Cast.castForTest])
    
    static var movieArrayShowForTest = [
        Movie(id: 11, title: "", year: 0, rating: 0, runtime: 0, genres: ["", ""], descriptionFull: "", backgroundImage: "background_dummy_img", largeCoverImage: "background_dummy_img", mpaRating: "", cast: [Cast.castForTest, Cast.castForTest, Cast.castForTest]),
        Movie(id: 12, title: "", year: 0, rating: 0, runtime: 0, genres: ["", ""], descriptionFull: "", backgroundImage: "background_dummy_img", largeCoverImage: "background_dummy_img", mpaRating: "", cast: [Cast.castForTest, Cast.castForTest, Cast.castForTest]),
        Movie(id: 13, title: "", year: 0, rating: 0, runtime: 0, genres: ["", ""], descriptionFull: "", backgroundImage: "background_dummy_img", largeCoverImage: "background_dummy_img", mpaRating: "", cast: [Cast.castForTest, Cast.castForTest, Cast.castForTest]),
        Movie(id: 14, title: "", year: 0, rating: 0, runtime: 0, genres: ["", ""], descriptionFull: "", backgroundImage: "background_dummy_img", largeCoverImage: "background_dummy_img", mpaRating: "", cast: [Cast.castForTest, Cast.castForTest, Cast.castForTest])
    ]
}
