//
//  UserInfo.swift
//  MovieApp
//
//  Created by BS00880 on 10/6/24.
//

import Foundation

struct UserInfo: Identifiable, Codable {
    let id: String
    let email: String?
    let userName: String?
    var movies : [Movie]?
}

extension UserInfo{
    static var userShowForTest = UserInfo(id: "abcd", email: "helloworld@gmail.com", userName: "Fairuz Ahmed Tuna", movies: Movie.movieArrayShowForTest)
}
