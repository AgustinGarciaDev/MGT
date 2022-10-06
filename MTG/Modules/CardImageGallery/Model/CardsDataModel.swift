//
//  CardDataModel.swift
//  MTG
//
//  Created by Agustinch on 04/10/2022.
//

import Foundation

// MARK: - Welcome
struct CardsDataModel: Decodable {
    let object: String?
    let totalCards: Int?
    let hasMore: Bool?
    let next_page: String?
    let data: [CardModel]?
}
