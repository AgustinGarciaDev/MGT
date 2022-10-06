//
//  CardImageGalleryViewController.swift
//  MGT
//
//  Created by Agustinch on 03/10/2022.
//

import UIKit

class CardGalleryViewController: UIViewController {

    // MARK: Private Properties

      var viewModel: CardGalleryViewModelProtocol!
    
    // MARK: UI Components
    
    // MARK: Initializers
    
    static func create(with viewModel: CardGalleryViewModelProtocol) -> CardGalleryViewController {
        let view = CardGalleryViewController()
        view.viewModel = viewModel
        return view
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        viewModel.view = self
    }
    
}

extension CardGalleryViewController: CardGalleryViewUpdatedProtocol {
    
}
