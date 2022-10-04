//
//  MGCordinator.swift
//  MGT
//
//  Created by Agustinch on 06/09/2022.
//

import Foundation
import UIKit

final class MTCoordinator: CoordinatorProtocol {
    
    // MARK: Properties
    
    var navigationController: UINavigationController
    var children: [CoordinatorProtocol] = []
    var parentCoordinator: CoordinatorProtocol?
    
    // MARK: Init
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    // MARK: Coordinator Conformance
    
    func start() {
        let viewModel = MTSearchViewModel()
        viewModel.appCoordinator = self
        let viewController = MTSearchViewController(viewModel:viewModel)
        navigationController.pushViewController(viewController, animated: false)
    }
    
    func goToCardGallery(cardName:String){
        let cardGalleryCoordinator = MTCardGalleryCoordinator.init(navigationController: navigationController)
        cardGalleryCoordinator.parentCoordinator = self
        cardGalleryCoordinator.cardName = cardName
        cardGalleryCoordinator.start()
    }
    
}
