//
//  BaseContainerWithTopBar.swift
//  HRA
//
//  Created by Alchemist on 09/03/2021.
//  Copyright © 2021 Cashless. All rights reserved.
//

import Foundation
import UIKit
//import MOLH

class BaseContainer: UIView {

    lazy var titleLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()

    lazy var backButton: UIButton = {
        var button = UIButton(type: .system)
        button.isHidden = true
//        button.setImage(#imageLiteral(resourceName: "back"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTappedBackButton), for: .touchUpInside)
        return button
    }()

    lazy var cartBTN: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTappedCartButton), for: .touchUpInside)
        return button
    }()

    var title: String = "" {
        didSet {
            self.titleLabel.text = title
        }
    }

    init(state: BaseContainerNavBarState) {
        super.init(frame: .zero)
        self.backgroundColor = #colorLiteral(red: 0.9686275125, green: 0.9686275125, blue: 0.9686276317, alpha: 1)
        addSubViews()
        setupTitleLabel()
        setupBackButton()
        setupCartButton()
        switch state {
        case .withBackButton:
            backButton.isHidden = false
            backButton.backgroundColor = .blue
        case .withoutNavButton:
//            self.backButton.isHidden = true
            backButton.backgroundColor = .black
//            self.backButton.setImage(<#T##image: UIImage?##UIImage?#>, for: .normal)
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupTitleLabel()
        self.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.9803921569, blue: 0.9803921569, alpha: 1)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addSubViews() {
        addSubview(backButton)
        addSubview(titleLabel)
        addSubview(cartBTN)
    }

    private func setupTitleLabel() {
        NSLayoutConstraint.activate([
            self.titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 70),
            self.titleLabel.leadingAnchor.constraint(equalTo: backButton.trailingAnchor, constant: 20),
        ])
    }

    private func setupBackButton() {
        NSLayoutConstraint.activate([
            self.backButton.widthAnchor.constraint(equalToConstant: 40),
            self.backButton.heightAnchor.constraint(equalToConstant: 40),
            self.backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            self.backButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor)
        ])
    }

    private func setupCartButton() {
        NSLayoutConstraint.activate([
            cartBTN.widthAnchor.constraint(equalToConstant: 40),
            cartBTN.heightAnchor.constraint(equalToConstant: 40),
            cartBTN.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            cartBTN.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor)
        ])
    }

    @objc func didTappedBackButton() {}

    @objc func didTappedCartButton() {}
}

enum BaseContainerNavBarState {
    case withBackButton
    case withoutNavButton
}
