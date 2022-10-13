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
    let manaCost: String
    let description: String
    let typeSpell: String
    let artist: String
    let legalities: Legalities
}

class CardProfileView: UIView {

    var cardModel: CardProfileInfo
    
    //MARK: UI
    
    lazy var spellLabel: UILabel = {
        let label = UILabel()
        label.text = cardModel.name
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var artistLabel: UILabel = {
        let label = UILabel()
        label.text = "Illustrated by \( cardModel.artist)"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var stackViewContainer: UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangedSubview(spellLabel)
        stackView.addArrangedSubview(artistLabel)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    required init(cardModel: CardProfileInfo) {
        self.cardModel = cardModel
        super.init(frame: .zero)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
