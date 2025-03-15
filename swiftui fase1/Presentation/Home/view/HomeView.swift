////
////  HomeView.swift
////  fase1SwiftUI
////
////  Created by Pinto, Santiago (Apprentice Developer) on 12/03/2025.
////

#Preview {
    HomeView()
}

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    TopRatedMoviesView()
                    
                    MoviesByGenreView()
                }
                .padding(.top, 10)
            }
            .navigationTitle("Sebastião's app")
            .toolbarBackground(Color.gray.opacity(0.7), for: .navigationBar)
            .background(GradientBackgroundView())
        }
    }
}
