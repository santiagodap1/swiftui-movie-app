//
//  fetchTopRatedMoviesUseCase.swift
//  swiftui fase1
//
//  Created by Pinto, Santiago (Apprentice Developer) on 13/03/2025.
//

import Foundation

class FetchTopRatedMoviesUseCase {
    private let repository = MovieRepository()
    
    func execute( completion: @escaping (Result<[Movie], Error>) -> Void) {
        repository.getTopRatedMovies(completion: completion)
    }
    
    
}
