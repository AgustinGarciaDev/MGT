//
//  CardGalleryViewMODEL.swift
//  MTGApp
//
//  Created by Agustinch on 05/10/2022.
//

import Foundation

class CardGalleryViewModel: CardGalleryViewModelProtocol {
    
    weak var cardGalleryCoordinator: CardGalleryCoordinator!
    
    private var useCase: CardGalleryUseCaseProtocol
    var view: CardGalleryViewUpdatedProtocol?
    
    init(useCase: CardGalleryUseCaseProtocol) {
        self.useCase = useCase
    }
    
    func searchCard(name: String) {
        useCase.searchCard(nameCard: name) {[weak self] response in
            guard let self = self else {return}
            
            switch response {
            case .success(let cards):
                self.view?.listCards(cards.data)
            case .failure:
                print("ERROR")
            }
        }
    }
}
