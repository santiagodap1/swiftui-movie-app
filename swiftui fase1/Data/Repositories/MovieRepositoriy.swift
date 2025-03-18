//
//  MovieRepositoriy.swift
//  fase1
//
//  Created by Pinto, Santiago (Apprentice Developer) on 21/02/2025.
//

import Foundation

class MovieRepository {
    private let apiService = APIService()

    func getMovies(query: String, completion: @escaping (Result<[Movie], Error>) -> Void) {
        apiService.fetchMovies(query: query, completion: completion)
    }
    
    func getMovieDetails(movieID: Int, completion: @escaping (Result<Movie, Error>) -> Void) {
           apiService.fetchMovieDetails(movieID: movieID, completion: completion)
    }
    
    func getMoviesByGenre(genreID: Int, completion: @escaping (Result<[Movie], Error>) -> Void) {
            apiService.fetchMoviesByGenre(genreID: genreID, completion: completion)
        }
    
    func getTopRatedMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        apiService.fetchTopRatedMovies(completion: completion)
    }
    
    func getSimilarMovies(movieID: Int, completion: @escaping (Result<[Movie], Error>) -> Void) {
        apiService.fetchSimilarMovies(movieID: movieID, completion: completion)
    }

    
}
