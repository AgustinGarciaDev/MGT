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
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "Search your cart MTG"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }()

    lazy private var searchBar: UITextField = {
        let search = UITextField()
        search.placeholder = "Empieza la busqueda"
        search.translatesAutoresizingMaskIntoConstraints = false
        search.textColor = .black
        search.setupLeftImage(imageName: "magnifyingglass")
        search.clearButtonMode = .always
        search.autocorrectionType = .no
        search.layer.cornerRadius = 15
        search.delegate = self
        search.becomeFirstResponder()
        search.layer.borderWidth = 1
        search.layer.borderColor = UIColor(named: "SecondaryColor")?.cgColor
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
        view.backgroundColor = .white
        builHierarchy()
        setupConstraints()
    }

    private func builHierarchy() {
        view.addSubViews(with: [titleHome, searchBar])
    }

    private func setupConstraints() {
        let safeArea = self.view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            titleHome.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 16),
            titleHome.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            titleHome.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),

            searchBar.topAnchor.constraint(equalTo: titleHome.bottomAnchor, constant: 16),
            searchBar.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            searchBar.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            searchBar.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
            searchBar.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}

extension SearchViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let text = searchBar.text else { return false }
        viewModel.goToSearchCard(nameCard: text)
        textField.resignFirstResponder()
        return true
    }
}
