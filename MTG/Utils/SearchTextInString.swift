//
//  SearchTextInString.swift
//  MTGApp
//
//  Created by Agustinch on 13/10/2022.
//

import Foundation

class SearchTextInString {
    var textDescription: String

    private let typeNumber = ["{0}", "{1}", "{2}", "{3}"]
    private let typeMana = ["{W}", "{B}", "{R}", "{G}", "{U}", "{W}", "{C}", "{S}", "{W/B}", "{W/U}", "{B/R}", "{B/G}", "{U/B}", "{U/R}", "{R/G}", "{R/W}", "{G/W}", "{G/U}", "{G/U/P}", "{2/W}", "{2/U}", "{2/B}", "{2/R}", "{2/G}", "{W/P}", "{U/P}", "{B/P}", "{R/P}", "{G/P}"]

    init(textDescription: String) {
        self.textDescription = textDescription
    }

    func getNumberManaCost() -> String {
        var value = ""
        typeNumber.forEach { number in
            if textDescription.contains(number) {
                value = number
            }
        }
        return value
    }

    func getTypeMana() -> String {
        var value = ""
        typeMana.forEach { number in
            if textDescription.contains(number) {
                value = number
            }
        }
        return value
    }
    
    
}
