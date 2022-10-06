//
//  CardDataModel.swift
//  MTG
//
//  Created by Agustinch on 04/10/2022.
//

import Foundation
// MARK: - Welcome

struct CardsDataModel: Decodable {
    let hasMore: Bool?
    let nextPage: String?
    let object: String?
    let totalCards: Int?
    let data: [CardModel?]
    
    enum CodingKeys: String, CodingKey {
        case hasMore = "has_more"
        case nextPage = "next_page"
        case object, totalCards, data
    }
}
