//
//  TextSubView.swift
//  ChineseNumberGame
//
//  Created by Grace couch on 19/02/2025.
//


import SwiftUI

struct TextSubView: View {
    let spacing: Double
    let scale: CGSize
    let angle: Double
    let opacity: Double
    let text1: String
    let text2: String
    let text3: String
    var body: some View {
        VStack(spacing: spacing) {
            Text(text1)
                .opacity(1.0)
            Text(text2)
                .opacity(0.9)
            Text(text3)
                .opacity(0.8)
        }
        .foregroundStyle(.white)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(LinearGradient(colors: [.black, .gray], startPoint: .topLeading, endPoint: .bottomTrailing))
                .opacity(opacity)
        )
        .font(.title.bold())
        .multilineTextAlignment(.center)
        .padding()
        .scaleEffect(scale)
        .rotation3DEffect(Angle(degrees: angle), axis: (x: 1.0, y: 0.0, z: 0.0))
    
    }
}


#Preview {
    TextSubView(spacing: 5, scale: CGSize(width: 0.8, height: 0.8), angle: 45.0, opacity: 1.0, text1: "line1", text2: "line2", text3: "line3")
}
