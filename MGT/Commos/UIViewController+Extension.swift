//
//  UIViewController+Extension.swift
//  MGT
//
//  Created by Agustinch on 10/09/2022.
//

import Foundation
import UIKit


extension UIView{
    
    func addSubViews(with views: [UIView]){
        views.forEach { view in
            self.addSubview(view)
        }
    }
    
}
