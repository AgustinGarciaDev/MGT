//
//  CardViewGalleryProtocol.swift
//  MTGApp
//
//  Created by Agustinch on 05/10/2022.
//

import Foundation

protocol CardGalleryViewUpdatedProtocol {
    func listCards(_ cards: [CardModel?], nextPage: String?)
    func showError()
}

protocol CardGalleryViewModelProtocol {
    var view: CardGalleryViewUpdatedProtocol? {get set}
    var coordinator: CardGalleryCoordinator? {get set}
    func searchCard(name: String)
    func navigateToShowCardInformation(card: CardModel)
    func nextPage(_ url: String)

}

protocol CardGalleryUseCaseProtocol {
    func searchCard(nameCard: String, completionHandler: @escaping (Result<CardsDataModel, NSError>) -> Void)
    
    func nextPage(url: String, completionHandler: @escaping (Result<CardsDataModel, NSError>) -> Void)
}
