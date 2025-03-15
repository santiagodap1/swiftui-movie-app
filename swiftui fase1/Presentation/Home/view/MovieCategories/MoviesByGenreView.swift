//
//  MoviesByGenreView.swift
//  swiftui fase1
//
//  Created by Pinto, Santiago (Apprentice Developer) on 13/03/2025.
//


import SwiftUI

struct MoviesByGenreView: View {
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ForEach(viewModel.genres, id: \.id) { genre in
                VStack(alignment: .leading, spacing: 10) {
                    Text(genre.name)
                        .font(.system(size: 28, weight: .bold, design: .default))
                        .foregroundColor(.yellow)
                        .padding(.horizontal, 20)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(viewModel.moviesByGenre[genre.id] ?? [], id: \.id) { movie in
                                NavigationLink(destination: MovieDetails(movieID: movie.id)) {
                                    VStack {
                                        AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w200/\(movie.posterPath ?? "")")) { image in
                                            image.resizable().scaledToFill()
                                        } placeholder: {
                                            ProgressView()
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
                        }
                        .padding(.horizontal, 20)
                    }
                    .frame(height: 230) 
                }
                .onAppear {
                    viewModel.fetchMoviesByGenre(genreID: genre.id)
                }
            }
        }
        .onAppear {
            viewModel.fetchGenres()
        }
    }
}

#Preview {
    MoviesByGenreView()
}
