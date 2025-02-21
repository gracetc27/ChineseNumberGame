//
//  ProverbFailureView.swift
//  ChineseNumberGame
//
//  Created by Grace couch on 21/02/2025.
//

import SwiftUI

struct ProverbFailureView: View {
    let scale: CGSize
    let angle: Double
    let opacity: Double
    let error: String
    var body: some View {
        Text("Unable to show proverb: \(error)")
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
    ProverbFailureView(scale: CGSize(width: 0.8, height: 0.8), angle: 45.0, opacity: 1.0, error: "bla bla bla")
}
