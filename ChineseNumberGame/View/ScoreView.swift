//
//  ScoreView.swift
//  ChineseNumberGame
//
//  Created by Grace couch on 12/02/2025.
//

import SwiftUI

struct ScoreView: View {
    var maxTurns: Int
    var score: Int
    var body: some View {
        Text("Score: \(score)/\(maxTurns)")
            .font(.largeTitle.bold())
            .foregroundStyle(.white)
            .padding()
            .background(Capsule().fill(Color.black))
    }
}

#Preview {
    ScoreView(maxTurns: 5, score: 3)
}
