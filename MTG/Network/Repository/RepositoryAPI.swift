//
//  RepositoryAPI.swift
//  ChallengeCeiba
//
//  Created by Agustinch on 28/09/2022.
//

import Foundation

protocol RepositoriesAPIProtocol {
    func searchCard(completionHandler: @escaping (Result<[CardsDataModel], NSError>) -> Void)
   // func getAllUsers(completionHandler: @escaping (Result<[UserModel], NSError>) -> Void)
 //   func getAllPosts(completionHandler: @escaping (Result<[PostModel], NSError>) -> Void)
}

class RepositoriesAPI: BaseAPI<RepositoriesNetworking>, RepositoriesAPIProtocol {
    func searchCard(completionHandler: @escaping (Result<[CardsDataModel], NSError>) -> Void) {
        
    }

}
