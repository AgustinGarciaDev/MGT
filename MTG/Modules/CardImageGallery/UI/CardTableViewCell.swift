//
//  CardTableViewCell.swift
//  MTG
//
//  Created by Agustinch on 06/10/2022.
//

import UIKit

class CardTableViewCell: UITableViewCell {
   
    lazy private var buttonImage: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    private func setupView() {
        builHierarchy()
        setupConstraints()
    }

    private func builHierarchy() {
        addSubview(buttonImage)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            buttonImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            buttonImage.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            buttonImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            buttonImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
    
    func setImage(imageUrl: String) {
        // TODO: Send to viewModel or configuration extension 
        if let url = URL(string: imageUrl) {
            let task = URLSession.shared.dataTask(with: url) { data, _, error in
                guard let data = data, error == nil else { return }
                DispatchQueue.main.async { /// execute on main thread
                    self.buttonImage.setImage(UIImage(data: data), for: .normal)
                }
            }
            
            task.resume()
        }
    }
}
