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
    
    lazy private var cardListTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CardTableViewCell.self, forCellReuseIdentifier: "ContactCell")
        tableView.separatorStyle = .none
        return tableView
    }()
    
    // MARK: Initializers
    
    static func create(with viewModel: CardGalleryViewModelProtocol) -> CardGalleryViewController {
        let view = CardGalleryViewController()
        view.viewModel = viewModel
        return view
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        builHierarchy()
        setupConstraints()
    }
    
    func builHierarchy() {
        
    }
    
    func  setupConstraints() {
        
    }
    
}

extension CardGalleryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }

}

extension CardGalleryViewController: CardGalleryViewUpdatedProtocol {
    
}
