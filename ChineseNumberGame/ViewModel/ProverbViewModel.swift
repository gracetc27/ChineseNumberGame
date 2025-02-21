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
    var proverbModel: Result<Proverb, ProverbError>?
    let service = ProverbService()

    let urlString = "https://chinese-proverbs.onrender.com/api/proverbs/random"

    func getRandomQuote() {
        getQuote(urlString: urlString)
    }


    private func getQuote(urlString: String) {
        Task {
            do throws(ProverbError) {
                proverbModel = .success(try await service.getQuote(urlString: urlString))
            } catch {
                proverbModel = .failure(error)
            }
        }
    }
}
