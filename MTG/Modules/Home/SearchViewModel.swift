//
//  MTSearchViewModel.swift
//  MGT
//
//  Created by Agustinch on 03/10/2022.
//

import Foundation

protocol SearchViewModelProtocol: AnyObject {
    func goToSearchCard(nameCard: String)
}

class SearchViewModel: SearchViewModelProtocol {
    
    weak var appCoordinator: Coordinator!

    func goToSearchCard(nameCard: String) {
        appCoordinator.goToCardGallery(cardName: nameCard)
    }

}
