////
////  TopRatedMoviesView.swift
////  swiftui fase1
////
////  Created by Pinto, Santiago (Apprentice Developer) on 13/03/2025.
////
//
//import SwiftUI
//
//struct TopRatedMoviesView: View {
//    @StateObject private var viewModel = HomeViewModel()
//
//    var body: some View {
//        VStack(alignment: .leading, spacing: 0) {
//            Text("Top Rated")
//                .font(.system(size: 28, weight: .bold, design: .default))
//                .padding(.vertical, 10)
//                .padding(.horizontal, 20)
//                .foregroundColor(.yellow)
//                .frame(maxWidth: .infinity, alignment: .leading)
//
//            ScrollView(.horizontal, showsIndicators: false) {
//                HStack(spacing: 16) {
//                    Spacer().frame(width: 0)
//
//                    ForEach(viewModel.topRatedMovies, id: \.id) { movie in
//                        NavigationLink(destination: MovieDetails(movieID: movie.id)) {
//                            VStack {
//                                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w400/\(movie.posterPath ?? "")")) { image in
//                                    image.resizable().scaledToFill()
//                                } placeholder: {
//                                    ProgressView()
//                                }
//                                .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.width )
//                                .cornerRadius(32)
//                                .clipped()
//
//                                Text(movie.title)
//                                    .font(.subheadline)
//                                    .lineLimit(1)
//                                    .foregroundColor(Color.white)
//                                    .bold()
//                                    .frame(width: 120)
//                            }
//                        }
//                    }
//                }
//                .padding(.horizontal)
//            }
//        }
//        .onAppear {
//            viewModel.fetchTopRatedMovies()
//        }
//    }
//}
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
                            .padding(.horizontal, 20)
                    }
                }
            }
            tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .frame(height: UIScreen.main.bounds.width * 1.2)
            .padding(.horizontal, -20)
            .onAppear {
                viewModel.fetchTopRatedMovies()
            }


//            ScrollView(.horizontal, showsIndicators: false) {
//                HStack(spacing: 16) {
//                    ForEach(viewModel.topRatedMovies, id: \.id) { movie in
//                        NavigationLink(destination: MovieDetails(movieID: movie.id)) {
//                            TopRatedMovieCard(movie: movie)
//                        }
//                    }
//                }
//                .padding(.horizontal)
//            }
//            .onAppear {
//                viewModel.fetchTopRatedMovies()
//            }
        }
    }
}



#Preview {
    TopRatedMoviesView()
}
