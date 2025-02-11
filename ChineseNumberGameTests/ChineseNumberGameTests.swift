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

}
