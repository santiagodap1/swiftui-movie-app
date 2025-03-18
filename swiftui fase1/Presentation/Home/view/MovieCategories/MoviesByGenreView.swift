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
                LazyVStack(alignment: .leading, spacing: 10) {
                    Text(genre.name)
                        .font(.system(size: 28, weight: .bold, design: .default))
                        .foregroundColor(.yellow)
                        .padding(.horizontal, 20)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing: 16) {
                            ForEach(viewModel.moviesByGenre[genre.id] ?? [], id: \.id) { movie in
                                NavigationLink(destination: MovieDetails(movieID: movie.id)) {
                                    MoviesByGenreCard(movie : movie)
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
