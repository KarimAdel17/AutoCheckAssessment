//
//  BaseTableCell.swift
//  HRA
//
//  Created by Qenawi on 15/03/2021.
//  Copyright © 2021 Cashless. All rights reserved.
//

import UIKit
class BaseTableCell: UITableViewCell {
    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initUI()
    }

    open func initUI() {
        layoutContainer()
        layoutContentView()
    }

    // MARK: - Add Your Sup Views her Using self.addSupView()

    func layoutContainer() {}

    // MARK: - Add Your layOutConstraint Here NSConstraint.active

    func layoutContentView() {}
}
