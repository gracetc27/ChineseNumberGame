//
//  Chinese.swift
//  ChineseNumberGame
//
//  Created by Grace couch on 12/02/2025.
//
import Foundation


struct Chinese {
    static func num99toChinese(num: Int) -> (chinese: String, pinyin: String)? {
        let chineseWithPinyin: [(chinese: String, pinyin: String)] = [
            ("零","líng"),
            ("一", "yī"),
            ("二", "èr"),
            ("三", "sān"),
            ("四", "sì"),
            ("五", "wǔ"),
            ("六", "liù"),
            ("七", "qī"),
            ("八", "bā"),
            ("九", "jiǔ"),
            ("十", "shí")
        ]
        let emptyZeroChinese: [(chinese: String, pinyin: String)] = [
            ("",""),
            ("一", "yī"),
            ("二", "èr"),
            ("三", "sān"),
            ("四", "sì"),
            ("五", "wǔ"),
            ("六", "liù"),
            ("七", "qī"),
            ("八", "bā"),
            ("九", "jiǔ"),
            ("十", "shí")
        ]
        var chineseResult: String
        var pinyinResult: String

        switch (num) {
        case 0...10:
            chineseResult = chineseWithPinyin[num].chinese
            pinyinResult = chineseWithPinyin[num].pinyin
        case 11...19:
            chineseResult = "十\(chineseWithPinyin[num % 10].chinese)"
            pinyinResult = "shí \(chineseWithPinyin[num % 10].pinyin)"
        case 20...99:
            let digit = num / 10
            let tenth = num % 10
            chineseResult = "\(chineseWithPinyin[digit].chinese)十\(emptyZeroChinese[tenth].chinese)"
            pinyinResult = "\(chineseWithPinyin[digit].pinyin) shí \(emptyZeroChinese[tenth].pinyin)"
        default:
            return nil
        }
        return (chineseResult, pinyinResult)
    }
}
