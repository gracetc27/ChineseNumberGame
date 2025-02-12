//
//  MainView.swift
//  ChineseNumberGame
//
//  Created by Grace couch on 11/02/2025.
//

import SwiftUI

struct MainView: View {
    @Environment(GameViewModel.self) var gVM
    var body: some View {
        VStack(spacing: 10) {
            Button("play success") {
                gVM.randomSuccessSound()
            }

            Button("play failure") {
                gVM.randomFailureSound()
            }

            Button("3") {
                gVM.playNumberSound(num: 3)
            }

            Button("18") {
                gVM.playNumberSound(num: 18)
            }

            Button("65") {
                gVM.playNumberSound(num: 65)
            }

        }
        .padding()
    }
}

#Preview {
    MainView()
        .environment(GameViewModel())
}
