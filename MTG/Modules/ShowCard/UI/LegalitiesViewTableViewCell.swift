//
//  LegalitiesViewTableViewCell.swift
//  MTG
//
//  Created by Agustinch on 13/10/2022.
//

import UIKit

class LegalitiesViewTableViewCell: UITableViewCell {
    
    lazy  var badgeText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    lazy var badgeView: UIView = {
        let view = UIView()
        view.addSubview(badgeText)
        view.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        return view
    }()
    
    lazy var nameGameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var containerCell: UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangedSubview(badgeView)
        stackView.addArrangedSubview(nameGameLabel)
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        builHierarchy()
        setupConstraints()
    }
    
    func configuration(model: LegalitiesModel) {
        if model.statusLegal == "legal" {
            badgeView.backgroundColor = UIColor(named: "green-amulete")
            badgeText.text = "Legal"
        } else {
            badgeView.backgroundColor = UIColor(named: "dark-gray")
            badgeText.text = "Not Legal"
        }
        nameGameLabel.text = model.game
    }
    
    func builHierarchy() {
        addSubview(containerCell)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            badgeText.centerXAnchor.constraint(equalTo: badgeView.centerXAnchor),
            badgeView.widthAnchor.constraint(equalToConstant: 82),
            containerCell.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            containerCell.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            containerCell.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            containerCell.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ])
    }
    
}
