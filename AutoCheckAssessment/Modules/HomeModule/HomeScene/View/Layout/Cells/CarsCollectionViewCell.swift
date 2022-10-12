//
//  CarsCollectionViewCell.swift
//  AutoCheckAssessment
//
//  Created by Karim on 09/10/2022.
//

import UIKit

class CarsCollectionViewCell: UICollectionViewCell {
    
    var viewModel: CarsData? {
        didSet {
            bindViewModel()
        }
    }
    
    lazy var carImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 20
        image.clipsToBounds = true
        image.layer.borderColor = UIColor.white.cgColor
        image.layer.borderWidth = 2
        image.backgroundColor = #colorLiteral(red: 0.919017911, green: 0.9127629399, blue: 0.9609478116, alpha: 1)
        return image
    }()
    
    lazy var favouriteBTN: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .red
        button.layer.cornerRadius = 10
        return button
    }()
    
    lazy var carInfoContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        return view
    }()
    
    lazy var carInfoStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 5
        stack.alignment = .leading
        stack.distribution = .fill
        return stack
    }()
    
    lazy var carName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = #colorLiteral(red: 0.05484692752, green: 0.07511549443, blue: 0.1587518752, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    lazy var carBrand: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = #colorLiteral(red: 0.7961719632, green: 0.7959364653, blue: 0.8046973348, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    
    lazy var carPrice: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = #colorLiteral(red: 0.05484692752, green: 0.07511549443, blue: 0.1587518752, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    lazy var reviewBTN: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .yellow
        button.backgroundColor = .yellow
        button.layer.cornerRadius = 10
        return button
    }()
    
    lazy var addToCartBTN: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = #colorLiteral(red: 0.05484692752, green: 0.07511549443, blue: 0.1587518752, alpha: 1)
        button.layer.cornerRadius = 15
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = #colorLiteral(red: 0.9607843757, green: 0.9607844949, blue: 0.9607844949, alpha: 1)
        layoutUserInterFace()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutUserInterFace() {
        addSubViews()
        setupCarInfoContainer()
        setupCarImage()
        setupFavouriteBTN()
        setupCarInfoStack()
        setupReviewBTN()
        setupAddToCartBTN()
    }
    
    private func addSubViews() {
        self.contentView.addSubview(carInfoContainer)
        
        carInfoContainer.addSubview(carImage)
        carInfoContainer.addSubview(favouriteBTN)
        
        carInfoContainer.addSubview(carInfoStack)
        carInfoContainer.addSubview(reviewBTN)
        carInfoContainer.addSubview(addToCartBTN)
        
        carInfoStack.addArrangedSubview(carName)
        carInfoStack.addArrangedSubview(carBrand)
        carInfoStack.addArrangedSubview(carPrice)
    }
    
    private func setupCarInfoContainer() {
        NSLayoutConstraint.activate([
            carInfoContainer.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            carInfoContainer.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
            carInfoContainer.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            carInfoContainer.heightAnchor.constraint(equalToConstant: 280)
        ])
    }
    
    private func setupCarImage() {
        NSLayoutConstraint.activate([
            carImage.topAnchor.constraint(equalTo: carInfoContainer.topAnchor, constant: -60),
            carImage.leadingAnchor.constraint(equalTo: carInfoContainer.leadingAnchor, constant: 20),
            carImage.trailingAnchor.constraint(equalTo: carInfoContainer.trailingAnchor, constant: -20),
            carImage.heightAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    private func setupFavouriteBTN() {
        NSLayoutConstraint.activate([
            favouriteBTN.topAnchor.constraint(equalTo: self.carImage.topAnchor, constant: 15),
            favouriteBTN.trailingAnchor.constraint(equalTo: self.carImage.trailingAnchor, constant: -15),
            favouriteBTN.heightAnchor.constraint(equalToConstant: 20),
            favouriteBTN.widthAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    private func setupCarInfoStack() {
        NSLayoutConstraint.activate([
            carInfoStack.topAnchor.constraint(equalTo: carImage.bottomAnchor, constant: 10),
            carInfoStack.leadingAnchor.constraint(equalTo: carImage.leadingAnchor, constant: 15)
        ])
    }
    
    private func setupReviewBTN() {
        NSLayoutConstraint.activate([
            reviewBTN.topAnchor.constraint(equalTo: carInfoStack.topAnchor),
            reviewBTN.trailingAnchor.constraint(equalTo: carImage.trailingAnchor, constant: -20),
            reviewBTN.heightAnchor.constraint(equalToConstant: 20),
            reviewBTN.widthAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    private func setupAddToCartBTN() {
        NSLayoutConstraint.activate([
            addToCartBTN.topAnchor.constraint(equalTo: reviewBTN.bottomAnchor, constant: 20),
            addToCartBTN.trailingAnchor.constraint(equalTo: carImage.trailingAnchor, constant: -20),
            addToCartBTN.heightAnchor.constraint(equalToConstant: 30),
            addToCartBTN.widthAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func bindViewModel() {
        if let viewModel = viewModel {
            if let brandLogo = viewModel.imageURL {
                if let url = URL(string: brandLogo) {
                    self.carImage.kf.indicatorType = .activity
                    self.carImage.kf.setImage(with: url)
                }
            }
            carName.text = viewModel.name
            carBrand.text = viewModel.name
            carPrice.text = viewModel.name
        }
    }
}
