//
//  UITextField+Extension.swift
//  MGT
//
//  Created by Agustinch on 10/09/2022.
//

import UIKit

extension UITextField {
    func setupLeftImage(imageName:String){
         let imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 20, height: 20))
         imageView.image = UIImage(systemName: imageName)
         let imageContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
         imageContainerView.addSubview(imageView)
         leftView = imageContainerView
         leftViewMode = .always
         self.tintColor = .white
       }

}
