//
//  MovieDetailView.swift
//  MovieList
//
//  Created by Ameer Hamza on 29/11/2024.
//

import SwiftUI

struct MovieDetailView: View {
    let movie: Movie

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                if let posterURL = movie.posterURL {
                    AsyncImage(url: posterURL) { phase in
                        if let image = phase.image {
                            image
                                .resizable()
                                .scaledToFit()
                        } else if phase.error != nil {
                            Color.red
                        } else {
                            ProgressView()
                        }
                    }
                    .frame(maxHeight: 300)
                } else {
                    Color.gray.frame(maxHeight: 300)
                }

                Text(movie.title ?? "No Title")
                    .font(.largeTitle)
                    .bold()

                Text("Release Date: \(movie.release_date ?? "Unknown")")
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                Text(movie.overview ?? "No Description Found")
                    .font(.body)
            }
            .padding()
        }
        .navigationTitle(movie.title ?? "Movie Detail")
        .navigationBarTitleDisplayMode(.inline)
    }
}
