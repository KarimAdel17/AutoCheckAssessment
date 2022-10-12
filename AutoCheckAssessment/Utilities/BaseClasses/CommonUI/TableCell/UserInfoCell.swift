//
//  UserInfoCell.swift
//  HRA
//
//  Created by Qenawi on 14/03/2021.
//  Copyright © 2021 Cashless. All rights reserved.
//

import UIKit
class UserInfoCell: UITableViewCell, BaseCellProtocol {
    let smallIconSize = CGFloat(25)

    static func getCellTitle() -> String {
        "UserInfoCell"
    }

    // @ UI Component
    lazy var fullName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
//        if let font = UIFont(name: FontType.mediumFont.name, size: 15) {
//            label.font = font
//        }
        label.textAlignment = .natural
        label.textColor = .black
        label.text = "asdlakjsdlkajsdlakjsd"
        return label
    }()

    lazy var jopTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
//        if let font = UIFont(name: FontType.mediumFont.name, size: 15) {
//            label.font = font
//        }
        label.textAlignment = .natural
        label.textColor = .black
        label.text = "asdlakjsdlkajsdlakjsd"
        return label
    }()

    lazy var teamTag: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
//        if let font = UIFont(name: FontType.mediumFont.name, size: 15) {
//            label.font = font
//        }
        label.textAlignment = .natural
        label.textColor = .black
        label.text = "asdlakjsdlkajsdlakjsd"
        return label
    }()

    lazy var firstPhone: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
//        if let font = UIFont(name: FontType.mediumFont.name, size: 15) {
//            label.font = font
//        }
        label.textAlignment = .natural
        label.textColor = .black
        label.text = "asdlakjsdlkajsdlakjsd"
        return label
    }()

    lazy var secondPhone: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
//        if let font = UIFont(name: FontType.mediumFont.name, size: 15) {
//            label.font = font
//        }
        label.textAlignment = .natural
        label.textColor = .black
        label.text = "asdlakjsdlkajsdlakjsd"
        return label
    }()

    lazy var email: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
//        if let font = UIFont(name: FontType.boldFont.name, size: 15) {
//            label.font = font
//        }
        label.textAlignment = .natural
        label.textColor = .black
        label.text = "asdlakjsdlkajsdlakjsd"
        return label
    }()

    lazy var firstPhoneImg: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Notifications")

        return image
    }()

    lazy var secondPhoneImg: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Notifications")

        return image
    }()

    lazy var emailImg: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Notifications")
        return image
    }()

    lazy var userImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Notifications")

        return image
    }()

    //
    var cellData: UserInfoCellModel? {
        didSet {
            populateCell()
        }
    }

    private func populateCell() {}

    // @Cell Init

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
        // @ header
        self.addSubview(userImage)
        self.addSubview(fullName)
        self.addSubview(jopTitle)
        self.addSubview(teamTag)
        self.addSubview(fullName)
        // @ FirstPhone
        self.addSubview(firstPhone)
        self.addSubview(firstPhoneImg)
        // @ SecondPhone
        self.addSubview(secondPhone)
        self.addSubview(secondPhoneImg)
        // @ Fotter
        self.addSubview(email)
        self.addSubview(emailImg)
        layoutContentView()
    }

    open func layoutContentView() {
        // Header
        NSLayoutConstraint.activate([
            userImage.heightAnchor.constraint(equalToConstant: 75),
            userImage.widthAnchor.constraint(equalToConstant: 75),
            userImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            userImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            fullName.topAnchor.constraint(equalTo: userImage.topAnchor, constant: -5),
            fullName.leadingAnchor.constraint(equalTo: userImage.trailingAnchor, constant: 12),
            fullName.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 10),

            jopTitle.topAnchor.constraint(equalTo: fullName.bottomAnchor, constant: 2),
            jopTitle.leadingAnchor.constraint(equalTo: userImage.trailingAnchor, constant: 12),
            jopTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 10),

            teamTag.topAnchor.constraint(equalTo: jopTitle.bottomAnchor, constant: 2),
            teamTag.leadingAnchor.constraint(equalTo: userImage.trailingAnchor, constant: 12),
            teamTag.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 10)

        ])
        // firstPhone
        NSLayoutConstraint.activate([
            firstPhoneImg.heightAnchor.constraint(equalToConstant: smallIconSize),
            firstPhoneImg.widthAnchor.constraint(equalToConstant: smallIconSize),
            firstPhoneImg.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            firstPhoneImg.topAnchor.constraint(equalTo: self.teamTag.bottomAnchor, constant: 25),
            firstPhone.topAnchor.constraint(equalTo: firstPhoneImg.topAnchor, constant: 0),
            firstPhone.leadingAnchor.constraint(equalTo: firstPhoneImg.trailingAnchor, constant: 16)

        ])
        // secondPhone
        NSLayoutConstraint.activate([
            secondPhoneImg.heightAnchor.constraint(equalToConstant: smallIconSize),
            secondPhoneImg.widthAnchor.constraint(equalToConstant: smallIconSize),
            secondPhoneImg.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            secondPhoneImg.topAnchor.constraint(equalTo: self.firstPhoneImg.bottomAnchor, constant: 10),
            secondPhone.topAnchor.constraint(equalTo: secondPhoneImg.topAnchor, constant: 0),
            secondPhone.leadingAnchor.constraint(equalTo: firstPhoneImg.trailingAnchor, constant: 16)

        ])
        // fotter
        NSLayoutConstraint.activate([
            emailImg.heightAnchor.constraint(equalToConstant: smallIconSize),
            emailImg.widthAnchor.constraint(equalToConstant: smallIconSize),
            emailImg.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            emailImg.topAnchor.constraint(equalTo: self.secondPhoneImg.bottomAnchor, constant: 10),
            email.topAnchor.constraint(equalTo: emailImg.topAnchor, constant: 0),
            email.leadingAnchor.constraint(equalTo: firstPhoneImg.trailingAnchor, constant: 16)

        ])
    }
}

struct UserInfoCellModel {
    init(a: String, b: String, c: String, d: String) {
        img = a
        fullName = b
        jopTitle = c
        teamTagName = d
    }

    let img: String?
    let fullName: String?
    let jopTitle: String?
    let teamTagName: String?
}
