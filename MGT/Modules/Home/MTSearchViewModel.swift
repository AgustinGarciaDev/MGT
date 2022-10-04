//
//  MTSearchViewModel.swift
//  MGT
//
//  Created by Agustinch on 03/10/2022.
//

import Foundation

protocol MTSearchViewModelProtocol: AnyObject {
    func goToSearchCard(nameCard:String)
}

class MTSearchViewModel: MTSearchViewModelProtocol {
    
    weak var appCoordinator: MTCoordinator!

    func goToSearchCard(nameCard: String) {
        appCoordinator.goToCardGallery(cardName: nameCard)
    }

}
