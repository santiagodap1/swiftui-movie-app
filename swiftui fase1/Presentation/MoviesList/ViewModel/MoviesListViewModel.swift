//
//  MoviesListViewModel.swift
//  fase1
//
//  Created by Pinto, Santiago (Apprentice Developer) on 21/02/2025.
//

import Foundation

class MoviesListViewModel : ObservableObject {
    private let fetchMoviesUseCase = FetchMoviesUseCase()
    private let fetchMovieDetailsUseCase = FetchMovieDetailsUseCase()
    @Published var movies: [Movie] = []
    @Published var selectedMovie: Movie?
    var onMoviesUpdated: (() -> Void)?
    
    private let debouncer = Debouncer(delay: 0.5)
    
    func searchMovies(query: String) {
        debouncer.debounce { [weak self] in
            guard let self = self else { return }
            self.fetchMoviesUseCase.execute(query: query) { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let movies):
                        self.movies = movies
                        self.onMoviesUpdated?()
                    case .failure(let error):
                        print("Error fetching movies: \(error)")
                    }
                }
            }
        }
    }
    
    func searchMovie(id: Int) {
            fetchMovieDetailsUseCase.execute(movieID: id) { [weak self] result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let movie):
                        self?.selectedMovie = movie
                    case .failure(let error):
                        print("Error fetching movie: \(error)")
                    }
                }
            }
        }
}

