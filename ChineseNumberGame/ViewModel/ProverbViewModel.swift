//
//  ProverbViewModel.swift
//  ChineseNumberGame
//
//  Created by Grace couch on 19/02/2025.
//

import Foundation

@MainActor
@Observable
class ProverbViewModel {
    private let urlString = "https://chinese-proverbs.onrender.com/api/proverbs/random"
    private let service: any ProverbServiceProtocol

    var proverbModel: Result<Proverb, ProverbError>?

    init(service: any ProverbServiceProtocol) {
        self.service = service
    }

    func getRandomQuote() async {
        await getQuote(urlString: urlString)
    }


    private func getQuote(urlString: String) async {
        do throws(ProverbError) {
            proverbModel = .success(try await service.getQuote(urlString: urlString))
        } catch {
            proverbModel = .failure(error)
        }
    }
}
