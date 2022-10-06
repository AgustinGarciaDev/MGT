//
//  CardViewGalleryProtocol.swift
//  MTGApp
//
//  Created by Agustinch on 05/10/2022.
//

import Foundation

protocol CardGalleryViewUpdatedProtocol {
    func listCards(_ cards: [CardModel?])
}

protocol CardGalleryViewModelProtocol {
    func searchCard(name: String)
    var view: CardGalleryViewUpdatedProtocol? {get set}
}

protocol CardGalleryUseCaseProtocol {
    func searchCard(nameCard: String, completionHandler: @escaping (Result<CardsDataModel, NSError>) -> Void)
}
