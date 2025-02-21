//
//  ProverbServiceProtocol.swift
//  ChineseNumberGame
//
//  Created by Grace couch on 21/02/2025.
//

import Foundation

protocol ProverbServiceProtocol {
    func getQuote(urlString: String) async throws(ProverbError) -> Proverb
}
