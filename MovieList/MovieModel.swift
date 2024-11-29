//
//  MovieModel.swift
//  MovieList
//
//  Created by Ameer Hamza on 29/11/2024.
//

import Foundation


struct Movie: Decodable, Encodable, Identifiable {
    let id: Int
    let title: String?
    let overview: String?
    let poster_path: String?
    let release_date: String?

    var posterURL: URL? {
        if let posterPath = poster_path {
            return URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)")
        }
        return nil
    }
}

struct MovieResponse: Decodable, Encodable {
    let results: [Movie]
}

