//
//  GearIconView.swift
//  ChineseNumberGame
//
//  Created by Grace couch on 12/02/2025.
//

import SwiftUI

struct GearIconView: View {
    @Binding var showSettings: Bool
    var body: some View {
        VStack {
            HStack {
                Button {
                    showSettings = true
                } label: {
                    Image(systemName: "gearshape.fill")
                        .imageScale(.large)
                        .foregroundStyle(.black)
                        .padding()
                }

                Spacer()
            }
            
            Spacer()
        }
    }
}

#Preview {
    GearIconView(showSettings: .constant(true))
}
