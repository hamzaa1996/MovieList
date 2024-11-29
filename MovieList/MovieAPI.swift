//
//  MovieAPI.swift
//  MovieList
//
//  Created by Ameer Hamza on 29/11/2024.
//

import Foundation

class MovieAPI {
    
    static let shared = MovieAPI()
    
    private let apiKey = Constants.MovieList.apiKey
    private let baseURL = Constants.MovieList.endpoint

    func fetchPopularMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        guard let url = URL(string: "\(baseURL)?api_key=\(apiKey)") else {
            return completion(.failure(URLError(.badURL)))
        }
        URLSession.shared.dataTask(with: url) { data, _, error in
            
            if let error = error {
                return completion(.failure(error))
            }
            guard let data = data else {
                return completion(.failure(URLError(.badServerResponse)))
            }
            do {
                let response = try JSONDecoder().decode(MovieResponse.self, from: data)
                
                completion(.success(response.results))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
