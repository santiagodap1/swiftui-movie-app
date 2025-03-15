//
//  MoviesList-swiftUI.swift
//  fase1
//
//  Created by Pinto, Santiago (Apprentice Developer) on 06/03/2025.
//
import SwiftUI

public struct MoviesList: View {
    @StateObject private var viewModel = MoviesListViewModel()
    @State private var searchText: String = ""

    public var body: some View {
        NavigationView {
            List(viewModel.movies, id: \.id) { movie in
                ZStack {
                    MovieCell(movie: movie)

                    NavigationLink(destination: MovieDetails(movieID: movie.id)) {
                        EmptyView()
                    }
                    .frame(width: 0)
                    .opacity(0)
                }
                .listRowBackground(Color.clear)
                .listRowInsets(EdgeInsets())
                .listRowSeparator(.hidden)
            }
            .searchable(text: $searchText, prompt: "Search Movies")
            
            
            .onChange(of: searchText) {
                viewModel.searchMovies(query: searchText)
            }
            .listStyle(PlainListStyle())
            
            .navigationTitle("Movies")
            
            .background(GradientBackgroundView())
        }
    }

}


#Preview {
    MoviesList()
}
