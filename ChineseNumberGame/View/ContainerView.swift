//
//  ContainerView.swift
//  ChineseNumberGame
//
//  Created by Grace couch on 19/02/2025.
//

import SwiftUI

struct ContainerView: View {
    @State private var isSplashPresented = true
    var body: some View {
        if isSplashPresented {
            SplashScreenView(isPresented: $isSplashPresented)
                .disabled(!isSplashPresented)
        } else {
            MainView()
        }
    }
}

#Preview {
    ContainerView()
        .environment(GameViewModel())
}
