//
//  MovieCard.swift
//  swiftui fase1
//
//  Created by Pinto, Santiago (Apprentice Developer) on 14/03/2025.
//

import SwiftUI

struct TopRatedMovieCard: View {
    let movie: Movie
    @State private var gradientColors: [Int: Color] = [:]

    var body: some View {
        ZStack(alignment: .bottom) {
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w400/\(movie.posterPath ?? "")")) { phase in
                switch phase {
                case .success(let image):
                    image.resizable()
                        .scaledToFill()
                        .onAppear {
                            getGradient(for: movie, uiImage: image.asUIImage())
                        }
                case .failure(_):
                    Color.gray
                default:
                    ProgressView()
                }
            }
            .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.width)
            .clipped()
            .gradientOverlay(color: gradientColors[movie.id] ?? .black.opacity(0.5), height: UIScreen.main.bounds.width * 0.4)
            .cornerRadius(32)

            
            Text(movie.title)
                .font(.title2)
                .bold()
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .lineLimit(3)
                .padding(.bottom, 30)
                .shadow(radius: 5)
                .frame(width: UIScreen.main.bounds.width * 0.6)
        }
    }

    private func getGradient(for movie: Movie, uiImage: UIImage?) {
        guard let uiImage = uiImage else { return }

        if let averageColor = AverageColorUtility.getAverageColor(for: uiImage, side: .bottom) {
            gradientColors[movie.id] = Color(averageColor)
        } else {
            gradientColors[movie.id] = .black.opacity(0.5)
        }
    }
}
