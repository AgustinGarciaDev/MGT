//
//  RepositoryAPI.swift
//  ChallengeCeiba
//
//  Created by Agustinch on 28/09/2022.
//

import Foundation

protocol RepositoriesAPIProtocol {
    func searchCard(nameCard: String, completionHandler: @escaping (Result<CardsDataModel, NSError>) -> Void)
}

class RepositoriesAPI: BaseAPI<RepositoriesNetworking>, RepositoriesAPIProtocol {
    func searchCard(nameCard: String, completionHandler: @escaping (Result<CardsDataModel, NSError>) -> Void) {
        fetchData(target: .getCards(name: nameCard), responseClass: CardsDataModel.self) { result in
            completionHandler(result)
        }
    }
}
