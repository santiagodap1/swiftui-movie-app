//
//  Movies.swift
//  fase1
//
//  Created by Pinto, Santiago (Apprentice Developer) on 20/02/2025.
//

struct Movie: Codable {
    let id: Int
    let title: String
    let overview: String
    let posterPath: String?
    let backdropPath: String?
    let releaseDate: String?
    let genres: [Genre]?
    let runtime: Int?
    let originalLanguage: String?
    let originalTitle: String?
    let popularity: Double?
    let voteAverage: Double?
    let voteCount: Int?

    let revenue: Int?
    let budget: Int?
    let status: String?
    let homepage: String?

    enum CodingKeys: String, CodingKey {
        case id, title, overview, runtime, revenue, budget, status, homepage, popularity
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case releaseDate = "release_date"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case genres
        
    }
}
