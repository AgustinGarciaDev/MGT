//
//  ShowCardViewController.swift
//  MTG
//
//  Created by Agustinch on 12/10/2022.
//

import UIKit

class ShowCardViewController: UIViewController {

    var infoCard: CardModel
    
    init(infoCard: CardModel) {
        self.infoCard = infoCard
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
