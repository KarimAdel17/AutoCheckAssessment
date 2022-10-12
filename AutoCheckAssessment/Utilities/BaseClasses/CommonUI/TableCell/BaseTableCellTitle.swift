//
//  BaseTableCellTitle.swift
//  HRA
//
//  Created by Qenawi on 14/03/2021.
//  Copyright © 2021 Cashless. All rights reserved.
//

import UIKit

class BaseTableCellTitle<T: Codable>: UITableViewCell {
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
        layoutContentView()
    }

    open func layoutContentView() {
        NSLayoutConstraint.activate([
            title.heightAnchor.constraint(equalToConstant: 30),
            title.widthAnchor.constraint(equalToConstant: 300),
            title.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20)
        ])
    }
}
