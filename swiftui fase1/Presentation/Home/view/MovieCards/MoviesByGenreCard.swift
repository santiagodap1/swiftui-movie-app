//
//  MoviesByGenreMovieCard.swift
//  swiftui fase1
//
//  Created by Pinto, Santiago (Apprentice Developer) on 17/03/2025.
//

import SwiftUI

public struct MoviesByGenreCard: View {
    let movie: Movie
    public var body: some View {
        VStack {
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w200/\(movie.posterPath ?? "")")) { image in
                    image.resizable().scaledToFill()
                } placeholder: {
                    ZStack {
                        Color.gray.opacity(0.3)
                        Image(systemName: "film")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.white.opacity(0.7))
                    }
                }
                .frame(width: 120, height: 180)
                .cornerRadius(8)
                .clipped()

            Text(movie.title)
                .font(.subheadline)
                .lineLimit(1)
                .foregroundColor(Color.white)
                .bold()
                .frame(width: 120)
        }
    }
}
