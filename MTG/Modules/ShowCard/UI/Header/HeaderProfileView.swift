//
//  ShowCardHeader.swift
//  MTG
//
//  Created by Agustinch on 15/10/2022.
//

import UIKit

struct LangInfo {
    let expantion: String
    let collecterNumber: String
}

class HeaderProfileView: UIView {

    var langInfo: LangInfo

    var listlanguages = ["EN", "ES", "FR", "DE", "IT", "JA", "KO", "RU"]

    lazy var collectionlanguageView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: bounds, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(LanguageCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    init(model: LangInfo) {
        self.langInfo = model
        super.init(frame: .zero)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        addSubview(collectionlanguageView)
        collectionlanguageView.reloadData()
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionlanguageView.topAnchor.constraint(equalTo: topAnchor),
            collectionlanguageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            collectionlanguageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionlanguageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionlanguageView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

extension HeaderProfileView: UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listlanguages.count
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("celda click \(indexPath.row)")
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? LanguageCollectionViewCell else { return UICollectionViewCell() }

  //      cell.contentView.isUserInteractionEnabled = false
        cell.configurationCell(with: listlanguages[indexPath.row])
        return cell
    }
}
