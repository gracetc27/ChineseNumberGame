//
//  CircleView.swift
//  ChineseNumberGame
//
//  Created by Grace couch on 18/02/2025.
//

import SwiftUI

struct CircleView: View {
    var value: Int
    var answer: Int
    var color: Color
    
    @Environment(GameViewModel.self) var gVM

    var body: some View {
        ZStack {
            Circle()
                .fill(color.gradient)

            Text("\(value)")
                .foregroundStyle(.white)
                .font(.title.bold())
        }
        .onTapGesture {
            if value == answer {
                self.gVM.gameModel.increaseScore()
                self.gVM.playNumberSound(num: value)
            } else {
                self.gVM.randomFailureSound()
            }
            self.gVM.gameModel.increaseTurn()
            self.gVM.gameModel.generateNewProblem()
        }
    }
}

#Preview {
    CircleView(value: 10, answer: 10, color: .cyan)
        .environment(GameViewModel())
}
