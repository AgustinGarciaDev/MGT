//
//  RepositoryNetwork.swift
//  ChallengeCeiba
//
//  Created by Agustinch on 28/09/2022.
//

import Foundation

enum RepositoriesNetworking {
    case getCards(name: String)
}

extension RepositoriesNetworking: TargetType {
    var baseURL: String {
        switch self {
        default:
            return "https://api.scryfall.com"
        }
    }

    var path: String {
        switch self {
        case .getCards(let name):
            return "/cards/search?order=cmc&q=\(name)"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .getCards:
            return .get
        }
    }

    var task: Task {
        switch self {
        case .getCards:
            return .requestPlain
        }
    }

    var headers: [String: String]? {
        switch self {
        default:
            return [:]
        }
    }

}
