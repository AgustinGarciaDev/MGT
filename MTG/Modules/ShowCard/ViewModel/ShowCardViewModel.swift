//
//  ShowCardViewModel.swift
//  MTG
//
//  Created by Agustinch on 20/10/2022.
//

import Foundation

protocol ShowCardViewModelProtocol {
    var view: ShowCardViewUpdatedProtocol? {get set}
    func sendInformationLanguage(url: String)
}

class ShowCardViewModel: ShowCardViewModelProtocol {

    var useCase: ShowCardUseCaseProtocol
    
    var view: ShowCardViewUpdatedProtocol?

    init(useCase: ShowCardUseCaseProtocol) {
        self.useCase = useCase
    }

    func sendInformationLanguage(url: String) {
        useCase.getNewInfoCardLanguage(url: url) { [weak self] response in
            guard let self = self else {return}
            switch response {
            case .success(let result):
                self.view?.updatedImage(url: result.imageUris?.normal ?? "")
            case .failure(let error):
                self.view?.errorLoadCart()
            }
        }
    }
}
