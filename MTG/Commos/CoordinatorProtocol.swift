//
//  Coordinator.swift
//  MGT
//
//  Created by Agustinch on 06/09/2022.
//

import Foundation
import UIKit

protocol CoordinatorProtocol: AnyObject {
    var navigationController: UINavigationController { get set }
    var parentCoordinator: CoordinatorProtocol? { get set }
    var children: [CoordinatorProtocol] { get set }
    func start()
}
