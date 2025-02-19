//
//  ProverbViewModel.swift
//  ChineseNumberGame
//
//  Created by Grace couch on 19/02/2025.
//

import Foundation


@Observable
class ProverbViewModel {
    var proverbModel: Proverb = Proverb.defaultProverb()

    let urlString = "https://chinese-proverbs.onrender.com/api/proverbs/random"

    private func getQuote(urlString: String) {
        guard let url = URL(string: urlString) else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            let decoder = JSONDecoder()
            if let error {
                print(error.localizedDescription)
            }
            guard let data = data else { return }
            do {
                let newProverb = try decoder.decode(Proverb.self, from: data)
                DispatchQueue.main.async {
                    self.proverbModel = newProverb
                }
            } catch {
                print(data.description)
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}
