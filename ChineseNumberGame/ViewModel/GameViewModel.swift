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
    var audioPlayer: AVAudioPlayer?

    func randomSuccessSound() {
        playSound(name: ["awesome", "bell", "correct", "whoop", "yes"].randomElement() ?? "correct")
    }

    func randomFailureSound() {
        playSound(name: ["incorrectAnswer", "OhNo", "weak"].randomElement() ?? "incorrectAnswer")
    }

    func digitSound(num: Int) {
        playSound(name: ["awesome", "bell", "correct", "whoop", "yes"].randomElement() ?? "correct")
    }

    private func digitToName(digit: Int) -> String? {
        return nil
    }
    private func playDigitSound(num: Int) {

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
