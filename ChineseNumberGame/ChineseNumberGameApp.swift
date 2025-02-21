//
//  ChineseNumberGameApp.swift
//  ChineseNumberGame
//
//  Created by Grace couch on 11/02/2025.
//

import SwiftUI

@main
struct ChineseNumberGameApp: App {
    @State private var gVM = GameViewModel()
    var body: some Scene {
        WindowGroup {
            ContainerView()
                .environment(gVM)
        }
    }
}
