//
//  SearchMoviesUseCase.swift
//  fase1
//
//  Created by Pinto, Santiago (Apprentice Developer) on 20/02/2025.
//

import Foundation

class FetchMoviesUseCase {
    private let repository = MovieRepository()
    
    func execute(query: String, completion: @escaping (Result<[Movie], Error>) -> Void) {
        repository.getMovies(query: query, completion: completion)
    }
    
    
}
    
