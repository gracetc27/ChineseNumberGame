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
        // TODO
    }
}
