//
//  ChineseNumberGameTests.swift
//  ChineseNumberGameTests
//
//  Created by Grace couch on 11/02/2025.
//

import Testing
@testable import ChineseNumberGame

struct ChineseNumberGameTests {

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

    @Test
    func successfulGetProverbUpdatesModelProperty() async throws {
        let sut = await ProverbViewModel(service: FakeProverbSuccessService())
        await #expect(sut.proverbModel == nil)

        await sut.getRandomQuote()
        let expected = Proverb(id: "id", proverb: "proverb", pinyin: "pinyin", translation: "translation")
        await #expect(sut.proverbModel == .success(expected))
    }

    @Test
    func failedGetProverbUpdatesModelProperty() async throws {
        let sut = await ProverbViewModel(service: FakeProverbFailureService())
        await #expect(sut.proverbModel == nil)

        await sut.getRandomQuote()
        let expected = ProverbError.noData
        await #expect(sut.proverbModel == .failure(expected))

    }

}


struct FakeProverbSuccessService: ProverbServiceProtocol {
    func getQuote(urlString: String) async throws(ProverbError) -> Proverb {
        Proverb(id: "id", proverb: "proverb", pinyin: "pinyin", translation: "translation")
    }
}

struct FakeProverbFailureService: ProverbServiceProtocol {
    func getQuote(urlString: String) async throws(ProverbError) -> Proverb {
        throw ProverbError.noData
    }
}
