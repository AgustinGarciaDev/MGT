//
//  CardGalleryCoordinator.swift
//  MGTApp
//
//  Created by Agustinch on 03/10/2022.
//

import Foundation
import UIKit
import SwiftUI

final class CardGalleryCoordinator: CoordinatorProtocol {
    
    // MARK: Properties
    
    var navigationController: UINavigationController
    var children: [CoordinatorProtocol] = []
    var parentCoordinator: CoordinatorProtocol?
    var cardName: String?
    
    let api = RepositoriesAPI()
    
    private var loadingScreen: LoadingScreen?
    
    // MARK: Init
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: Coordinator Conformance
    
    func start() {
        let useCase  = CardGalleryUseCase(api: api)
        let viewModel = CardGalleryViewModel(useCase: useCase)
        let viewController = CardGalleryViewController.create(with: viewModel)
        viewModel.coordinator = self
        viewModel.searchCard(name: cardName ?? "")
        navigationController.pushViewController(viewController, animated: false)
    }
    
    func showCardViewController(with info: CardModel) {
        let viewController = ShowCardViewController(infoCard: info)
        navigationController.pushViewController(viewController, animated: true)
    }
}
