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
    private var nextPageInfo: String?

    var viewModel: CardGalleryViewModelProtocol!

    private var loadingScreen: LoadingScreen?

    // MARK: UI Components

    lazy private var cardListTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CardTableViewCell.self, forCellReuseIdentifier: "CardCell")
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white
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
        configurationInitial()
        builHierarchy()
        setupConstraints()
    }

    func configurationInitial() {
        navigationController?.navigationBar.isHidden = true
        showLoadingScreen()
        viewModel.view = self
    }

    func builHierarchy() {
        view.backgroundColor = .white
        view.addSubViews(with: [cardListTableView])
    }

    func setupConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            cardListTableView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 16),
            cardListTableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            cardListTableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            cardListTableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -16)
        ])
    }

    func showLoadingScreen() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self, let window = UIApplication.shared.keyWindow else { return }
            self.loadingScreen = LoadingScreen(frame: window.bounds)
            self.loadingScreen?.backgroundColor = .white
            if let loadingScreen = self.loadingScreen {
                window.addSubview(loadingScreen)
            }
        }
    }

    func hideLoadingScreen() {
        loadingScreen?.removeFromSuperview()
        loadingScreen = nil
        navigationController?.navigationBar.isHidden = false
    }
}

extension CardGalleryViewController: UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cardList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CardCell",
                                                       for: indexPath) as? CardTableViewCell else { return UITableViewCell() }

        let cardInfo = cardList[indexPath.row]
        cell.setImage(imageUrl: cardInfo?.imageUris?.normal ?? "")
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cardInfo = cardList[indexPath.row] else { return }
        viewModel.navigateToShowCardInformation(card: cardInfo)
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentSize.height - scrollView.contentOffset.y - scrollView.frame.height < 100 {
            guard let urlPage = nextPageInfo else { return }
            viewModel.nextPage(urlPage)
        }
    }
}

extension CardGalleryViewController: CardGalleryViewUpdatedProtocol {

    func listCards(_ cards: [CardModel?], nextPage: String?) {
        nextPageInfo = nextPage
        cards.forEach({ cardList.append($0) })
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.cardListTableView.reloadData()
            self.hideLoadingScreen()
        }
    }

    func showError() {
        let alert = UIAlertController(title: "Error al encontrar carta", message: "Intenta nuevamenta", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak self] _ in
            self?.navigationController?.popViewController(animated: true)
            self?.hideLoadingScreen()
        }))
        
        present(alert, animated: true)
    }
}
