//
//  CardGalleryUseCase.swift
//  MTG
//
//  Created by Agustinch on 05/10/2022.
//

import Foundation

class CardGalleryUseCase: CardGalleryUseCaseProtocol {
    
    let api: RepositoriesAPIProtocol

    init(api: RepositoriesAPIProtocol) {
        self.api = api
    }

    func searchCard(nameCard: String, completionHandler: @escaping (Result<CardsDataModel, NSError>) -> Void) {
        api.searchCard(nameCard: nameCard) { response in
            completionHandler(response)
        }
    }
    
}
