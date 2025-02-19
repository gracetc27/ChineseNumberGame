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
    var proverbModel: Proverb = Proverb.defaultProverb()

    let urlString = "https://chinese-proverbs.onrender.com/api/proverbs/random"

    func getRandomQuote() {
        getQuote(urlString: urlString)
    }

    private func getQuote(urlString: String) {
        guard let url = URL(string: urlString) else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        Task {
            do {
                let (data, _) = try await URLSession.shared.data(for: request)
                let decoder = JSONDecoder()
                do {
                    let newProverb = try decoder.decode(Proverb.self, from: data)
                    self.proverbModel = newProverb
                } catch {
                    print(error.localizedDescription)
                    print(data.description)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
