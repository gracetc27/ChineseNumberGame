//
//  ProverbService.swift
//  ChineseNumberGame
//
//  Created by Grace couch on 21/02/2025.
//

import Foundation

enum ProverbError: Error, Equatable {
    case invalidURL
    case noData
    case decodingFailed
}

struct ProverbService: ProverbServiceProtocol {
    func getQuote(urlString: String) async throws(ProverbError) -> Proverb {
        guard let url = URL(string: urlString) else {
            throw ProverbError.invalidURL
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let decoder = JSONDecoder()
            do {
                let newProverb = try decoder.decode(Proverb.self, from: data)
                return newProverb
            } catch {
                throw ProverbError.noData
            }
        } catch {
            throw ProverbError.decodingFailed
        }
    }
}
    
    


