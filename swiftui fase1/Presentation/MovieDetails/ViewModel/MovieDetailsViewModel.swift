//
//  MovieDetailsViewModel.swift
//  swiftui fase1
//
//  Created by Pinto, Santiago (Apprentice Developer) on 17/03/2025.
//

import Foundation

class MovieDetailsViewModel: ObservableObject {
    
    @Published var similarMovies: [Movie] = []
     @Published var isLoading: Bool = false
     private let repository = MovieRepository()

     func fetchSimilarMovies(movieID: Int) {
         isLoading = true
         repository.getSimilarMovies(movieID: movieID) { [weak self] result in
             DispatchQueue.main.async {
                 self?.isLoading = false
                 switch result {
                 case .success(let movies):
                     self?.similarMovies = movies
                 case .failure(let error):
                     print("Error fetching similar movies: \(error)")
                 }
             }
         }
     }}
