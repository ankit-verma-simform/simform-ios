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
    
    static func getMoviesData() -> Movies {
        let jsonData = Data(getMoviesDataJson().utf8)
        let decoder = JSONDecoder()
        return (try? decoder.decode(Movies.self, from: jsonData)) ?? []
    }
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
