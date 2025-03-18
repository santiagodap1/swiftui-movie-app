//
//  BottomNavigationBar.swift
//  fase1SwiftUI
//
//  Created by Pinto, Santiago (Apprentice Developer) on 12/03/2025.
//

#Preview{
    BottomNavigationBar()
}

import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedTab: Int

    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.black.opacity(0.9))
                .frame(width: UIScreen.main.bounds.width * 0.8, height: 60)
                
                

            HStack(spacing: UIScreen.main.bounds.width * 0.3) {
                
                Button(action: { selectedTab = 0 }) {
                    VStack {
                        Image(systemName: "house.fill")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundColor(selectedTab == 0 ? .white : .gray)
                        Text("Home")
                            .font(.caption)
                            .foregroundColor(selectedTab == 0 ? .white : .gray)
                    }
                }

                
                Button(action: { selectedTab = 1 }) {
                    VStack {
                        Image(systemName: "film")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundColor(selectedTab == 1 ? .white : .gray)
                        Text("Seaarch movies")
                            .font(.caption)
                            .foregroundColor(selectedTab == 1 ? .white : .gray)
                    }
                }
            }
        }
        .padding(.bottom, 20)
        
    }
}




struct BottomNavigationBar: View {
    @State private var selectedTab = 0

    var body: some View {
        ZStack {
          
            if selectedTab == 0 {
                HomeView()
            } else {
                MoviesList()
            }

        VStack {
                        
            CustomTabBar(selectedTab: $selectedTab)
                
            .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height/1.13)
            }
        }
    }
}
