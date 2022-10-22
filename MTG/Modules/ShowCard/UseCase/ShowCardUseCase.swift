//
//  ShowCardUseCase.swift
//  MTG
//
//  Created by Agustinch on 20/10/2022.
//

import Foundation

protocol ShowCardUseCaseProtocol {
   func getNewInfoCardLanguage(url:String, completionHandler: @escaping (Result<CardModel, NSError>) -> Void  )
}

class ShowCardUseCase: ShowCardUseCaseProtocol  {
 
    let api: RepositoriesAPIProtocol

    init(api: RepositoriesAPIProtocol) {
        self.api = api
    }
    
    func getNewInfoCardLanguage(url: String, completionHandler: @escaping (Result<CardModel, NSError>) -> Void) {
        api.getCardLanguage(url: url) { response in
            completionHandler(response)
        }
    }
    
}
