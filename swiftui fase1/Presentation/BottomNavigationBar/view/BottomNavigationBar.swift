//
//  BottomNavigationBar.swift
//  fase1SwiftUI
//
//  Created by Pinto, Santiago (Apprentice Developer) on 12/03/2025.
//
import SwiftUI

struct BottomNavigationBar: View {
    init() {
        UITabBar.appearance().barTintColor = UIColor.black
        
    }

    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }

            MoviesList()
                .tabItem {
                    Label("Movies", systemImage: "film")
                }
        }
    }
}

#Preview {
    BottomNavigationBar()
}

