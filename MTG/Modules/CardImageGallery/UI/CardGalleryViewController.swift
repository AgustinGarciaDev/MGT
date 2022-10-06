//
//  CardImageGalleryViewController.swift
//  MGT
//
//  Created by Agustinch on 03/10/2022.
//

import UIKit

class CardGalleryViewController: UIViewController {

    // MARK: Private Properties

      private var cardList = [CardModel?]()
    
      var viewModel: CardGalleryViewModelProtocol!
    
    // MARK: UI Components
    
    lazy private var cardListTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CardTableViewCell.self, forCellReuseIdentifier: "CardCell")
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
        view.backgroundColor = .white
        view.addSubViews(with: [cardListTableView])
    }
    
    func  setupConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            cardListTableView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 16),
            cardListTableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            cardListTableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
            cardListTableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -16)
        ])
    }
    
}

extension CardGalleryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cardList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CardCell", for: indexPath) as? CardTableViewCell else {return UITableViewCell()}
        let cardInfo = cardList[indexPath.row]
        cell.setImage(imageUrl: cardInfo?.imageUris?.normal ?? "")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }

}

extension CardGalleryViewController: CardGalleryViewUpdatedProtocol {
    func listCards(_ cards: [CardModel?]) {
        cardList = cards
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            self.cardListTableView.reloadData()
        }
    }
}
