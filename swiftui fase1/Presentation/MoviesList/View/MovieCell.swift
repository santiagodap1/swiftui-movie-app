//
//  MovieCell-swiftUI.swift
//  fase1
//
//  Created by Pinto, Santiago (Apprentice Developer) on 06/03/2025.
//



import SwiftUI

struct MovieCell: View {
    let movie: Movie

    var body: some View {
        HStack(alignment: .top) {
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w200/\(movie.posterPath ?? "")")) { image in
                image.resizable().scaledToFill()
            } placeholder: {
                ZStack {
                    Color.gray.opacity(0.3)
                    Image(systemName: "photo") 
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.white.opacity(0.7))
                }
            }
            .frame(width: 80, height: 120)
            .clipped()
            .cornerRadius(10)

            VStack(alignment: .leading) {
                if !movie.overview.isEmpty {
                    
                    Text(movie.title)
                        .font(.headline)
                        .foregroundColor(.white)
                        .fontWeight(.bold)

                    Text(movie.overview)
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .lineLimit(3)
                        .frame(maxHeight: 50)
                } else {
                    Spacer()
                    Text(movie.title)
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .center)
                    Spacer()
                }
            }
        }
        .frame(height: 130)
        .padding()
    }
}

