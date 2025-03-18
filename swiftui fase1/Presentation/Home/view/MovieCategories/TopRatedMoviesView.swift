////
////  TopRatedMoviesView.swift
////  swiftui fase1
////
////  Created by Pinto, Santiago (Apprentice Developer) on 13/03/2025.
////

import SwiftUI
import UIKit

struct TopRatedMoviesView: View {
    @StateObject private var viewModel = HomeViewModel()
    @State private var gradientColors: [Int: Color] = [:]

    var body: some View {
        VStack(alignment: .leading) {
            Text("Top Rated")
                .font(.system(size: 28, weight: .bold))
                .foregroundColor(.yellow)
                .padding(.horizontal, 20)
            
            TabView {
                ForEach(viewModel.topRatedMovies, id: \.id) { movie in
                    NavigationLink(destination: MovieDetails(movieID: movie.id)) {
                        TopRatedMovieCard(movie: movie)
                            .frame(width: UIScreen.main.bounds.width * 0.85)
                            .cornerRadius(16)
                            
                            
                    }
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
            
            .frame(height: UIScreen.main.bounds.width * 1.2)
            
            .onAppear {
                viewModel.fetchTopRatedMovies()
            }

        }
    }
}



#Preview {
    TopRatedMoviesView()
}
