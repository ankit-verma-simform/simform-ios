//
//  MovieCatalog.swift
//  DemoApp
//
//  Created by Ankit Verma on 01/05/23.
//

import Foundation

struct MovieCatalog {
    let title: String?
    let movies: Movies?
}

struct MovieItem: Codable {
    let title: String?
    let year: String?
    let runtime: String?
    let poster: String?

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case runtime = "Runtime"
        case poster = "Poster"
    }
}

typealias Movies = [MovieItem]

let jsonData = Data(jsonString.utf8)
let decoder = JSONDecoder()
let moviesData = (try? decoder.decode(Movies.self, from: jsonData)) ?? []
