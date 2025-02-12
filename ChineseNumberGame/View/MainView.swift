//
//  MainView.swift
//  ChineseNumberGame
//
//  Created by Grace couch on 11/02/2025.
//

import SwiftUI

struct MainView: View {
    @Environment(GameViewModel.self) var gVM
    @State private var showSettings = false
    @State private var showPinyin = false
    var body: some View {
        ZStack {
            GearIconView(showSettings: $showSettings)
            VStack {
                ScoreView(maxTurns: gVM.gameModel.maxTurns, score: gVM.gameModel.score)
                Toggle(showPinyin ? "Hide Pinyin" : "Show Pinyin", isOn: $showPinyin.animation())
                    .padding()
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    MainView()
        .environment(GameViewModel())
}
