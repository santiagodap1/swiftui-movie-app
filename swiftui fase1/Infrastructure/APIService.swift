//
//  APIService.swift
//  fase1
//
//  Created by Pinto, Santiago (Apprentice Developer) on 21/02/2025.
//

import Foundation

class APIService {
    
    private let apiKey = "849ec337cc2d1698c754c9d72ae91dc5"
    
    
    private func fetchData<T: Decodable>(urlString: String, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 400, userInfo: nil)))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                return
            }

            do {
                let decodedResponse = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedResponse))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }

    
    func fetchMovies(query: String, completion: @escaping (Result<[Movie], Error>) -> Void) {
        let urlString = "https://api.themoviedb.org/3/search/movie?api_key=\(apiKey)&query=\(query)"
        
        fetchData(urlString: urlString) { (result: Result<MovieResponse, Error>) in
            switch result {
            case .success(let response):
                completion(.success(response.results))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
    func fetchMovieDetails(movieID: Int, completion: @escaping (Result<Movie, Error>) -> Void) {
        let urlString = "https://api.themoviedb.org/3/movie/\(movieID)?api_key=\(apiKey)&language=en-US"

        fetchData(urlString: urlString) { (result: Result<Movie, Error>) in
            switch result {
            case .success(let movie):
                completion(.success(movie)) 
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }



    func fetchGenres(completion: @escaping (Result<[Genre], Error>) -> Void) {
        let urlString = "https://api.themoviedb.org/3/genre/movie/list?api_key=\(apiKey)&language=en-US"
        
        fetchData(urlString: urlString) { (result: Result<GenreResponse, Error>) in
            switch result {
            case .success(let response):
                completion(.success(response.genres))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
    func fetchMoviesByGenre(genreID: Int, completion: @escaping (Result<[Movie], Error>) -> Void) {
        let urlString = "https://api.themoviedb.org/3/discover/movie?api_key=\(apiKey)&with_genres=\(genreID)"

        fetchData(urlString: urlString) { (result: Result<MovieResponse, Error>) in
            switch result {
            case .success(let response):
                completion(.success(response.results))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
    func fetchTopRatedMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        let urlString = "https://api.themoviedb.org/3/movie/top_rated?api_key=\(apiKey)&language=en-US&page=1"
        
        fetchData(urlString: urlString) { (result: Result<MovieResponse, Error>) in
            switch result {
            case .success(let response):
                completion(.success(response.results))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
    func fetchSimilarMovies(movieID: Int, completion: @escaping (Result<[Movie], Error>) -> Void) {
        let urlString = "https://api.themoviedb.org/3/movie/\(movieID)/similar?api_key=\(apiKey)"
        
        fetchData(urlString: urlString) { (result: Result<MovieResponse, Error>) in
            switch result {
            case .success(let response):
                completion(.success(response.results))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    
    

}


struct MovieResponse: Codable {
    let results: [Movie]
}

struct GenreResponse: Codable {
    let genres: [Genre]
}
