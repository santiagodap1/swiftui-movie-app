//
//  MoviesListSwiftUI.swift
//  fase1
//
//  Created by Pinto, Santiago (Apprentice Developer) on 10/03/2025.
//

import SwiftUI

struct MovieDetails: View {
    let movieID: Int
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var viewModel = MoviesListViewModel()

    var body: some View {
        VStack(spacing: 0) {
           

            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500/\(viewModel.selectedMovie?.posterPath ?? "")")) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width, height: 400)
                    .clipped()
            } placeholder: {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .yellow))
                    .frame(width: UIScreen.main.bounds.width, height: 400)
                    
            }

            VStack(alignment: .leading, spacing: 8) {
                Text(viewModel.selectedMovie?.title ?? "Loading...")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)

                Text(viewModel.selectedMovie?.overview ?? "")
                    .font(.body)
                    .lineLimit(5)
                    .frame(height: 120)
                    .foregroundColor(.white)
            }
            .padding()
            .frame(maxWidth: .infinity)
            

            Spacer()
        }
        .background(GradientBackgroundView())
        .onAppear {
            viewModel.searchMovie(id: movieID)
        }
    }
}

#Preview {
    MovieDetails(movieID: 3)
}


