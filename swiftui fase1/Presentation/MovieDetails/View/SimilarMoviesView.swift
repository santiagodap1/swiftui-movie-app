//
//  SimilarMoviesView.swift
//  swiftui fase1
//
//  Created by Pinto, Santiago (Apprentice Developer) on 17/03/2025.
//

import SwiftUI

struct SimilarMoviesView: View {
    let movieID: Int
    @StateObject private var viewModel = MovieDetailsViewModel()

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Similar Movies")
                .font(.title2)
                .bold()
                .foregroundColor(.white)
                .padding(.leading, 16)

            if viewModel.isLoading {
                ProgressView()
                    .frame(maxWidth: .infinity, alignment: .center)
            } else if viewModel.similarMovies.isEmpty {
                Text("No similar movies found.")
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, alignment: .center)
            } else {
                LazyVStack {
                    ForEach(0..<(viewModel.similarMovies.count / 2 + viewModel.similarMovies.count % 2), id: \.self) { rowIndex in
                        HStack(spacing: UIScreen.main.bounds.width * 0.15) {
                            ForEach(0..<2, id: \.self) { columnIndex in
                                let index = rowIndex * 2 + columnIndex
                                if index < viewModel.similarMovies.count {
                                    NavigationLink(destination: MovieDetails(movieID: viewModel.similarMovies[index].id)) {
                                        SimilarMovieCard(movie: viewModel.similarMovies[index])
                                    }
                                }
                            }
                        }.padding(.vertical, 25)
                    }
                }
                
            }
        }
        .onAppear {
            viewModel.fetchSimilarMovies(movieID: movieID)
        }
    }
}


#Preview {
    SimilarMoviesView(movieID: 3)
        .background(Color.black)
}

import SwiftUI

struct SimilarMovieCard: View {
    let movie: Movie

    var body: some View {
        VStack {
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w200/\(movie.posterPath ?? "")")) { phase in
                switch phase {
                case .success(let image):
                    image.resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.width * 0.35, height: UIScreen.main.bounds.width * 0.5)
                        .cornerRadius(10)
                        .clipped()
                case .failure(_):
                    Color.gray
                        .frame(width: UIScreen.main.bounds.width * 0.35, height: UIScreen.main.bounds.width * 0.5)
                        .cornerRadius(10)
                default:
                    ProgressView()
                        .frame(width: UIScreen.main.bounds.width * 0.35, height: UIScreen.main.bounds.width * 0.5)
                }
            }

            Text(movie.title)
                .font(.caption)
                .foregroundColor(.white)
                .bold()
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .frame(width: UIScreen.main.bounds.width * 0.35)
        }
    }
}
