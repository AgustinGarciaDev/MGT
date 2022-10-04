//
//  MTCardGalleryCoordinator.swift
//  MGTApp
//
//  Created by Agustinch on 03/10/2022.
//

import Foundation
import UIKit

final class MTCardGalleryCoordinator: CoordinatorProtocol {
    
    // MARK: Properties
    
    var navigationController: UINavigationController
    var children: [CoordinatorProtocol] = []
    var parentCoordinator: CoordinatorProtocol?
    var cardName: String?
    
    // MARK: Init
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    // MARK: Coordinator Conformance
    
    func start() {
        print("name card \(cardName)")
       // let viewController = MTCardGalleryViewController()
     //   navigationController.pushViewController(viewController, animated: false)
    }
    
   
    
}
