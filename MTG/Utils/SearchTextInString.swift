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
    private let typeMana = ["{R}", "{W}"]

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
