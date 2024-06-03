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
    
    static var movieShowForTest = Movie(id: 10, title: "Harry Potter and the Deathly Hallows", year: 2012, rating: 5.0, runtime: 277, genres: ["Family", "Funny"], descriptionFull: "Harry Potter is a globally renowned fantasy book series written by British author J.K. Rowling. It follows the journey of a young wizard, Harry Potter, and his friends Hermione Granger and Ron Weasley, as they attend Hogwarts School of Witchcraft and Wizardry. The series spans seven books, each detailing a year of Harry's education at Hogwarts and his ongoing battle against the dark wizard Lord Voldemort.", backgroundImage: "background_dummy_img", largeCoverImage: "background_dummy_img", mpaRating: "PG", cast: [Cast.castForTest, Cast.castForTest, Cast.castForTest])
    
    static var movieArrayShowForTest = [
        Movie(id: 11, title: "Harry Potter2", year: 2012, rating: 5.0, runtime: 277, genres: ["Family", "Funny"], descriptionFull: "A Good movie", backgroundImage: "background_dummy_img", largeCoverImage: "background_dummy_img",  mpaRating: "PG", cast: [Cast.castForTest, Cast.castForTest, Cast.castForTest]),
        Movie(id: 12, title: "Harry Potter3", year: 2012, rating: 5.0, runtime: 277, genres: ["Family", "Funny"], descriptionFull: "A Good movie", backgroundImage: "background_dummy_img", largeCoverImage: "background_dummy_img", mpaRating: "PG", cast: [Cast.castForTest, Cast.castForTest, Cast.castForTest]),
        Movie(id: 13, title: "Harry Potter4", year: 2012, rating: 5.0, runtime: 277, genres: ["Family", "Funny"], descriptionFull: "A Good movie", backgroundImage: "background_dummy_img", largeCoverImage: "background_dummy_img", mpaRating: "PG", cast: [Cast.castForTest, Cast.castForTest, Cast.castForTest]),
        Movie(id: 14, title: "Harry Potter5", year: 2012, rating: 5.0, runtime: 277, genres: ["Family", "Funny"], descriptionFull: "A Good movie", backgroundImage: "background_dummy_img", largeCoverImage: "background_dummy_img", mpaRating: "PG", cast: [Cast.castForTest, Cast.castForTest, Cast.castForTest])
    ]
}
