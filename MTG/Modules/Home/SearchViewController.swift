//
//  ViewController.swift
//  MGT
//
//  Created by Agustinch on 04/09/2022.
//

import UIKit

class SearchViewController: UIViewController {
    
    // MARK: Private Properties

    private let viewModel: SearchViewModelProtocol
    
    // MARK: UI Components
    
    lazy private var titleHome: UILabel = {
        let title = UILabel()
        title.text = "Search your cart"
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textColor = .white
        return title
    }()
    
    lazy private var searchBar: UITextField = {
        let search = UITextField()
        search.placeholder = "Empieza la busqueda"
        search.backgroundColor = UIColor(named: "SecondaryColor")
        search.translatesAutoresizingMaskIntoConstraints = false
        search.textColor = .white
        search.setupLeftImage(imageName: "magnifyingglass")
        search.clearButtonMode = .always
        search.autocorrectionType = .no
        search.layer.cornerRadius = 15
        search.delegate = self
        search.becomeFirstResponder()
        return search
    }()
    
    // MARK: Initializers

    init(viewModel: SearchViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: View LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "PrimaryColor")
        builHierarchy()
        setupConstraints()
    }
    
    private func builHierarchy() {
        view.addSubViews(with: [titleHome, searchBar  ])
    }
    
    private func setupConstraints() {
        let safeArea = self.view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            titleHome.bottomAnchor.constraint(equalTo: searchBar.topAnchor, constant: -16),
            titleHome.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            titleHome.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),

            searchBar.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor),
            searchBar.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            searchBar.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            searchBar.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
            searchBar.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
}

extension SearchViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let text = searchBar.text else {return false}
        viewModel.goToSearchCard(nameCard: text)
        textField.resignFirstResponder()
        return true
    }
}
