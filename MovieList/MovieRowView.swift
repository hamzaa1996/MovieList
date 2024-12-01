//
//  MovieRowView.swift
//  MovieList
//
//  Created by Ameer Hamza on 29/11/2024.
//

import SwiftUI

struct RowView: View {
    let movie: Movie

    var body: some View {
        HStack {
            if let posterURL = movie.posterURL {
                AsyncImage(url: posterURL) { image in
                    if let image = image.image {
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 75)
                            .cornerRadius(8)
                    } else if image.error != nil {
                        Color.gray
                            .frame(width: 50, height: 75)
                            .cornerRadius(8)
                    } else {
                        ProgressView()
                    }
                }
            } else {
                Color.gray
                    .frame(width: 50, height: 75)
                    .cornerRadius(8)
            }
            VStack(alignment: .leading, spacing: 5) {
                Text(movie.title ?? "No Title")
                    .font(.headline)
                Text(movie.release_date ?? "Release Date Not Available")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}
