//
//  CardModel.swift
//  MTG
//
//  Created by Agustinch on 04/10/2022.
//

import Foundation

// MARK: - CardModel
struct CardModel: Decodable {
    let object, id: String?
    let name, lang, releasedAt: String?
    let uri, scryfallURI: String?
    let layout: String?
    let highresImage: Bool?
    let imageStatus: String?
    let imageUris: ImageUris?
    let manaCost: String?
    let cmc: Int?
    let typeLine, printedTypeLine, oracleText, printedText: String?
    let power, toughness: String?
    let colors, colorIndicator, colorIdentity: [String]?
    let keywords: [String]?
    let allParts: [AllPart]?
    let legalities: Legalities?
    let games: [String]?
    let reserved, foil, nonfoil: Bool?
    let finishes: [String]?
    let oversized, promo, reprint, variation: Bool?
    let setID, datumSet, setName, setType: String?
    let setURI, setSearchURI, scryfallSetURI, rulingsURI: String?
    let printsSearchURI: String?
    let collectorNumber: String?
    let digital: Bool?
    let rarity, cardBackID, artist: String?
    let artistIDS: [String]?
    let illustrationID, borderColor, frame: String?
    let frameEffects: [String]?
    let securityStamp: String?
    let fullArt, textless, booster, storySpotlight: Bool?
    let edhrecRank: Int?
    let prices: Prices?
    let relatedUris: RelatedUris?
    let purchaseUris: PurchaseUris?

    enum CodingKeys: String, CodingKey {
        case object, id
        case name
        case lang
        case releasedAt = "released_at"
        case uri
        case scryfallURI = "scryfall_uri"
        case layout
        case highresImage = "highres_image"
        case imageStatus = "image_status"
        case imageUris = "image_uris"
        case manaCost = "mana_cost"
        case cmc
        case typeLine = "type_line"
        case printedTypeLine = "printed_type_line"
        case oracleText = "oracle_text"
        case printedText = "printed_text"
        case power, toughness, colors
        case colorIndicator = "color_indicator"
        case colorIdentity = "color_identity"
        case keywords
        case allParts = "all_parts"
        case legalities, games, reserved, foil, nonfoil, finishes, oversized, promo, reprint, variation
        case setID = "set_id"
        case datumSet = "set"
        case setName = "set_name"
        case setType = "set_type"
        case setURI = "set_uri"
        case setSearchURI = "set_search_uri"
        case scryfallSetURI = "scryfall_set_uri"
        case rulingsURI = "rulings_uri"
        case printsSearchURI = "prints_search_uri"
        case collectorNumber = "collector_number"
        case digital, rarity
        case cardBackID = "card_back_id"
        case artist
        case artistIDS = "artist_ids"
        case illustrationID = "illustration_id"
        case borderColor = "border_color"
        case frame
        case frameEffects = "frame_effects"
        case securityStamp = "security_stamp"
        case fullArt = "full_art"
        case textless, booster
        case storySpotlight = "story_spotlight"
        case edhrecRank = "edhrec_rank"
        case prices
        case relatedUris = "related_uris"
        case purchaseUris = "purchase_uris"
    }
}

// MARK: - AllPart
struct AllPart: Decodable {
    let object, id, component, name: String?
    let typeLine: String?
    let uri: String?

    enum CodingKeys: String, CodingKey {
        case object, id, component, name
        case typeLine = "type_line"
        case uri
    }
}

// MARK: - ImageUris
struct ImageUris: Decodable {
    let small, normal, large: String?
    let png: String?
    let artCrop, borderCrop: String?

    enum CodingKeys: String, CodingKey {
        case small, normal, large, png
        case artCrop = "art_crop"
        case borderCrop = "border_crop"
    }
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

    enum CodingKeys: String, CodingKey {
        case usd
        case usdFoil = "usd_foil"
        case usdEtched = "usd_etched"
        case eur
        case eurFoil = "eur_foil"
        case tix
    }
}

// MARK: - PurchaseUris
struct PurchaseUris: Decodable {
    let tcgplayer, cardmarket, cardhoarder: String?
}

// MARK: - RelatedUris
struct RelatedUris: Decodable {
    let gatherer: String?
    let tcgplayerInfiniteArticles, tcgplayerInfiniteDecks, edhrec: String?

    enum CodingKeys: String, CodingKey {
        case gatherer
        case tcgplayerInfiniteArticles = "tcgplayer_infinite_articles"
        case tcgplayerInfiniteDecks = "tcgplayer_infinite_decks"
        case edhrec
    }
}
