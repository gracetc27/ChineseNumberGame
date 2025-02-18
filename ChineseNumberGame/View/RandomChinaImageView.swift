//
//  RandomChinaImageView.swift
//  ChineseNumberGame
//
//  Created by Grace couch on 18/02/2025.
//

import SwiftUI

struct RandomChinaImageView: View {
    var body: some View {
        Image([.china1, .china2, .china3, .china4, .china5, .china6, .china7].randomElement() ?? .china1)
            .resizable()
            
    }
}

#Preview {
    RandomChinaImageView()
}
