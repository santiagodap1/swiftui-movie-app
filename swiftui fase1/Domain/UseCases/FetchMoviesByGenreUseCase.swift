//
//  FetchMoviesByGenreUseCase.swift
//  fase1SwiftUI
//
//  Created by Pinto, Santiago (Apprentice Developer) on 12/03/2025.
//

import Foundation

class FetchMoviesByGenreUseCase {
    private let repository = MovieRepository()

    func execute(genreID: Int, completion: @escaping (Result<[Movie], Error>) -> Void) {
        repository.getMoviesByGenre(genreID: genreID, completion: completion)
    }
}
