//
//  Int-Randomness.swift
//  ChineseNumberGame
//
//  Created by Grace couch on 12/02/2025.
//

import Foundation


extension Int {
    static func getUniqueRandomNumbers(count: Int, lower: Int, upper: Int) -> [Int] {
        if count > (upper - lower) + 1 || lower > upper {
            return []
        }
        var result = [Int]()

        while result.count < count {
            let randomNumber = Int.random(in: lower...upper)
            if !result.contains(randomNumber) {
                result.append(randomNumber)
            }
        }
        return result
    }
}
