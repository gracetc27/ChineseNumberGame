//
//  GameViewModel.swift
//  ChineseNumberGame
//
//  Created by Grace couch on 12/02/2025.
//
import AVFoundation
import SwiftUI


@Observable
class GameViewModel {
    var gameModel: Game = .defaultGame
    private var audioPlayer: AVAudioPlayer?

    func randomSuccessSound() {
        playSound(name: ["awesome", "bell", "correct", "whoop", "yes"].randomElement() ?? "correct")
    }

    func randomFailureSound() {
        playSound(name: ["incorrectAnswer", "OhNo", "weak"].randomElement() ?? "incorrectAnswer")
    }

    func playNumberSound(num: Int) {
        switch(num) {
        case 0...9:
            digitSound(num: num)
        case 10...19:
            digitSound(num: 10)
            digitSound(num: num % 10)
        case 20...99:
            let digit = num % 10
            let tenth = num / 10
            digitSound(num: tenth)
            digitSound(num: 10)
            if digit != 0 {
                digitSound(num: digit)
            }
        default:
            playSound(name: "bell")
        }
    }


    private func digitToName(digit: Int) -> String? {
        let digitNames = [
            "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten"
        ]

        if digit >= 0 && digit <= 10 {
            return digitNames[digit]
        } else {
            return nil
        }
    }

    private func digitSound(num: Int) {
        playSound(name: digitToName(digit: num) ?? "bell")
    }

    private func playSound(name: String, ext: String = "aiff") {
        guard let soundURL = Bundle.main.url(forResource: name, withExtension: ext) else {
            return
        }
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            audioPlayer?.prepareToPlay()
            audioPlayer?.volume = gameModel.volume
            audioPlayer?.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
