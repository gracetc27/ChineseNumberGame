//
//  ChineseNumberGameTests.swift
//  ChineseNumberGameTests
//
//  Created by Grace couch on 11/02/2025.
//

import Testing
@testable import ChineseNumberGame

struct ChineseNumberGameTests {

    @Test func myMaxTest() async throws {
       // 1) Set up data
        let dataArray = [
            (x: 3, y: 10, z: 7),
            (x: 3, y: 19, z: 75),
            (x: 6, y: 11, z: 7),
            (x: 3, y: 6, z: 9),
            (x: 3, y: 4, z: 7),
            (x: 15, y: 10, z: 7)
        ]
        // 2) Expected result
        let expectedResults: [Int] = [10, 75, 11, 9, 7, 15]

        // 3) Test
        for i in 0..<dataArray.count {
            let data = dataArray[i]
            let expectedResult = expectedResults[i]
            let evaluatedResult = myMax(x: data.x, y: data.y, z: data.z)
            #expect(expectedResult == evaluatedResult)
        }
    }

    @Test func chineseTest() async throws {
        let nums = [0, 8, 17, 20, 33, 40, 54, 63, 71, 87, 99]
        let nilNums = [-10, 100, -1, 110, 104]

        let expectedResults: [(chinese: String, pinyin: String)?] = [
            ("零","líng"),
            ("八", "bā"),
            ("十七", "shí qī"),
            ("二十", "èr shí"),
            ("三十三", "sān shí sān"),
            ("四十", "sì shí"),
            ("五十四", "wǔ shí sì"),
            ("六十三", "liù shí sān"),
            ("七十一", "qī shí yī"),
            ("八十七", "bā shí qī"),
            ("九十九", "jiǔ shí jiǔ")
        ]

        for i in 0..<nums.count {
            let number1 = Int.num99toChinese(num: nums[i])
            let number2 = expectedResults[i]
            if let number1, let number2 {
                #expect(number1.chinese == number2.chinese)
            }
        }
        for num in nilNums {
            #expect(Int.num99toChinese(num: num) == nil)
        }
    }

}
