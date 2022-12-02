//
//  LoadingViewController.swift
//  MTG
//
//  Created by Agustinch on 07/10/2022.
//

import UIKit
import Lottie

class LoadingScreen: UIView {
    private var lottieAnimation: AnimationView?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    func setupView() {
        self.lottieAnimation = AnimationView(name: "mtg-loader")
        self.lottieAnimation?.frame = bounds
        self.lottieAnimation?.contentMode = .scaleAspectFill
        self.lottieAnimation?.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        self.lottieAnimation?.center = center
        addSubview(self.lottieAnimation!)
        self.lottieAnimation?.loopMode = .loop
        self.lottieAnimation?.play()
    }

}
