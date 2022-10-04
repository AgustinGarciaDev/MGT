//
//  CardModel.swift
//  MTG
//
//  Created by Agustinch on 04/10/2022.
//

import Foundation

// MARK: - CardModel
struct CardModel: Decodable {
    let object, id: String
    //let multiverseIDS: [Int]
    let name, printedName, lang, releasedAt: String
    let uri, scryfallURI: String
    let layout: String
    let highresImage: Bool
    let imageStatus: String
    let imageUris: ImageUris
    let manaCost: String
    let cmc: Int
    let typeLine, printedTypeLine, oracleText, printedText: String
    let power, toughness: String
    let colors, colorIndicator, colorIdentity: [String]
    //  let keywords: [Any?]
    let allParts: [AllPart]
    let legalities: Legalities
    let games: [String]
    let reserved, foil, nonfoil: Bool
    let finishes: [String]
    let oversized, promo, reprint, variation: Bool
    let setID, datumSet, setName, setType: String
    let setURI, setSearchURI, scryfallSetURI, rulingsURI: String
    let printsSearchURI: String
    let collectorNumber: String
    let digital: Bool
    let rarity, cardBackID, artist: String
    let artistIDS: [String]
    let illustrationID, borderColor, frame: String
    let frameEffects: [String]
    let securityStamp: String
    let fullArt, textless, booster, storySpotlight: Bool
    let edhrecRank: Int
    let prices: Prices
    let relatedUris: RelatedUris
    let purchaseUris: PurchaseUris
}

// MARK: - AllPart
struct AllPart: Decodable {
    let object, id, component, name: String
    let typeLine: String
    let uri: String
}

// MARK: - ImageUris
struct ImageUris: Decodable {
    let small, normal, large: String
    let png: String
    let artCrop, borderCrop: String
}

// MARK: - Legalities
struct Legalities: Decodable {
    let standard, future, historic, gladiator: String
    let pioneer, explorer, modern, legacy: String
    let pauper, vintage, penny, commander: String
    let brawl, historicbrawl, alchemy, paupercommander: String
    let duel, oldschool, premodern: String
}

// MARK: - Prices
struct Prices: Decodable {
    let usd, usdFoil, usdEtched, eur: String?
    let eurFoil, tix: String?
}

// MARK: - PurchaseUris
struct PurchaseUris: Decodable {
    let tcgplayer, cardmarket, cardhoarder: String
}

// MARK: - RelatedUris
struct RelatedUris: Decodable {
    let gatherer: String
    let tcgplayerInfiniteArticles, tcgplayerInfiniteDecks, edhrec: String
}
