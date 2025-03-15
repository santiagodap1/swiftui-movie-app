//
//  FetchMovieDetailsUseCase.swift
//  fase1
//
//  Created by Pinto, Santiago (Apprentice Developer) on 11/03/2025.
//

class FetchMovieDetailsUseCase {
    private let repository = MovieRepository()
    
    func execute(movieID: Int, completion: @escaping (Result<Movie, Error>) -> Void) {
        repository.getMovieDetails(movieID: movieID, completion: completion)
    }
}
