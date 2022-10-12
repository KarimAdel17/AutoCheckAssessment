//
//  FloatingButton + Corner.swift
//  HRA
//
//  Created by Qenawi on 15/03/2021.
//  Copyright © 2021 Cashless. All rights reserved.
//

import UIKit

class FloatingButton: BaseUIView {
    // MARK: - UI Component

    lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 7
        return view
    }()

    lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: uiImagePath)
        return view
    }()

    // @Custom Constructor With Params
    var uiImagePath: String = ""

    required init(photoPath: String) {
        self.uiImagePath = photoPath
        super.init(frame: .zero)
    }

    // @ inject component in view
    override func addSupViews() {
        self.addSubview(self.containerView)
        // @ Container View
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5)
        ])
        // @ Image View
        self.containerView.addSubview(self.imageView)
    }

    override func layoutViews() {
        NSLayoutConstraint.activate([
            self.imageView.topAnchor.constraint(equalTo: self.containerView.topAnchor, constant: 5),
            self.imageView.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: 5),
            self.imageView.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: -5),
            self.imageView.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor, constant: -5)
        ])
    }
}

// MARK: - Base UI View

class BaseUIView: UIView {
    // @ Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSupViews()
        layoutViews()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addSupViews() {}
    func layoutViews() {}
}
