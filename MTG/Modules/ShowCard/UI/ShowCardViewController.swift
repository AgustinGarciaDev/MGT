//
//  ShowCardViewController.swift
//  MTG
//
//  Created by Agustinch on 12/10/2022.
//

import UIKit

class ShowCardViewController: UIViewController {

    var infoCard: CardModel
    
    //MARK: UI
    
    lazy private var imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    lazy private var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubViews(with: [imageView])
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
        builHierarchy()
        setupConstraints()
    }
    
    private func builHierarchy(){
        view.addSubViews(with: [scrollView])
    }
    
    private func setupConstraints(){
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeArea.topAnchor,constant: 16),
            scrollView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor,constant: 16),
            scrollView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor,constant: -16),
            scrollView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor,constant: -16),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
            
        ])
    }
}
