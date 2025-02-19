//
//  Proverb.swift
//  ChineseNumberGame
//
//  Created by Grace couch on 19/02/2025.
//

import Foundation


struct Proverb: Codable {
    let id: String
    let proverb: String
    let pinyin: String
    let translation: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case proverb
        case pinyin
        case translation
    }

    static func defaultProverb() -> Proverb {
        Proverb(id: "63e6ae053bd28e8c186fdf9c", proverb: "龙马精神。", pinyin: "Lóng mǎ jīng shén", translation: "A dragon's and a horse's spirit.")

    }
}
