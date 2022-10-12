//
//  BaseTableCellTitleDescreption.swift
//  HRA
//
//  Created by Qenawi on 13/03/2021.
//  Copyright © 2021 Cashless. All rights reserved.
//

import UIKit
protocol BaseCellProtocol {
    static func getCellTitle() -> String
}

class BaseTableCellTitleDescreption<T: Codable>: UITableViewCell {
    // MARK: - CellView

    lazy var title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
//        if let font = UIFont(name: FontType.boldFont.name, size: 20) {
//            label.font = font
//        }
        label.textAlignment = .natural
        label.textColor = .black
        label.text = "asdlakjsdlkajsdlakjsd"
        return label
    }()

    lazy var descreption: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
//        if let font = UIFont(name: FontType.mediumFont.name, size: 13) {
//            label.font = font
//        }
        label.textAlignment = .natural
        label.textColor = .black
        label.text = "blalbalalbalblablablashdkjahsdkjhasd"
        return label
    }()

    var data: T? {
        didSet {
            updateCellContent()
        }
    }

    open func updateCellContent() {}

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initUI()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    open func initUI() {
        layoutContainer()
        layoutContentView()
    }

    open func layoutContainer() {
        self.addSubview(title)
        self.addSubview(descreption)
        layoutContentView()
    }

    open func layoutContentView() {
        NSLayoutConstraint.activate([
            title.heightAnchor.constraint(equalToConstant: 30),
            title.widthAnchor.constraint(equalToConstant: 300),
            title.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            descreption.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            descreption.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 20),
            descreption.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 5)
        ])
    }
}
