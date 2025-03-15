//
//  FetchGenresUseCase.swift
//  fase1
//
//  Created by Pinto, Santiago (Apprentice Developer) on 10/03/2025.
//

import Foundation

class FetchGenresUseCase {
    private let repository = GenreRepository()

    func execute(completion: @escaping (Result<[Genre], Error>) -> Void) {
        repository.getGenres(completion: completion)
    }
}
