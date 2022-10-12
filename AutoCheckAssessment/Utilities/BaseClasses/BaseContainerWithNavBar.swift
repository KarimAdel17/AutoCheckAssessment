//
//  BaseContainerWithTopBar.swift
//  HRA
//
//  Created by Alchemist on 09/03/2021.
//  Copyright © 2021 Cashless. All rights reserved.
//

import Foundation
import UIKit
import MOLH

class BaseContainerWithNavBar: UIView {

    lazy var titleLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
//        label.backgroundColor = .clear
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .black
        label.font = FontType.boldFont.font(size: 20)
        return label
    }()

    lazy var backButton: UIButton = {
        var button = UIButton(type: .system)
        button.isHidden = true
        button.setImage(#imageLiteral(resourceName: "back"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.tintColor = .black
        if MOLHLanguage.currentAppleLanguage() == "ar" {
            button.transform = CGAffineTransform(rotationAngle: 180 - 45)
        }
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTappedBackButton), for: .touchUpInside)
        return button
    }()

    var title: String = "" {
        didSet {
            self.titleLabel.text = title
        }
    }
    
    init(state: BaseContainerNavBarState) {
        super.init(frame: .zero)
        self.backgroundColor = .white
        self.setupTitleLabel()
        self.setupBackButton()
        switch state {
        case .withBackButton:
            self.backButton.isHidden = false
        case .withoutNavButton:
            self.backButton.isHidden = true
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupTitleLabel()
        self.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTitleLabel() {
        self.addSubview(self.titleLabel)
        NSLayoutConstraint.activate([
            self.titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 70),
            self.titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
//            self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 64),
//            self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -64)
        ])
    }

    private func setupBackButton() {
        self.addSubview(self.backButton)
        NSLayoutConstraint.activate([
            self.backButton.widthAnchor.constraint(equalToConstant: 40),
            self.backButton.heightAnchor.constraint(equalToConstant: 40),
            self.backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            self.backButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor)
        ])
    }

    @objc func didTappedBackButton() {}
}

enum BaseContainerNavBarState {
    case withBackButton
    case withoutNavButton
}
