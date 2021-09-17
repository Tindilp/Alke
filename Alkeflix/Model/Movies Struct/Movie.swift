//
//  Movie.swift
//  Alkeflix
//
//  Created by Lucas Di Lorenzo on 14/09/2021.
//

import Foundation


struct Movie : Codable {
    var id: Int?
    var original_title: String?
    var popularity: Float?
    var genre_ids: [Int]?
    var original_language: String?
    var release_date: String?
    var vote_average: Float?
    var overview: String?
    var poster_path: String?
}

struct MoviePage:Codable{
    let results:[Movie]
}

struct Genre : Codable  {
    var id: Int?
    var name: String?
}

struct Genres : Codable  {
    let genres:[Genre]
}

