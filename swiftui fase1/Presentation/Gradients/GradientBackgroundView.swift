//
//  GradientBackgroundVier.swift
//  swiftui fase1
//
//  Created by Pinto, Santiago (Apprentice Developer) on 12/03/2025.
//
import SwiftUI

struct GradientBackgroundView: View {
    var body: some View {
        LinearGradient(
            gradient: Gradient(stops: [
                .init(color: Color.white, location: 0),
                .init(color: Color.gray, location: 0.15),
                .init(color: Color.black, location: 0.95)
            ]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .edgesIgnoringSafeArea(.all)
    }
}

