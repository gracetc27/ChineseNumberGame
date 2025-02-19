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
    @State private var translation = false
    @State private var angle = 45.0
    @State private var spacing = 5.0

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
                    VStack(spacing: spacing) {
                        Text("line")
                            .foregroundStyle(.red)
                        Text("line")
                            .foregroundStyle(.yellow)
                        Text("line")
                            .foregroundStyle(.orange)
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(LinearGradient(colors: [.black, .gray], startPoint: .topLeading, endPoint: .bottomTrailing))
                            .opacity(opacity)
                    )
                }
                .font(.title.bold())
                .multilineTextAlignment(.center)
                .padding()
                .scaleEffect(scale)
                .rotation3DEffect(Angle(degrees: angle), axis: (x: 1.0, y: 0.0, z: 0.0))


            }
        }
    }
}

#Preview {
    SplashScreenView(isPresented: .constant(true))
}
