//
//  ContentView.swift
//  MovieList
//
//  Created by Ameer Hamza on 29/11/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var moviesList: [Movie] = []
    @State private var isLoading = true

    var body: some View {
        NavigationView {
            Group {
                if isLoading {
                    ProgressView("Hold on ...")
                } else if moviesList.isEmpty {
                    Text("No movies found.")
                } else {
                    List(moviesList) { movie in
                        NavigationLink(destination: MovieDetailView(movie: movie)) {
                            RowView(movie: movie)
                        }
                    }
                }
            }
            .navigationTitle("Movies List")
            .onAppear {
                loadAllMovies()
            }
        }
    }

    private func loadAllMovies() {
        MovieAPI.shared.fetchPopularMovies { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let movies):
                    self.moviesList = movies
                case .failure:
                    self.moviesList = []
                }
                self.isLoading = false
            }
        }
    }
}

#Preview {
    ContentView()
}
