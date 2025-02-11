//
//  Game.swift
//  ChineseNumberGame
//
//  Created by Grace couch on 11/02/2025.
//
import Foundation

struct Game {
    let maxTurns: Int
    var score: Int
    var volume: Float
    var currentTurn: Int
    var correctAnswer: Int
    var allAnswers: [Int]
    var gameComplete: Bool {
        currentTurn >= maxTurns
    }
    var gameOver: Bool {
        score < 0 || gameComplete
    }

    mutating func increaseScore() {
        score += 1
    }

    mutating func increaseTurn() {
        currentTurn += 1
    }
    mutating func generateNewProblem() {
        allAnswers = [6, 15, 88, 4]

        for index in allAnswers.indices {
            allAnswers[index] = Int.random(in: 1...99)
        }
        correctAnswer = allAnswers[0]
        allAnswers = allAnswers.shuffled()
    }

    static var defaultGame: Game {
        .init(
            maxTurns: 5,
            score: 4,
            volume: 0.5,
            currentTurn: 3,
            correctAnswer: 6,
            allAnswers: [6, 15, 88, 4])

    }
}

