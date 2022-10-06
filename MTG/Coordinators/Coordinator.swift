//
//  MGCordinator.swift
//  MGT
//
//  Created by Agustinch on 06/09/2022.
//

import Foundation
import UIKit

final class Coordinator: CoordinatorProtocol {
    
    // MARK: Properties
    
    var navigationController: UINavigationController
    var children: [CoordinatorProtocol] = []
    var parentCoordinator: CoordinatorProtocol?
    
    // MARK: Init
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: Coordinator Conformance
    
    func start() {
        let viewModel = SearchViewModel()
        viewModel.appCoordinator = self
        let viewController = SearchViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: false)
    }
    
    func goToCardGallery(cardName: String) {
        let cardGalleryCoordinator = CardGalleryCoordinator.init(navigationController: navigationController)
        cardGalleryCoordinator.parentCoordinator = self
        cardGalleryCoordinator.cardName = cardName
        cardGalleryCoordinator.start()
    }
    
}
