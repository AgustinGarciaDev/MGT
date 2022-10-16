//
//  ShowCardViewController.swift
//  MTG
//
//  Created by Agustinch on 12/10/2022.
//

import UIKit

class ShowCardViewController: UIViewController {

    var infoCard: CardModel
    
    lazy private var headerProfileView: HeaderProfileView = {
        let headerProfile = HeaderProfileView(model: LangInfo(expantion: infoCard.set, collecterNumber: infoCard.collectorNumber))
        headerProfile.translatesAutoresizingMaskIntoConstraints = false
        return headerProfile
    }()
    
    lazy private var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .blue
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.imageFromURL(urlString: infoCard.imageUris?.normal ?? "")
        return imageView
    }()

    lazy private var cardProfile: CardProfileView = {
        let cardProfileModel = CardProfileInfo(name: infoCard.name ?? "",
                                               typeSpell: infoCard.typeLine ?? "",
                                               artist: infoCard.artist ?? "",
                                               legalities: infoCard.legalities)
        let cardProfile = CardProfileView(cardModel: cardProfileModel)
        cardProfile.translatesAutoresizingMaskIntoConstraints = false
        return cardProfile
    }()

    lazy private var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(headerProfileView)
        view.addSubview(imageView)
        view.addSubview(cardProfile)
        return view
    }()

    lazy private var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.addSubview(contentView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    init(infoCard: CardModel) {
        self.infoCard = infoCard
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        builHierarchy()
        setupConstraints()
    }

    private func builHierarchy() {
        view.addSubview(scrollView)
    }

    private func setupConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            scrollView.widthAnchor.constraint(equalTo: safeArea.widthAnchor),
            scrollView.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            scrollView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            headerProfileView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            headerProfileView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            headerProfileView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            imageView.topAnchor.constraint(equalTo: headerProfileView.bottomAnchor, constant: 20),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            imageView.heightAnchor.constraint(equalToConstant: 480),
            
            cardProfile.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            cardProfile.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            cardProfile.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            cardProfile.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
}
