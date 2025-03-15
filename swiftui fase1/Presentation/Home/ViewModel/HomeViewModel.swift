//
//  HomeViewModel.swift
//  fase1SwiftUI
//
//  Created by Pinto, Santiago (Apprentice Developer) on 12/03/2025.
//
import Foundation

class HomeViewModel: ObservableObject {
    private let fetchGenresUseCase = FetchGenresUseCase()
    private let fetchMoviesByGenreUseCase = FetchMoviesByGenreUseCase()
    private let fetchTopRatedMoviesUseCase = FetchTopRatedMoviesUseCase()

    @Published var genres: [Genre] = []
    @Published var moviesByGenre: [Int: [Movie]] = [:]
    @Published var topRatedMovies: [Movie] = []
    func fetchGenres() {
        fetchGenresUseCase.execute { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let genres):
                    self.genres = genres
                case .failure(let error):
                    print("Error fetching genres: \(error)")
                }
            }
        }
    }

    func fetchMoviesByGenre(genreID: Int) {
        fetchMoviesByGenreUseCase.execute(genreID: genreID) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let movies):
                    self.moviesByGenre[genreID] = movies
                case .failure(let error):
                    print("Error fetching movies for genre \(genreID): \(error)")
                }
            }
        }
    }
    
    func fetchTopRatedMovies() {
        fetchTopRatedMoviesUseCase.execute{ result in
            DispatchQueue.main.async {
                switch result {
                case .success(let movies):
                    self.topRatedMovies = movies
                case .failure(let error):
                    print("Error fetching top rated movies,  error:\(error)")
                }
            }
        }
    }
}
