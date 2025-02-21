//
//  SplashScreenView.swift
//  ChineseNumberGame
//
//  Created by Grace couch on 19/02/2025.
//

import SwiftUI

struct SplashScreenView: View {
    @Binding var isPresented: Bool

    @State private var opacity = 0.0
    @State private var scale = CGSize(width: 0.5, height: 0.5)
    @State private var moveUp = false
    @State private var angle = 45.0
    @State private var spacing = 5.0
    @State private var hasAnimated = false

    var vm = ProverbViewModel()



    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Color.black
                    .ignoresSafeArea()

                Image("china1")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .frame(width: proxy.size.width, height: proxy.size.height)
                    .opacity(opacity)

                VStack {
                    if let result = vm.proverbModel {
                        switch result {
                        case .success(let proverb):
                            TextSubView(spacing: spacing, scale: scale, angle: angle, opacity: opacity, text1: proverb.proverb, text2: proverb.pinyin, text3: proverb.translation)
                        case .failure(let failure):
                            ProverbFailureView(scale: scale, angle: angle, opacity: opacity, error: failure.localizedDescription)
                        }
                    } else {
                        ProgressView()
                            .tint(.white)
                    }
                    if moveUp {
                        Spacer()
                    }
                }
                VStack {
                    Spacer()
                    Button("Skip to game...") {
                        withAnimation {
                            isPresented.toggle()
                        }
                    }
                    .font(.title2.bold())
                    .foregroundStyle(.white)
                    .padding()
                    .background(Capsule()
                        .fill(.ultraThinMaterial))
                }
            }
        }
        .onChange(of: vm.proverbModel) { _, _ in
            if !hasAnimated {
                Task {
                    withAnimation(.easeInOut(duration: 2.5)) {
                        opacity = 0.8
                        angle = 0
                        scale = CGSize(width: 1.0, height: 1.0)
                    }
                    try? await Task.sleep(for: .seconds(1.5))
                        withAnimation(.easeInOut(duration: 2.5)) {
                            moveUp = true
                            spacing = 50
                        }
                }
                hasAnimated = true
            }
        }
        .onAppear {
            vm.getRandomQuote()
        }
    }
}

#Preview {
    SplashScreenView(isPresented: .constant(true))
}


