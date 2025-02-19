//
//  SettingsView.swift
//  ChineseNumberGame
//
//  Created by Grace couch on 19/02/2025.
//

import SwiftUI

struct SettingsView: View {
    @Environment(GameViewModel.self) var gVM
    @State var volume: Float
    @Binding var showSettings: Bool
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section("Audio Settings") {
                        Text("Volume: \(volume.formatted())")
                        Slider(value: $volume, in: 0...1, step: 0.1)
                    }
                }
            }
            .navigationTitle("Game Settings")
            .toolbar {
                Button("Done") {
                    gVM.gameModel.volume = volume
                    showSettings.toggle()
                }
            }
        }
    }
}

#Preview {
    SettingsView(volume: 0.7, showSettings: .constant(true))
        .environment(GameViewModel())
}
