//
//  GenreRepository.swift
//  fase1
//
//  Created by Pinto, Santiago (Apprentice Developer) on 10/03/2025.
//

import Foundation

class GenreRepository {
    
    private let apiService = APIService()
    
    func getGenres(completion: @escaping (Result<[Genre], Error>) -> Void) {
        apiService.fetchGenres(completion: completion)
    }
}
