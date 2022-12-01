//
//  RepositoryAPI.swift
//  ChallengeCeiba
//
//  Created by Agustinch on 28/09/2022.
//

import Foundation

protocol RepositoriesAPIProtocol {
    func searchCard(nameCard: String, completionHandler: @escaping (Result<CardsDataModel, NSError>) -> Void)
    func getCardLanguage(url: String, completionHandler: @escaping (Result<CardModel, NSError>) -> Void)
    func nextPage(url: String, completionHandler: @escaping (Result<CardsDataModel, NSError>) -> Void)
}

class RepositoriesAPI: BaseAPI<RepositoriesNetworking>, RepositoriesAPIProtocol {
    
    func searchCard(nameCard: String, completionHandler: @escaping (Result<CardsDataModel, NSError>) -> Void) {
        fetchData(target: .getCards(name: nameCard), responseClass: CardsDataModel.self) { result in
            completionHandler(result)
        }
    }
    
    func getCardLanguage(url: String, completionHandler: @escaping (Result<CardModel, NSError>) -> Void) {
        fetchData(target: .getCardLanguage(url: url), responseClass: CardModel.self) { result in
            completionHandler(result)
        }
    }
    
    func nextPage(url: String, completionHandler: @escaping (Result<CardsDataModel, NSError>) -> Void) {
        fetchData(target: .getNextPage(url: url), responseClass: CardsDataModel.self) { result in
            completionHandler(result)
        }
    }
}
