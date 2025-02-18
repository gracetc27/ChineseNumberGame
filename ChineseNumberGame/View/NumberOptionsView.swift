//
//  NumberOptionsView.swift
//  ChineseNumberGame
//
//  Created by Grace couch on 18/02/2025.
//

import SwiftUI

struct NumberOptionsView: View {
    var allAnswers: [Int]
    var correctAnswer: Int
    var body: some View {
        VStack {
            HStack {
                CircleView(value: allAnswers[0], answer: correctAnswer, color: .cyan)
                CircleView(value: allAnswers[1], answer: correctAnswer, color: .pink)
            }
            HStack {
                CircleView(value: allAnswers[2], answer: correctAnswer, color: .indigo)
                CircleView(value: allAnswers[3], answer: correctAnswer, color: .mint)
            }
        }
    }
}

#Preview {
    NumberOptionsView(allAnswers: [10, 14, 32, 65], correctAnswer: 65)
        .environment(GameViewModel())
}
