//
//  InfoPill.swift
//  swiftui fase1
//
//  Created by Pinto, Santiago (Apprentice Developer) on 17/03/2025.
//
import SwiftUI
struct InfoPill: View {
    let text: String
    let systemImage: String

    var body: some View {
        HStack {
            Image(systemName: systemImage)
                .foregroundColor(.yellow)
            Text(text)
                .foregroundColor(.white)
                .font(.caption)
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 4)
        .background(Color.black.opacity(0.7))
        .cornerRadius(10)
    }
}
