//
//  CardProfileUIView.swift
//  MTG
//
//  Created by Agustinch on 13/10/2022.
//

import Foundation
import UIKit

struct CardProfileInfo {
    let name: String
    let typeSpell: String
    let artist: String
    let legalities: Legalities?
}

struct LegalitiesModel {
    let game: String
    let statusLegal: String
}

class CardProfileView: UIView {

    var cardModel: CardProfileInfo

    var legalitiesInfo = [LegalitiesModel]()

    lazy var spellLabel: UILabel = {
        let label = UILabel()
        label.text = cardModel.name
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var artistLabel: UILabel = {
        let label = UILabel()
        label.text = "Illustrated by \(cardModel.artist)"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var legalitiesTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(LegalitiesViewTableViewCell.self, forCellReuseIdentifier: "CardCell")
        return tableView
    }()

    lazy var stackViewContainer: UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangedSubview(spellLabel)
        stackView.addArrangedSubview(artistLabel)
        stackView.addArrangedSubview(legalitiesTableView)
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    required init(cardModel: CardProfileInfo) {
        self.cardModel = cardModel
        super.init(frame: .zero)
        setup()
        loadData()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        addSubview(stackViewContainer)
        
        setupConstraints()
    }
    
    private func loadData() {
        guard let legalities = cardModel.legalities  else {return}
        legalitiesInfo = [
            LegalitiesModel(game: "Alchemy", statusLegal: legalities.alchemy),
            LegalitiesModel(game: "Brawl", statusLegal: legalities.legacy),
            LegalitiesModel(game: "Commander", statusLegal: legalities.commander),
            LegalitiesModel(game: "Duel", statusLegal: legalities.duel),
            LegalitiesModel(game: "Pauper", statusLegal: legalities.pauper),
            LegalitiesModel(game: "Pauper Commander", statusLegal: legalities.paupercommander),
            LegalitiesModel(game: "Explorer", statusLegal: legalities.explorer),
            LegalitiesModel(game: "Legacy", statusLegal: legalities.legacy),
            LegalitiesModel(game: "Standar", statusLegal: legalities.standard),
            LegalitiesModel(game: "Modern", statusLegal: legalities.modern),
            LegalitiesModel(game: "Pioneer", statusLegal: legalities.pioneer)
        ]
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stackViewContainer.topAnchor.constraint(equalTo: topAnchor),
            stackViewContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackViewContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackViewContainer.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            legalitiesTableView.heightAnchor.constraint(equalToConstant: 350),
            legalitiesTableView.widthAnchor.constraint(equalTo: stackViewContainer.widthAnchor)
        ])
    }
}

extension CardProfileView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return legalitiesInfo.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CardCell",
                                                       for: indexPath) as? LegalitiesViewTableViewCell else { return UITableViewCell() }

        let cardInfo = legalitiesInfo[indexPath.row]
        cell.configuration(model: cardInfo)
        return cell

    }
}
