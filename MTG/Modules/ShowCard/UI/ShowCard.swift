//
//  ShowCard.swift
//  MTG
//
//  Created by Agustinch on 08/10/2022.
//

import SwiftUI

struct ShowCard: View {
    var model: CardModel
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ShowCard_Previews: PreviewProvider {
    static var previews: some View {
        let model = Models().model
        ShowCard(model: model)
    }
}
