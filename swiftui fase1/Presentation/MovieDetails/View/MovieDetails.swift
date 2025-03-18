//
//  MoviesListSwiftUI.swift
//  fase1
//
//  Created by Pinto, Santiago (Apprentice Developer) on 10/03/2025.
//

import SwiftUI

struct MovieDetails: View {
    let movieID: Int
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var viewModel = MoviesListViewModel()

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                ZStack(alignment: .bottomLeading) {
                    AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500/\(viewModel.selectedMovie?.posterPath ?? "")")) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: UIScreen.main.bounds.width, height: 400)
                            .clipped()
                    } placeholder: {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .yellow))
                            .frame(width: UIScreen.main.bounds.width, height: 400)
                    }

                    VStack(alignment: .leading, spacing: 4) {
                        HStack(spacing: 15) {
                            if let runtime = viewModel.selectedMovie?.runtime {
                                InfoPill(text: "\(runtime) min", systemImage: "clock")
                            }

                            if let voteAverage = viewModel.selectedMovie?.voteAverage {
                                InfoPill(text: String(format: "%.1f", voteAverage), systemImage: "star.fill")
                            }

                            if let voteCount = viewModel.selectedMovie?.voteCount {
                                InfoPill(text: "\(voteCount) votes", systemImage: "person.3.fill")
                            }
                        }
                    }
                    .padding(10)
                    .background(Color.black.opacity(0.9))
                    .cornerRadius(12)
                    .padding(20)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text(viewModel.selectedMovie?.title ?? "Loading...")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.vertical, 20)

                    if let genres = viewModel.selectedMovie?.genres {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(genres, id: \.id) { genre in
                                    Text(genre.name)
                                        .font(.caption)
                                        .padding(.horizontal, 10)
                                        .padding(.vertical, 5)
                                        .background(Color.yellow.opacity(0.6))
                                        .foregroundColor(.black)
                                        .cornerRadius(10)
                                }
                            }
                        }.padding(.bottom, 15)
                    }

                    Text(viewModel.selectedMovie?.overview ?? "")
                        .font(.body)
                        .foregroundColor(.white)
                }
                .padding(.horizontal)

                SimilarMoviesView(movieID: movieID)
                    .padding(.top, 50)

            }
            .padding(.bottom, 20)
        }
        .background(GradientBackgroundView())
        .onAppear {
            viewModel.searchMovie(id: movieID)
        }
    }
}

#Preview {
    MovieDetails(movieID: 5)
}
