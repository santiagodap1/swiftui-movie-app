//
//  FetchSimilarMoviesUseCase.swift
//  swiftui fase1
//
//  Created by Pinto, Santiago (Apprentice Developer) on 17/03/2025.
//

import Foundation

class FetchSimilarMoviesUseCase {
    private let repository = MovieRepository()
    
    func execute(movieID: Int, completion: @escaping (Result<[Movie], Error>) -> Void) {
        repository.getSimilarMovies(movieID: movieID, completion: completion)
    }

    
    
}
