//
//  CardGalleryCoordinator.swift
//  MGTApp
//
//  Created by Agustinch on 03/10/2022.
//

import Foundation
import UIKit

final class CardGalleryCoordinator: CoordinatorProtocol {
    
    // MARK: Properties
    
    var navigationController: UINavigationController
    var children: [CoordinatorProtocol] = []
    var parentCoordinator: CoordinatorProtocol?
    var cardName: String?
    
    let api = RepositoriesAPI()
    
    // MARK: Init
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: Coordinator Conformance
    
    func start() {
        let useCase  = CardGalleryUseCase(api: api)
        let viewModel = CardGalleryViewModel(useCase: useCase)
        let viewController = CardGalleryViewController.create(with: viewModel)
        viewModel.searchCard(name: cardName ?? "")
        navigationController.pushViewController(viewController, animated: false)
    }
    
}
