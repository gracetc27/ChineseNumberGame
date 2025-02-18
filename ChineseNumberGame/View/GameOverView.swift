//
//  GameOverView.swift
//  ChineseNumberGame
//
//  Created by Grace couch on 18/02/2025.
//

import SwiftUI

struct GameOverView: View {
    @Environment(GameViewModel.self) var gVM

    let color: Color

    var body: some View {
        ZStack {
            RandomChinaImageView()
                .scaledToFill()
                .ignoresSafeArea()

            VStack {
                VStack {
                    Text("Game over!")
                    Text("You scored \(gVM.gameModel.score) out of \(gVM.gameModel.maxTurns)")
                    Text("Tap to replay...")
                        .fontWeight(.thin)
                }
                .padding()
                .font(.title.bold())
                .foregroundStyle(color)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 8))
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(color, lineWidth: 5)
                }
                Spacer()
            }
        }
        .onTapGesture {
            gVM.gameModel.resetGame()
        }
    }
}

#Preview {
    GameOverView(color: .blue)
        .environment(GameViewModel())
}
